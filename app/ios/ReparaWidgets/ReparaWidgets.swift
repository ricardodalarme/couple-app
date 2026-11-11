import SwiftUI
import WidgetKit

struct ReparaWidgetPayload: Codable {
  let isSignedIn: Bool
  let discreet: Bool
  let isPaired: Bool
  let hasPlus: Bool
  let showNames: Bool
  let allowPartnerNotes: Bool
  let onLockScreen: Bool
  let isOffline: Bool
  let togetherSince: String?
  let relationshipPhase: String?
  let partnerName: String?
  let nextDateTitle: String?
  let nextDateOn: String?
  let unopenedCards: Int
  let cardState: String
  let pauseReturnAt: String?
  let partnerNote: String?
  let partnerNoteMedia: String?
  let partnerNoteAt: String?
  let partnerMood: String?
  let myMood: String?
  let ritualTitle: String?
  let ritualSchedule: String?
  let dailyIdeaTitle: String?
  let slipsCount: Int
  let suggestionKey: String?
  let cachedPhotoPath: String?
  let updatedAt: String

  static let appGroupId = "group.com.ricardodalarme.flutterBlocStarter"
  static let payloadKey = "repara_widget_payload"

  static func signedOut() -> ReparaWidgetPayload {
    ReparaWidgetPayload(
      isSignedIn: false,
      discreet: false,
      isPaired: false,
      hasPlus: false,
      showNames: false,
      allowPartnerNotes: false,
      onLockScreen: false,
      isOffline: false,
      togetherSince: nil,
      relationshipPhase: nil,
      partnerName: nil,
      nextDateTitle: nil,
      nextDateOn: nil,
      unopenedCards: 0,
      cardState: "none",
      pauseReturnAt: nil,
      partnerNote: nil,
      partnerNoteMedia: nil,
      partnerNoteAt: nil,
      partnerMood: nil,
      myMood: nil,
      ritualTitle: nil,
      ritualSchedule: nil,
      dailyIdeaTitle: nil,
      slipsCount: 0,
      suggestionKey: nil,
      cachedPhotoPath: nil,
      updatedAt: ""
    )
  }

  static func loadFromSharedStore() -> ReparaWidgetPayload {
    guard
      let defaults = UserDefaults(suiteName: appGroupId),
      let raw = defaults.string(forKey: payloadKey),
      let data = raw.data(using: .utf8),
      let decoded = try? JSONDecoder().decode(ReparaWidgetPayload.self, from: data)
    else {
      return signedOut()
    }
    return decoded
  }

  func daysTogether(on now: Date = Date()) -> Int? {
    guard isSignedIn, !discreet, let raw = togetherSince, !raw.isEmpty else { return nil }
    guard let start = Self.parseLocalDate(raw) else { return nil }
    let calendar = Calendar.current
    let startOfStart = calendar.startOfDay(for: start)
    let startOfToday = calendar.startOfDay(for: now)
    let diff = calendar.dateComponents([.day], from: startOfStart, to: startOfToday).day ?? 0
    return max(0, diff)
  }

  func daysUntilNextDate(on now: Date = Date()) -> Int? {
    guard isSignedIn, !discreet, let raw = nextDateOn, !raw.isEmpty else { return nil }
    guard let target = Self.parseLocalDate(raw) else { return nil }
    let calendar = Calendar.current
    let startOfToday = calendar.startOfDay(for: now)
    let startOfTarget = calendar.startOfDay(for: target)
    let diff = calendar.dateComponents([.day], from: startOfToday, to: startOfTarget).day ?? -1
    return diff >= 0 ? diff : nil
  }

  func isPauseActive(on now: Date = Date()) -> Bool {
    guard let raw = pauseReturnAt, !raw.isEmpty else { return false }
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    if let date = formatter.date(from: raw) {
      return date > now
    }
    let fallback = ISO8601DateFormatter()
    if let date = fallback.date(from: raw) {
      return date > now
    }
    return false
  }

  func pauseUntilTimeLabel() -> String? {
    guard let raw = pauseReturnAt, !raw.isEmpty else { return nil }
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    let date = formatter.date(from: raw) ?? ISO8601DateFormatter().date(from: raw)
    guard let resolved = date else { return nil }
    let display = DateFormatter()
    display.dateFormat = "HH:mm"
    return display.string(from: resolved)
  }

  private static func parseLocalDate(_ raw: String) -> Date? {
    let prefix = String(raw.prefix(10))
    let parts = prefix.split(separator: "-")
    guard parts.count == 3,
      let year = Int(parts[0]),
      let month = Int(parts[1]),
      let day = Int(parts[2])
    else { return nil }
    var components = DateComponents()
    components.year = year
    components.month = month
    components.day = day
    return Calendar.current.date(from: components)
  }
}

struct ReparaWidgetEntry: TimelineEntry {
  let date: Date
  let payload: ReparaWidgetPayload
}

struct ReparaTimelineProvider: TimelineProvider {
  let refreshesAtMidnight: Bool

  init(refreshesAtMidnight: Bool = false) {
    self.refreshesAtMidnight = refreshesAtMidnight
  }

  func placeholder(in context: Context) -> ReparaWidgetEntry {
    ReparaWidgetEntry(date: Date(), payload: ReparaWidgetPayload.loadFromSharedStore())
  }

  func getSnapshot(in context: Context, completion: @escaping (ReparaWidgetEntry) -> Void) {
    completion(ReparaWidgetEntry(date: Date(), payload: ReparaWidgetPayload.loadFromSharedStore()))
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<ReparaWidgetEntry>) -> Void) {
    let now = Date()
    let payload = ReparaWidgetPayload.loadFromSharedStore()
    let entry = ReparaWidgetEntry(date: now, payload: payload)

    let fifteenMinutes = Calendar.current.date(byAdding: .minute, value: 15, to: now) ?? now.addingTimeInterval(900)
    var nextRefresh = fifteenMinutes
    if refreshesAtMidnight,
      let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Calendar.current.startOfDay(for: now))
    {
      nextRefresh = min(fifteenMinutes, tomorrow)
    }

    completion(Timeline(entries: [entry], policy: .after(nextRefresh)))
  }
}

struct ReparaSurfaceCard<Content: View>: View {
  @Environment(\.colorScheme) private var colorScheme
  let deepLink: String
  @ViewBuilder let content: () -> Content

  var body: some View {
    let bg = colorScheme == .dark
      ? Color(red: 0.11, green: 0.11, blue: 0.12)
      : Color(red: 0.99, green: 0.97, blue: 0.96)
    let contentView = VStack(alignment: .leading, spacing: 6) {
      content()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    .padding(14)
    .widgetURL(URL(string: deepLink))

    if #available(iOSApplicationExtension 17.0, *) {
      contentView.containerBackground(bg, for: .widget)
    } else {
      contentView.background(bg)
    }
  }
}

struct ReparaOwnSmallWidgetView: View {
  let entry: ReparaWidgetEntry

  var body: some View {
    let p = entry.payload
    if !p.isSignedIn {
      return AnyView(
        ReparaSurfaceCard(deepLink: "repara://sign-in?homeWidget=1") {
          Text("REPARA")
            .font(.caption2.weight(.semibold))
            .foregroundColor(.secondary)
            .lineLimit(1)
          Spacer(minLength: 4)
          Text("Toque para entrar")
            .font(.subheadline.weight(.semibold))
            .lineLimit(2)
        }
      )
    }

    if p.discreet {
      return AnyView(
        ReparaSurfaceCard(deepLink: "repara://settings/discreet?homeWidget=1") {
          Text("LEMBRETE")
            .font(.caption2.weight(.semibold))
            .foregroundColor(.secondary)
            .lineLimit(1)
          Spacer(minLength: 4)
          Text("Texto neutro")
            .font(.subheadline.weight(.semibold))
            .lineLimit(2)
        }
      )
    }

    if let days = p.daysUntilNextDate(on: entry.date), let title = p.nextDateTitle {
      return AnyView(
        ReparaSurfaceCard(deepLink: "repara://dates?homeWidget=1") {
          Text("PRÓXIMA DATA")
            .font(.caption2.weight(.semibold))
            .foregroundColor(.secondary)
            .lineLimit(1)
          Spacer(minLength: 4)
          Text("\(days) dias")
            .font(.headline.weight(.semibold))
            .lineLimit(1)
          Text(title)
            .font(.caption)
            .foregroundColor(.secondary)
            .lineLimit(1)
        }
      )
    }

    return AnyView(
      ReparaSurfaceCard(deepLink: "repara://capture?homeWidget=1") {
        Text("ANOTAR SLIP")
          .font(.caption2.weight(.semibold))
          .foregroundColor(.secondary)
          .lineLimit(1)
        Spacer(minLength: 4)
        Text("+ Slip")
          .font(.headline.weight(.semibold))
          .lineLimit(1)
        Text("Toque para anotar")
          .font(.caption)
          .foregroundColor(.secondary)
          .lineLimit(2)
      }
    )
  }
}

struct ReparaOwnMediumWidgetView: View {
  let entry: ReparaWidgetEntry

  var body: some View {
    let p = entry.payload
    if !p.isSignedIn {
      return AnyView(
        ReparaSurfaceCard(deepLink: "repara://sign-in?homeWidget=1") {
          Text("REPARA")
            .font(.caption2.weight(.semibold))
            .foregroundColor(.secondary)
            .lineLimit(1)
          Text("Toque para entrar")
            .font(.headline.weight(.semibold))
            .lineLimit(2)
        }
      )
    }

    if p.discreet {
      return AnyView(
        ReparaSurfaceCard(deepLink: "repara://settings/discreet?homeWidget=1") {
          Text("LEMBRETE")
            .font(.caption2.weight(.semibold))
            .foregroundColor(.secondary)
            .lineLimit(1)
          Text("Texto neutro")
            .font(.headline.weight(.semibold))
            .lineLimit(2)
        }
      )
    }

    let idea = p.dailyIdeaTitle ?? "Deixe um bilhete hoje"
    return AnyView(
      ReparaSurfaceCard(deepLink: "repara://today?homeWidget=1") {
        Text("IDEIA DO DIA")
          .font(.caption2.weight(.semibold))
          .foregroundColor(.secondary)
          .lineLimit(1)
        Text(idea)
          .font(.subheadline.weight(.semibold))
          .lineLimit(2)
        Spacer(minLength: 2)
        Text("Toque para ver · Privado no seu aparelho")
          .font(.caption2)
          .foregroundColor(.secondary)
          .lineLimit(1)
      }
    )
  }
}

struct ReparaOwnSmallWidget: Widget {
  let kind: String = "ReparaOwnSmallWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: ReparaTimelineProvider()) { entry in
      ReparaOwnSmallWidgetView(entry: entry)
    }
    .configurationDisplayName("Repara · Meu (pequeno)")
    .description("Anotar slip, próxima data, humor ou ritual.")
    .supportedFamilies([.systemSmall])
  }
}

struct ReparaOwnMediumWidget: Widget {
  let kind: String = "ReparaOwnMediumWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: ReparaTimelineProvider()) { entry in
      ReparaOwnMediumWidgetView(entry: entry)
    }
    .configurationDisplayName("Repara · Meu (médio)")
    .description("Ideia do dia ou potinho do dia ruim.")
    .supportedFamilies([.systemMedium])
  }
}

struct ReparaLockScreenWidgetView: View {
  @Environment(\.widgetFamily) private var family
  let entry: ReparaWidgetEntry

  var body: some View {
    let p = entry.payload
    let isPause = p.isPauseActive(on: entry.date)
    let deepLink = !p.isSignedIn
      ? "repara://sign-in?homeWidget=1"
      : (p.discreet ? "repara://settings/discreet?homeWidget=1" : (isPause ? "repara://pause?homeWidget=1" : "repara://today?homeWidget=1"))

    switch family {
    case .accessoryCircular:
      ZStack {
        AccessoryWidgetBackground()
        Image(systemName: p.discreet ? "circle.dotted" : (isPause ? "moon.zzz.fill" : "heart"))
          .font(.system(size: 18, weight: .semibold))
      }
      .widgetURL(URL(string: deepLink))
    case .accessoryInline:
      if p.discreet || !p.isSignedIn {
        Label("Lembrete", systemImage: "circle.dotted")
          .widgetURL(URL(string: deepLink))
      } else if isPause, let until = p.pauseUntilTimeLabel() {
        Label("Pausa · até \(until)", systemImage: "moon.zzz.fill")
          .widgetURL(URL(string: deepLink))
      } else {
        Label("Momento calmo", systemImage: "heart")
          .widgetURL(URL(string: deepLink))
      }
    default:
      VStack(alignment: .leading, spacing: 2) {
        if p.discreet || !p.isSignedIn {
          Label("Lembrete", systemImage: "circle.dotted")
            .font(.caption.weight(.semibold))
            .lineLimit(1)
          Text("Texto neutro")
            .font(.caption2)
            .foregroundColor(.secondary)
            .lineLimit(1)
        } else if isPause {
          Label("Pausa em andamento", systemImage: "moon.zzz.fill")
            .font(.caption.weight(.semibold))
            .lineLimit(1)
          Text(p.pauseUntilTimeLabel().map { "até \($0)" } ?? "Toque quando estiver pronto")
            .font(.caption2)
            .foregroundColor(.secondary)
            .lineLimit(1)
        } else {
          Label("Momento calmo", systemImage: "heart")
            .font(.caption.weight(.semibold))
            .lineLimit(1)
          Text("Sem nomes na tela bloqueada")
            .font(.caption2)
            .foregroundColor(.secondary)
            .lineLimit(1)
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .widgetURL(URL(string: deepLink))
    }
  }
}

struct ReparaLockScreenWidget: Widget {
  let kind: String = "ReparaLockScreenWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: ReparaTimelineProvider()) { entry in
      if #available(iOSApplicationExtension 17.0, *) {
        ReparaLockScreenWidgetView(entry: entry)
          .containerBackground(.clear, for: .widget)
      } else {
        ReparaLockScreenWidgetView(entry: entry)
      }
    }
    .configurationDisplayName("Repara · Tela de bloqueio")
    .description("Símbolo e frase genérica, sem nomes nem mensagens.")
    .supportedFamilies([.accessoryCircular, .accessoryRectangular, .accessoryInline])
  }
}

@main
struct ReparaWidgetsBundle: WidgetBundle {
  var body: some Widget {
    ReparaOwnSmallWidget()
    ReparaOwnMediumWidget()
    ReparaLockScreenWidget()
  }
}
