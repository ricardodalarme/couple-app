import SwiftUI
import UIKit
import WidgetKit

enum ReparaL10n {
  static var isEnglish: Bool {
    let code = (Locale.preferredLanguages.first ?? Locale.current.identifier).lowercased()
    return code.hasPrefix("en")
  }

  static func tr(pt: String, en: String) -> String {
    isEnglish ? en : pt
  }

  static var signedOutLabel: String { "REPARA" }
  static var signedOutTitle: String { tr(pt: "Toque para entrar", en: "Tap to sign in") }
  static var discreetLabel: String { tr(pt: "LEMBRETE", en: "REMINDER") }
  static var discreetShortLabel: String { tr(pt: "Lembrete", en: "Reminder") }
  static var discreetTitle: String { tr(pt: "Texto neutro", en: "Neutral text") }
  static var unpairedLabel: String { tr(pt: "JUNTOS", en: "TOGETHER") }
  static var unpairedTitle: String { tr(pt: "Convide para ver aqui", en: "Invite to see here") }
  static var unpairedAction: String { tr(pt: "Convidar", en: "Invite") }

  static var nextDateLabel: String { tr(pt: "PRÓXIMA DATA", en: "NEXT DATE") }
  static func daysCount(_ days: Int) -> String {
    tr(pt: "\(days) dias", en: "\(days) days")
  }
  static var ritualLabel: String { "RITUAL" }
  static var ritualDefaultSchedule: String { tr(pt: "Momento da semana", en: "Weekly moment") }
  static var moodLabel: String { tr(pt: "MEU HUMOR", en: "MY MOOD") }
  static var moodSubtitle: String { tr(pt: "Toque para atualizar", en: "Tap to update") }
  static var slipLabel: String { tr(pt: "ANOTAR SLIP", en: "QUICK SLIP") }
  static var slipTitle: String { "+ Slip" }
  static var slipSubtitle: String { tr(pt: "Toque para anotar", en: "Tap to capture") }

  static var jarLabel: String { tr(pt: "POTINHO DO DIA RUIM", en: "BAD-DAY JAR") }
  static func jarSavedCount(_ count: Int) -> String {
    tr(pt: "\(count) motivos guardados", en: "\(count) saved reasons")
  }
  static var jarSubtitle: String { tr(pt: "Para abrir quando precisar", en: "To open when you need it") }
  static var ideaLabel: String { tr(pt: "IDEIA DO DIA", en: "IDEA OF THE DAY") }
  static var ideaDefault: String { tr(pt: "Deixe um bilhete hoje", en: "Leave a short note today") }
  static var ideaSubtitle: String {
    tr(pt: "Toque para ver · Privado no seu aparelho", en: "Tap to view · Private on your device")
  }

  static var lockCalmMoment: String { tr(pt: "Momento calmo", en: "Calm moment") }
  static var lockNoNamesHint: String {
    tr(pt: "Sem nomes na tela bloqueada", en: "No names on the lock screen")
  }

  static var counterLabel: String { tr(pt: "JUNTOS HÁ", en: "TOGETHER FOR") }
  static var counterUnset: String { tr(pt: "Começando agora", en: "Starting now") }
  static var counterDefaultSubtitle: String { tr(pt: "Tempo juntos", en: "Time together") }

  static var photoLabel: String { tr(pt: "MEMÓRIA", en: "MEMORY") }
  static var photoPlusOnly: String { tr(pt: "Disponível no Plus", en: "Available on Plus") }
  static var photoCachedSubtitle: String {
    tr(pt: "Memória salva neste aparelho", en: "Memory saved on this device")
  }
  static func photoDaysTogether(_ days: Int) -> String {
    tr(pt: "\(days) dias juntos", en: "\(days) days together")
  }
  static var photoFallbackTitle: String { tr(pt: "Um momento nosso", en: "A moment of ours") }
  static var photoNoPhoto: String { tr(pt: "Sem foto selecionada", en: "No photo selected") }

  static func noteFromNamed(_ name: String) -> String {
    tr(pt: "DE \(name.uppercased())", en: "FROM \(name.uppercased())")
  }
  static var noteFromDefault: String { tr(pt: "RECADO DO PAR", en: "PARTNER NOTE") }
  static var noteReplyHint: String { tr(pt: "Responder com um coração", en: "Reply with a heart") }
  static var noteEmpty: String { tr(pt: "Sem recado novo no momento", en: "No new note right now") }

  static var cardPauseLabel: String { tr(pt: "CARTÃO E ENCONTRO", en: "CARD & DATE") }
  static var cardPauseTitle: String { tr(pt: "Pausa em andamento", en: "Pause in progress") }
  static var cardPauseSubtitle: String {
    tr(pt: "Toque quando estiver pronto", en: "Tap when you are ready")
  }
  static var cardWeeklyLabel: String { tr(pt: "CARTÃO DA SEMANA", en: "WEEKLY CARD") }
  static var cardReadyTitle: String { tr(pt: "Chegou um cartão", en: "A card arrived") }
  static var cardSentTitle: String { tr(pt: "Cartão enviado", en: "Card sent") }
  static var cardDefaultTitle: String { tr(pt: "Cartão de domingo", en: "Sunday card") }
  static var cardNextDateDefault: String { tr(pt: "Próximo encontro", en: "Next date") }
  static var cardReadySubtitle: String { tr(pt: "Toque para abrir", en: "Tap to open") }
  static var cardPreparingSubtitle: String { tr(pt: "Em preparação", en: "In preparation") }

  static var ownSmallDisplayName: String {
    tr(pt: "Repara · Meu (pequeno)", en: "Repara · Mine (small)")
  }
  static var ownSmallDescription: String {
    tr(pt: "Anotar slip, próxima data, humor ou ritual.", en: "Quick slip, next date, mood, or ritual.")
  }
  static var ownMediumDisplayName: String {
    tr(pt: "Repara · Meu (médio)", en: "Repara · Mine (medium)")
  }
  static var ownMediumDescription: String {
    tr(pt: "Ideia do dia ou potinho do dia ruim.", en: "Idea of the day or bad-day jar.")
  }
  static var lockScreenDisplayName: String {
    tr(pt: "Repara · Tela de bloqueio", en: "Repara · Lock screen")
  }
  static var lockScreenDescription: String {
    tr(
      pt: "Símbolo e frase genérica, sem nomes nem mensagens.",
      en: "Symbol and generic phrase, without names or messages."
    )
  }
  static var coupleCounterDisplayName: String {
    tr(pt: "Repara · Contador do casal", en: "Repara · Couple counter")
  }
  static var coupleCounterDescription: String {
    tr(pt: "Dias juntos, atualizado à meia-noite.", en: "Days together, updated at midnight.")
  }
  static var couplePhotosDisplayName: String {
    tr(pt: "Repara · Fotos do casal", en: "Repara · Couple photos")
  }
  static var couplePhotosDescription: String {
    tr(pt: "Foto em cache local ou cartão neutro.", en: "Locally cached photo or neutral card.")
  }
  static var partnerNoteDisplayName: String {
    tr(pt: "Repara · Recado do parceiro", en: "Repara · Partner note")
  }
  static var partnerNoteDescription: String {
    tr(
      pt: "Recado curto marcado pelo seu par para o widget.",
      en: "Short note marked by your partner for the widget."
    )
  }
  static var cardEncounterDisplayName: String {
    tr(pt: "Repara · Cartão e encontro", en: "Repara · Card & date")
  }
  static var cardEncounterDescription: String {
    tr(
      pt: "Estado do cartão da semana e próxima data, sem nomes nem texto do cartão.",
      en: "Weekly card state and next date, without names or card text."
    )
  }
}

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
  static let cachedPhotoKey = "repara_widget_photo_path"

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
    if decoded.isSignedIn, !decoded.discreet, decoded.isPaired, decoded.hasPlus,
      decoded.cachedPhotoPath == nil || decoded.cachedPhotoPath?.isEmpty == true,
      let directPhotoPath = defaults.string(forKey: cachedPhotoKey), !directPhotoPath.isEmpty
    {
      return ReparaWidgetPayload(
        isSignedIn: decoded.isSignedIn,
        discreet: decoded.discreet,
        isPaired: decoded.isPaired,
        hasPlus: decoded.hasPlus,
        showNames: decoded.showNames,
        allowPartnerNotes: decoded.allowPartnerNotes,
        onLockScreen: decoded.onLockScreen,
        isOffline: decoded.isOffline,
        togetherSince: decoded.togetherSince,
        relationshipPhase: decoded.relationshipPhase,
        partnerName: decoded.partnerName,
        nextDateTitle: decoded.nextDateTitle,
        nextDateOn: decoded.nextDateOn,
        unopenedCards: decoded.unopenedCards,
        cardState: decoded.cardState,
        pauseReturnAt: decoded.pauseReturnAt,
        partnerNote: decoded.partnerNote,
        partnerNoteMedia: decoded.partnerNoteMedia,
        partnerNoteAt: decoded.partnerNoteAt,
        partnerMood: decoded.partnerMood,
        myMood: decoded.myMood,
        ritualTitle: decoded.ritualTitle,
        ritualSchedule: decoded.ritualSchedule,
        dailyIdeaTitle: decoded.dailyIdeaTitle,
        slipsCount: decoded.slipsCount,
        suggestionKey: decoded.suggestionKey,
        cachedPhotoPath: directPhotoPath,
        updatedAt: decoded.updatedAt
      )
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
    guard isSignedIn, isPaired, let raw = pauseReturnAt, !raw.isEmpty else { return false }
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
    ReparaWidgetEntry(date: Date(), payload: ReparaWidgetPayload.signedOut())
  }

  func getSnapshot(in context: Context, completion: @escaping (ReparaWidgetEntry) -> Void) {
    completion(ReparaWidgetEntry(date: Date(), payload: ReparaWidgetPayload.signedOut()))
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<ReparaWidgetEntry>) -> Void) {
    let now = Date()
    let payload = ReparaWidgetPayload.loadFromSharedStore()
    var entries = [ReparaWidgetEntry(date: now, payload: payload)]

    let fifteenMinutes = Calendar.current.date(byAdding: .minute, value: 15, to: now) ?? now.addingTimeInterval(900)
    var nextRefresh = fifteenMinutes
    if refreshesAtMidnight,
      let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Calendar.current.startOfDay(for: now))
    {
      entries.append(ReparaWidgetEntry(date: tomorrow, payload: payload))
      nextRefresh = min(fifteenMinutes, tomorrow)
    }

    completion(Timeline(entries: entries, policy: .after(nextRefresh)))
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

struct ReparaSignedOutWidgetCard: View {
  var body: some View {
    ReparaSurfaceCard(deepLink: "repara://sign-in?homeWidget=1") {
      Text(ReparaL10n.signedOutLabel)
        .font(.caption2.weight(.semibold))
        .foregroundColor(.secondary)
        .lineLimit(1)
      Spacer(minLength: 4)
      Text(ReparaL10n.signedOutTitle)
        .font(.subheadline.weight(.semibold))
        .lineLimit(2)
    }
  }
}

struct ReparaDiscreetWidgetCard: View {
  var body: some View {
    ReparaSurfaceCard(deepLink: "repara://settings/discreet?homeWidget=1") {
      Text(ReparaL10n.discreetLabel)
        .font(.caption2.weight(.semibold))
        .foregroundColor(.secondary)
        .lineLimit(1)
      Spacer(minLength: 4)
      Text(ReparaL10n.discreetTitle)
        .font(.subheadline.weight(.semibold))
        .lineLimit(2)
    }
  }
}

struct ReparaUnpairedWidgetCard: View {
  var body: some View {
    ReparaSurfaceCard(deepLink: "repara://invite?homeWidget=1") {
      Text(ReparaL10n.unpairedLabel)
        .font(.caption2.weight(.semibold))
        .foregroundColor(.secondary)
        .lineLimit(1)
      Spacer(minLength: 4)
      Text(ReparaL10n.unpairedTitle)
        .font(.subheadline.weight(.semibold))
        .lineLimit(2)
      Text(ReparaL10n.unpairedAction)
        .font(.caption)
        .foregroundColor(.secondary)
        .lineLimit(1)
    }
  }
}

struct ReparaOwnSmallWidgetView: View {
  let entry: ReparaWidgetEntry

  @ViewBuilder
  var body: some View {
    let p = entry.payload
    if !p.isSignedIn {
      ReparaSignedOutWidgetCard()
    } else if p.discreet {
      ReparaDiscreetWidgetCard()
    } else if let days = p.daysUntilNextDate(on: entry.date), let title = p.nextDateTitle {
      ReparaSurfaceCard(deepLink: "repara://dates?homeWidget=1") {
        Text(ReparaL10n.nextDateLabel)
          .font(.caption2.weight(.semibold))
          .foregroundColor(.secondary)
          .lineLimit(1)
        Spacer(minLength: 4)
        Text(ReparaL10n.daysCount(days))
          .font(.headline.weight(.semibold))
          .lineLimit(1)
        Text(title)
          .font(.caption)
          .foregroundColor(.secondary)
          .lineLimit(1)
      }
    } else if let ritual = p.ritualTitle, !ritual.isEmpty {
      ReparaSurfaceCard(deepLink: "repara://rituals?homeWidget=1") {
        Text(ReparaL10n.ritualLabel)
          .font(.caption2.weight(.semibold))
          .foregroundColor(.secondary)
          .lineLimit(1)
        Spacer(minLength: 4)
        Text(ritual)
          .font(.subheadline.weight(.semibold))
          .lineLimit(2)
        Text(p.ritualSchedule ?? ReparaL10n.ritualDefaultSchedule)
          .font(.caption)
          .foregroundColor(.secondary)
          .lineLimit(1)
      }
    } else if let mood = p.myMood, !mood.isEmpty {
      ReparaSurfaceCard(deepLink: "repara://mood?homeWidget=1") {
        Text(ReparaL10n.moodLabel)
          .font(.caption2.weight(.semibold))
          .foregroundColor(.secondary)
          .lineLimit(1)
        Spacer(minLength: 4)
        Text(mood)
          .font(.headline.weight(.semibold))
          .lineLimit(1)
        Text(ReparaL10n.moodSubtitle)
          .font(.caption)
          .foregroundColor(.secondary)
          .lineLimit(1)
      }
    } else {
      ReparaSurfaceCard(deepLink: "repara://capture?homeWidget=1") {
        Text(ReparaL10n.slipLabel)
          .font(.caption2.weight(.semibold))
          .foregroundColor(.secondary)
          .lineLimit(1)
        Spacer(minLength: 4)
        Text(ReparaL10n.slipTitle)
          .font(.headline.weight(.semibold))
          .lineLimit(1)
        Text(ReparaL10n.slipSubtitle)
          .font(.caption)
          .foregroundColor(.secondary)
          .lineLimit(2)
      }
    }
  }
}

struct ReparaOwnMediumWidgetView: View {
  let entry: ReparaWidgetEntry

  @ViewBuilder
  var body: some View {
    let p = entry.payload
    if !p.isSignedIn {
      ReparaSignedOutWidgetCard()
    } else if p.discreet {
      ReparaDiscreetWidgetCard()
    } else if p.dailyIdeaTitle == nil && p.slipsCount > 0 {
      ReparaSurfaceCard(deepLink: "repara://jar?homeWidget=1") {
        Text(ReparaL10n.jarLabel)
          .font(.caption2.weight(.semibold))
          .foregroundColor(.secondary)
          .lineLimit(1)
        Text(ReparaL10n.jarSavedCount(p.slipsCount))
          .font(.subheadline.weight(.semibold))
          .lineLimit(2)
        Spacer(minLength: 2)
        Text(ReparaL10n.jarSubtitle)
          .font(.caption2)
          .foregroundColor(.secondary)
          .lineLimit(1)
      }
    } else {
      let idea = p.dailyIdeaTitle ?? ReparaL10n.ideaDefault
      ReparaSurfaceCard(deepLink: "repara://today?homeWidget=1") {
        Text(ReparaL10n.ideaLabel)
          .font(.caption2.weight(.semibold))
          .foregroundColor(.secondary)
          .lineLimit(1)
        Text(idea)
          .font(.subheadline.weight(.semibold))
          .lineLimit(2)
        Spacer(minLength: 2)
        Text(ReparaL10n.ideaSubtitle)
          .font(.caption2)
          .foregroundColor(.secondary)
          .lineLimit(1)
      }
    }
  }
}

struct ReparaOwnSmallWidget: Widget {
  let kind: String = "ReparaOwnSmallWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: ReparaTimelineProvider()) { entry in
      ReparaOwnSmallWidgetView(entry: entry)
    }
    .configurationDisplayName(ReparaL10n.ownSmallDisplayName)
    .description(ReparaL10n.ownSmallDescription)
    .supportedFamilies([.systemSmall])
  }
}

struct ReparaOwnMediumWidget: Widget {
  let kind: String = "ReparaOwnMediumWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: ReparaTimelineProvider()) { entry in
      ReparaOwnMediumWidgetView(entry: entry)
    }
    .configurationDisplayName(ReparaL10n.ownMediumDisplayName)
    .description(ReparaL10n.ownMediumDescription)
    .supportedFamilies([.systemMedium])
  }
}

@available(iOS 16.0, *)
struct ReparaLockScreenWidgetView: View {
  @Environment(\.widgetFamily) private var family
  let entry: ReparaWidgetEntry

  var body: some View {
    let p = entry.payload
    let neutral = p.discreet || !p.isSignedIn || !p.onLockScreen
    let symbol = neutral ? "circle.dotted" : "heart"
    let label = neutral ? ReparaL10n.discreetShortLabel : ReparaL10n.lockCalmMoment
    let phrase = neutral ? ReparaL10n.discreetTitle : ReparaL10n.lockNoNamesHint
    let deepLink = !p.isSignedIn
      ? "repara://sign-in?homeWidget=1"
      : (p.discreet
        ? "repara://settings/discreet?homeWidget=1"
        : (p.onLockScreen ? "repara://today?homeWidget=1" : "repara://settings/widgets?homeWidget=1"))

    switch family {
    case .accessoryCircular:
      ZStack {
        AccessoryWidgetBackground()
        Image(systemName: symbol)
          .font(.system(size: 18, weight: .semibold))
      }
      .widgetURL(URL(string: deepLink))
    case .accessoryInline:
      Label(label, systemImage: symbol)
        .widgetURL(URL(string: deepLink))
    default:
      VStack(alignment: .leading, spacing: 2) {
        Label(label, systemImage: symbol)
          .font(.caption.weight(.semibold))
          .lineLimit(1)
        Text(phrase)
          .font(.caption2)
          .foregroundColor(.secondary)
          .lineLimit(1)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .widgetURL(URL(string: deepLink))
    }
  }
}

private var repaLockScreenFamilies: [WidgetFamily] {
  if #available(iOS 16.0, *) {
    return [.accessoryCircular, .accessoryRectangular, .accessoryInline]
  }
  return []
}

private struct ReparaLockScreenWidgetContent: View {
  let entry: ReparaWidgetEntry

  @ViewBuilder
  var body: some View {
    if #available(iOS 17.0, *) {
      ReparaLockScreenWidgetView(entry: entry)
        .containerBackground(.clear, for: .widget)
    } else if #available(iOS 16.0, *) {
      ReparaLockScreenWidgetView(entry: entry)
    } else {
      EmptyView()
    }
  }
}

struct ReparaLockScreenWidget: Widget {
  let kind: String = "ReparaLockScreenWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: ReparaTimelineProvider()) { entry in
      ReparaLockScreenWidgetContent(entry: entry)
    }
    .configurationDisplayName(ReparaL10n.lockScreenDisplayName)
    .description(ReparaL10n.lockScreenDescription)
    .supportedFamilies(repaLockScreenFamilies)
  }
}

struct ReparaCoupleCounterWidgetView: View {
  let entry: ReparaWidgetEntry

  @ViewBuilder
  var body: some View {
    let p = entry.payload
    if !p.isSignedIn {
      ReparaSignedOutWidgetCard()
    } else if p.discreet {
      ReparaDiscreetWidgetCard()
    } else if !p.isPaired {
      ReparaUnpairedWidgetCard()
    } else {
      let daysText = p.daysTogether(on: entry.date).map { ReparaL10n.daysCount($0) } ?? ReparaL10n.counterUnset
      let subtitle = (p.showNames ? p.partnerName : nil) ?? ReparaL10n.counterDefaultSubtitle
      ReparaSurfaceCard(deepLink: "repara://together?homeWidget=1") {
        Text(ReparaL10n.counterLabel)
          .font(.caption2.weight(.semibold))
          .foregroundColor(.secondary)
          .lineLimit(1)
        Spacer(minLength: 4)
        Text(daysText)
          .font(.headline.weight(.semibold))
          .lineLimit(1)
        Text(subtitle)
          .font(.caption)
          .foregroundColor(.secondary)
          .lineLimit(1)
      }
    }
  }
}

struct ReparaCoupleCounterWidget: Widget {
  let kind: String = "ReparaCoupleCounterWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: ReparaTimelineProvider(refreshesAtMidnight: true)) { entry in
      ReparaCoupleCounterWidgetView(entry: entry)
    }
    .configurationDisplayName(ReparaL10n.coupleCounterDisplayName)
    .description(ReparaL10n.coupleCounterDescription)
    .supportedFamilies([.systemSmall, .systemMedium])
  }
}

struct ReparaCouplePhotosWidgetView: View {
  let entry: ReparaWidgetEntry

  @ViewBuilder
  var body: some View {
    let p = entry.payload
    if !p.isSignedIn {
      ReparaSignedOutWidgetCard()
    } else if p.discreet {
      ReparaDiscreetWidgetCard()
    } else if !p.isPaired {
      ReparaUnpairedWidgetCard()
    } else if !p.hasPlus {
      ReparaSurfaceCard(deepLink: "repara://memories?homeWidget=1") {
        Text(ReparaL10n.photoLabel)
          .font(.caption2.weight(.semibold))
          .foregroundColor(.secondary)
          .lineLimit(1)
        Spacer(minLength: 4)
        Text(ReparaL10n.photoPlusOnly)
          .font(.subheadline.weight(.semibold))
          .lineLimit(2)
      }
    } else if let path = p.cachedPhotoPath, !path.isEmpty, let uiImage = UIImage(contentsOfFile: path) {
      ReparaSurfaceCard(deepLink: "repara://memories?homeWidget=1") {
        Image(uiImage: uiImage)
          .resizable()
          .scaledToFill()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .clipped()
          .cornerRadius(8)
        Text(ReparaL10n.photoCachedSubtitle)
          .font(.caption2)
          .foregroundColor(.secondary)
          .lineLimit(1)
      }
    } else {
      let fallbackTitle = p.daysTogether(on: entry.date).map { ReparaL10n.photoDaysTogether($0) } ?? ReparaL10n.photoFallbackTitle
      ReparaSurfaceCard(deepLink: "repara://memories?homeWidget=1") {
        Text(ReparaL10n.photoLabel)
          .font(.caption2.weight(.semibold))
          .foregroundColor(.secondary)
          .lineLimit(1)
        Spacer(minLength: 4)
        Text(fallbackTitle)
          .font(.headline.weight(.semibold))
          .lineLimit(2)
        Text(ReparaL10n.photoNoPhoto)
          .font(.caption)
          .foregroundColor(.secondary)
          .lineLimit(1)
      }
    }
  }
}

struct ReparaCouplePhotosWidget: Widget {
  let kind: String = "ReparaCouplePhotosWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: ReparaTimelineProvider(refreshesAtMidnight: true)) { entry in
      ReparaCouplePhotosWidgetView(entry: entry)
    }
    .configurationDisplayName(ReparaL10n.couplePhotosDisplayName)
    .description(ReparaL10n.couplePhotosDescription)
    .supportedFamilies([.systemSmall, .systemMedium])
  }
}

struct ReparaPartnerNoteWidgetView: View {
  let entry: ReparaWidgetEntry

  @ViewBuilder
  var body: some View {
    let p = entry.payload
    if !p.isSignedIn {
      ReparaSignedOutWidgetCard()
    } else if p.discreet {
      ReparaDiscreetWidgetCard()
    } else if !p.isPaired {
      ReparaUnpairedWidgetCard()
    } else {
      let fromLabel = (p.showNames ? p.partnerName.map { ReparaL10n.noteFromNamed($0) } : nil) ?? ReparaL10n.noteFromDefault
      if p.allowPartnerNotes, let note = p.partnerNote, !note.isEmpty {
        ReparaSurfaceCard(deepLink: "repara://today?homeWidget=1") {
          Text(fromLabel)
            .font(.caption2.weight(.semibold))
            .foregroundColor(.secondary)
            .lineLimit(1)
          Spacer(minLength: 4)
          Text(note)
            .font(.subheadline.weight(.semibold))
            .lineLimit(2)
          Text(ReparaL10n.noteReplyHint)
            .font(.caption2)
            .foregroundColor(.secondary)
            .lineLimit(1)
        }
      } else {
        ReparaSurfaceCard(deepLink: "repara://today?homeWidget=1") {
          Text(fromLabel)
            .font(.caption2.weight(.semibold))
            .foregroundColor(.secondary)
            .lineLimit(1)
          Spacer(minLength: 4)
          Text(ReparaL10n.noteEmpty)
            .font(.subheadline.weight(.semibold))
            .lineLimit(2)
        }
      }
    }
  }
}

struct ReparaPartnerNoteWidget: Widget {
  let kind: String = "ReparaPartnerNoteWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: ReparaTimelineProvider()) { entry in
      ReparaPartnerNoteWidgetView(entry: entry)
    }
    .configurationDisplayName(ReparaL10n.partnerNoteDisplayName)
    .description(ReparaL10n.partnerNoteDescription)
    .supportedFamilies([.systemSmall, .systemMedium])
  }
}

struct ReparaCardEncounterWidgetView: View {
  let entry: ReparaWidgetEntry

  @ViewBuilder
  var body: some View {
    let p = entry.payload
    if !p.isSignedIn {
      ReparaSignedOutWidgetCard()
    } else if p.discreet {
      ReparaDiscreetWidgetCard()
    } else if !p.isPaired {
      ReparaUnpairedWidgetCard()
    } else if p.isPauseActive(on: entry.date) {
      ReparaSurfaceCard(deepLink: "repara://pause?homeWidget=1") {
        Text(ReparaL10n.cardPauseLabel)
          .font(.caption2.weight(.semibold))
          .foregroundColor(.secondary)
          .lineLimit(1)
        Spacer(minLength: 4)
        Text(ReparaL10n.cardPauseTitle)
          .font(.subheadline.weight(.semibold))
          .lineLimit(2)
        Text(ReparaL10n.cardPauseSubtitle)
          .font(.caption2)
          .foregroundColor(.secondary)
          .lineLimit(1)
      }
    } else {
      let cardTitle: String = switch p.cardState {
      case "ready": ReparaL10n.cardReadyTitle
      case "sent": ReparaL10n.cardSentTitle
      default: ReparaL10n.cardDefaultTitle
      }

      let days = p.daysUntilNextDate(on: entry.date)
      let encounterSubtitle: String = if let days {
        "\(ReparaL10n.daysCount(days)) · \(p.nextDateTitle ?? ReparaL10n.cardNextDateDefault)"
      } else {
        p.cardState == "ready" ? ReparaL10n.cardReadySubtitle : ReparaL10n.cardPreparingSubtitle
      }

      let targetLink = p.cardState == "ready"
        ? "repara://card?homeWidget=1"
        : (days != nil ? "repara://dates?homeWidget=1" : "repara://card?homeWidget=1")

      ReparaSurfaceCard(deepLink: targetLink) {
        Text(ReparaL10n.cardWeeklyLabel)
          .font(.caption2.weight(.semibold))
          .foregroundColor(.secondary)
          .lineLimit(1)
        Spacer(minLength: 4)
        Text(cardTitle)
          .font(.subheadline.weight(.semibold))
          .lineLimit(2)
        Text(encounterSubtitle)
          .font(.caption)
          .foregroundColor(.secondary)
          .lineLimit(1)
      }
    }
  }
}

struct ReparaCardEncounterWidget: Widget {
  let kind: String = "ReparaCardEncounterWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: ReparaTimelineProvider(refreshesAtMidnight: true)) { entry in
      ReparaCardEncounterWidgetView(entry: entry)
    }
    .configurationDisplayName(ReparaL10n.cardEncounterDisplayName)
    .description(ReparaL10n.cardEncounterDescription)
    .supportedFamilies([.systemSmall, .systemMedium])
  }
}

@main
struct ReparaWidgetsBundle: WidgetBundle {
  var body: some Widget {
    ReparaOwnSmallWidget()
    ReparaOwnMediumWidget()
    ReparaLockScreenWidget()
    ReparaCoupleCounterWidget()
    ReparaCouplePhotosWidget()
    ReparaPartnerNoteWidget()
    ReparaCardEncounterWidget()
  }
}
