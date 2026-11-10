// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AcceptInvitePage]
class AcceptInviteRoute extends PageRouteInfo<void> {
  const AcceptInviteRoute({List<PageRouteInfo>? children})
    : super(AcceptInviteRoute.name, initialChildren: children);

  static const String name = 'AcceptInviteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const AcceptInvitePage());
    },
  );
}

/// generated route for
/// [AppPreferencesPage]
class AppPreferencesRoute extends PageRouteInfo<void> {
  const AppPreferencesRoute({List<PageRouteInfo>? children})
    : super(AppPreferencesRoute.name, initialChildren: children);

  static const String name = 'AppPreferencesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppPreferencesPage();
    },
  );
}

/// generated route for
/// [BadDayPage]
class BadDayRoute extends PageRouteInfo<void> {
  const BadDayRoute({List<PageRouteInfo>? children})
    : super(BadDayRoute.name, initialChildren: children);

  static const String name = 'BadDayRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const BadDayPage());
    },
  );
}

/// generated route for
/// [BreakupPage]
class BreakupRoute extends PageRouteInfo<void> {
  const BreakupRoute({List<PageRouteInfo>? children})
    : super(BreakupRoute.name, initialChildren: children);

  static const String name = 'BreakupRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const BreakupPage());
    },
  );
}

/// generated route for
/// [CalmPage]
class CalmRoute extends PageRouteInfo<void> {
  const CalmRoute({List<PageRouteInfo>? children})
    : super(CalmRoute.name, initialChildren: children);

  static const String name = 'CalmRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CalmPage();
    },
  );
}

/// generated route for
/// [CardDetailPage]
class CardDetailRoute extends PageRouteInfo<CardDetailRouteArgs> {
  CardDetailRoute({
    required String cardId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         CardDetailRoute.name,
         args: CardDetailRouteArgs(cardId: cardId, key: key),
         rawPathParams: {'id': cardId},
         initialChildren: children,
       );

  static const String name = 'CardDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<CardDetailRouteArgs>(
        orElse: () => CardDetailRouteArgs(cardId: pathParams.getString('id')),
      );
      return WrappedRoute(
        child: CardDetailPage(cardId: args.cardId, key: args.key),
      );
    },
  );
}

class CardDetailRouteArgs {
  const CardDetailRouteArgs({required this.cardId, this.key});

  final String cardId;

  final Key? key;

  @override
  String toString() {
    return 'CardDetailRouteArgs{cardId: $cardId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CardDetailRouteArgs) return false;
    return cardId == other.cardId && key == other.key;
  }

  @override
  int get hashCode => cardId.hashCode ^ key.hashCode;
}

/// generated route for
/// [CardsListPage]
class CardsListRoute extends PageRouteInfo<void> {
  const CardsListRoute({List<PageRouteInfo>? children})
    : super(CardsListRoute.name, initialChildren: children);

  static const String name = 'CardsListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const CardsListPage());
    },
  );
}

/// generated route for
/// [ConsentsPage]
class ConsentsRoute extends PageRouteInfo<void> {
  const ConsentsRoute({List<PageRouteInfo>? children})
    : super(ConsentsRoute.name, initialChildren: children);

  static const String name = 'ConsentsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const ConsentsPage());
    },
  );
}

/// generated route for
/// [DateNightPage]
class DateNightRoute extends PageRouteInfo<void> {
  const DateNightRoute({List<PageRouteInfo>? children})
    : super(DateNightRoute.name, initialChildren: children);

  static const String name = 'DateNightRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const DateNightPage());
    },
  );
}

/// generated route for
/// [DatesPage]
class DatesRoute extends PageRouteInfo<void> {
  const DatesRoute({List<PageRouteInfo>? children})
    : super(DatesRoute.name, initialChildren: children);

  static const String name = 'DatesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const DatesPage());
    },
  );
}

/// generated route for
/// [DayPage]
class DayRoute extends PageRouteInfo<void> {
  const DayRoute({List<PageRouteInfo>? children})
    : super(DayRoute.name, initialChildren: children);

  static const String name = 'DayRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const DayPage());
    },
  );
}

/// generated route for
/// [DebugSignInPage]
class DebugSignInRoute extends PageRouteInfo<void> {
  const DebugSignInRoute({List<PageRouteInfo>? children})
    : super(DebugSignInRoute.name, initialChildren: children);

  static const String name = 'DebugSignInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const DebugSignInPage());
    },
  );
}

/// generated route for
/// [DeleteAccountPage]
class DeleteAccountRoute extends PageRouteInfo<void> {
  const DeleteAccountRoute({List<PageRouteInfo>? children})
    : super(DeleteAccountRoute.name, initialChildren: children);

  static const String name = 'DeleteAccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const DeleteAccountPage());
    },
  );
}

/// generated route for
/// [DevicesPage]
class DevicesRoute extends PageRouteInfo<void> {
  const DevicesRoute({List<PageRouteInfo>? children})
    : super(DevicesRoute.name, initialChildren: children);

  static const String name = 'DevicesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const DevicesPage());
    },
  );
}

/// generated route for
/// [DiscreetModePage]
class DiscreetModeRoute extends PageRouteInfo<void> {
  const DiscreetModeRoute({List<PageRouteInfo>? children})
    : super(DiscreetModeRoute.name, initialChildren: children);

  static const String name = 'DiscreetModeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const DiscreetModePage());
    },
  );
}

/// generated route for
/// [ExistingAccountPage]
class ExistingAccountRoute extends PageRouteInfo<void> {
  const ExistingAccountRoute({List<PageRouteInfo>? children})
    : super(ExistingAccountRoute.name, initialChildren: children);

  static const String name = 'ExistingAccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const ExistingAccountPage());
    },
  );
}

/// generated route for
/// [FirstSlipPage]
class FirstSlipRoute extends PageRouteInfo<void> {
  const FirstSlipRoute({List<PageRouteInfo>? children})
    : super(FirstSlipRoute.name, initialChildren: children);

  static const String name = 'FirstSlipRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const FirstSlipPage());
    },
  );
}

/// generated route for
/// [GuidedRepairPage]
class GuidedRepairRoute extends PageRouteInfo<void> {
  const GuidedRepairRoute({List<PageRouteInfo>? children})
    : super(GuidedRepairRoute.name, initialChildren: children);

  static const String name = 'GuidedRepairRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const GuidedRepairPage());
    },
  );
}

/// generated route for
/// [HelpPage]
class HelpRoute extends PageRouteInfo<void> {
  const HelpRoute({List<PageRouteInfo>? children})
    : super(HelpRoute.name, initialChildren: children);

  static const String name = 'HelpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const HelpPage());
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [IdeaDetailPage]
class IdeaDetailRoute extends PageRouteInfo<IdeaDetailRouteArgs> {
  IdeaDetailRoute({String? slug, Key? key, List<PageRouteInfo>? children})
    : super(
        IdeaDetailRoute.name,
        args: IdeaDetailRouteArgs(slug: slug, key: key),
        rawQueryParams: {'slug': slug},
        initialChildren: children,
      );

  static const String name = 'IdeaDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<IdeaDetailRouteArgs>(
        orElse: () => IdeaDetailRouteArgs(slug: queryParams.optString('slug')),
      );
      return WrappedRoute(
        child: IdeaDetailPage(slug: args.slug, key: args.key),
      );
    },
  );
}

class IdeaDetailRouteArgs {
  const IdeaDetailRouteArgs({this.slug, this.key});

  final String? slug;

  final Key? key;

  @override
  String toString() {
    return 'IdeaDetailRouteArgs{slug: $slug, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! IdeaDetailRouteArgs) return false;
    return slug == other.slug && key == other.key;
  }

  @override
  int get hashCode => slug.hashCode ^ key.hashCode;
}

/// generated route for
/// [IntroGoalsPage]
class IntroGoalsRoute extends PageRouteInfo<void> {
  const IntroGoalsRoute({List<PageRouteInfo>? children})
    : super(IntroGoalsRoute.name, initialChildren: children);

  static const String name = 'IntroGoalsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const IntroGoalsPage());
    },
  );
}

/// generated route for
/// [IntroPhasePage]
class IntroPhaseRoute extends PageRouteInfo<void> {
  const IntroPhaseRoute({List<PageRouteInfo>? children})
    : super(IntroPhaseRoute.name, initialChildren: children);

  static const String name = 'IntroPhaseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const IntroPhasePage());
    },
  );
}

/// generated route for
/// [IntroThemePage]
class IntroThemeRoute extends PageRouteInfo<void> {
  const IntroThemeRoute({List<PageRouteInfo>? children})
    : super(IntroThemeRoute.name, initialChildren: children);

  static const String name = 'IntroThemeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const IntroThemePage());
    },
  );
}

/// generated route for
/// [InvitePage]
class InviteRoute extends PageRouteInfo<void> {
  const InviteRoute({List<PageRouteInfo>? children})
    : super(InviteRoute.name, initialChildren: children);

  static const String name = 'InviteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const InvitePage());
    },
  );
}

/// generated route for
/// [LanguagePage]
class LanguageRoute extends PageRouteInfo<void> {
  const LanguageRoute({List<PageRouteInfo>? children})
    : super(LanguageRoute.name, initialChildren: children);

  static const String name = 'LanguageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LanguagePage();
    },
  );
}

/// generated route for
/// [LearningPage]
class LearningRoute extends PageRouteInfo<LearningRouteArgs> {
  LearningRoute({String? sessionId, Key? key, List<PageRouteInfo>? children})
    : super(
        LearningRoute.name,
        args: LearningRouteArgs(sessionId: sessionId, key: key),
        rawQueryParams: {'sessionId': sessionId},
        initialChildren: children,
      );

  static const String name = 'LearningRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<LearningRouteArgs>(
        orElse: () =>
            LearningRouteArgs(sessionId: queryParams.optString('sessionId')),
      );
      return WrappedRoute(
        child: LearningPage(sessionId: args.sessionId, key: args.key),
      );
    },
  );
}

class LearningRouteArgs {
  const LearningRouteArgs({this.sessionId, this.key});

  final String? sessionId;

  final Key? key;

  @override
  String toString() {
    return 'LearningRouteArgs{sessionId: $sessionId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LearningRouteArgs) return false;
    return sessionId == other.sessionId && key == other.key;
  }

  @override
  int get hashCode => sessionId.hashCode ^ key.hashCode;
}

/// generated route for
/// [LogisticsPage]
class LogisticsRoute extends PageRouteInfo<void> {
  const LogisticsRoute({List<PageRouteInfo>? children})
    : super(LogisticsRoute.name, initialChildren: children);

  static const String name = 'LogisticsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const LogisticsPage());
    },
  );
}

/// generated route for
/// [ManagePlusPage]
class ManagePlusRoute extends PageRouteInfo<void> {
  const ManagePlusRoute({List<PageRouteInfo>? children})
    : super(ManagePlusRoute.name, initialChildren: children);

  static const String name = 'ManagePlusRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const ManagePlusPage());
    },
  );
}

/// generated route for
/// [MemoriesPage]
class MemoriesRoute extends PageRouteInfo<void> {
  const MemoriesRoute({List<PageRouteInfo>? children})
    : super(MemoriesRoute.name, initialChildren: children);

  static const String name = 'MemoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const MemoriesPage());
    },
  );
}

/// generated route for
/// [MoodPage]
class MoodRoute extends PageRouteInfo<void> {
  const MoodRoute({List<PageRouteInfo>? children})
    : super(MoodRoute.name, initialChildren: children);

  static const String name = 'MoodRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const MoodPage());
    },
  );
}

/// generated route for
/// [NeedPage]
class NeedRoute extends PageRouteInfo<void> {
  const NeedRoute({List<PageRouteInfo>? children})
    : super(NeedRoute.name, initialChildren: children);

  static const String name = 'NeedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const NeedPage());
    },
  );
}

/// generated route for
/// [NeutralPage]
class NeutralRoute extends PageRouteInfo<void> {
  const NeutralRoute({List<PageRouteInfo>? children})
    : super(NeutralRoute.name, initialChildren: children);

  static const String name = 'NeutralRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NeutralPage();
    },
  );
}

/// generated route for
/// [NotFoundPage]
class NotFoundRoute extends PageRouteInfo<void> {
  const NotFoundRoute({List<PageRouteInfo>? children})
    : super(NotFoundRoute.name, initialChildren: children);

  static const String name = 'NotFoundRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotFoundPage();
    },
  );
}

/// generated route for
/// [NotificationPermissionPage]
class NotificationPermissionRoute extends PageRouteInfo<void> {
  const NotificationPermissionRoute({List<PageRouteInfo>? children})
    : super(NotificationPermissionRoute.name, initialChildren: children);

  static const String name = 'NotificationPermissionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const NotificationPermissionPage());
    },
  );
}

/// generated route for
/// [NotificationPreferencesPage]
class NotificationPreferencesRoute extends PageRouteInfo<void> {
  const NotificationPreferencesRoute({List<PageRouteInfo>? children})
    : super(NotificationPreferencesRoute.name, initialChildren: children);

  static const String name = 'NotificationPreferencesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const NotificationPreferencesPage());
    },
  );
}

/// generated route for
/// [OurViewPage]
class OurViewRoute extends PageRouteInfo<void> {
  const OurViewRoute({List<PageRouteInfo>? children})
    : super(OurViewRoute.name, initialChildren: children);

  static const String name = 'OurViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OurViewPage();
    },
  );
}

/// generated route for
/// [PartnerProfilePage]
class PartnerProfileRoute extends PageRouteInfo<void> {
  const PartnerProfileRoute({List<PageRouteInfo>? children})
    : super(PartnerProfileRoute.name, initialChildren: children);

  static const String name = 'PartnerProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const PartnerProfilePage());
    },
  );
}

/// generated route for
/// [PartnerStepPage]
class PartnerStepRoute extends PageRouteInfo<void> {
  const PartnerStepRoute({List<PageRouteInfo>? children})
    : super(PartnerStepRoute.name, initialChildren: children);

  static const String name = 'PartnerStepRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const PartnerStepPage());
    },
  );
}

/// generated route for
/// [PartnerViewPage]
class PartnerViewRoute extends PageRouteInfo<void> {
  const PartnerViewRoute({List<PageRouteInfo>? children})
    : super(PartnerViewRoute.name, initialChildren: children);

  static const String name = 'PartnerViewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PartnerViewPage();
    },
  );
}

/// generated route for
/// [PausePage]
class PauseRoute extends PageRouteInfo<void> {
  const PauseRoute({List<PageRouteInfo>? children})
    : super(PauseRoute.name, initialChildren: children);

  static const String name = 'PauseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const PausePage());
    },
  );
}

/// generated route for
/// [PlansPage]
class PlansRoute extends PageRouteInfo<void> {
  const PlansRoute({List<PageRouteInfo>? children})
    : super(PlansRoute.name, initialChildren: children);

  static const String name = 'PlansRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const PlansPage());
    },
  );
}

/// generated route for
/// [PrivacyHubPage]
class PrivacyHubRoute extends PageRouteInfo<void> {
  const PrivacyHubRoute({List<PageRouteInfo>? children})
    : super(PrivacyHubRoute.name, initialChildren: children);

  static const String name = 'PrivacyHubRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PrivacyHubPage();
    },
  );
}

/// generated route for
/// [ProfileSettingsPage]
class ProfileSettingsRoute extends PageRouteInfo<void> {
  const ProfileSettingsRoute({List<PageRouteInfo>? children})
    : super(ProfileSettingsRoute.name, initialChildren: children);

  static const String name = 'ProfileSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const ProfileSettingsPage());
    },
  );
}

/// generated route for
/// [ProfileSetupPage]
class ProfileSetupRoute extends PageRouteInfo<void> {
  const ProfileSetupRoute({List<PageRouteInfo>? children})
    : super(ProfileSetupRoute.name, initialChildren: children);

  static const String name = 'ProfileSetupRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const ProfileSetupPage());
    },
  );
}

/// generated route for
/// [QuickRepairPage]
class QuickRepairRoute extends PageRouteInfo<QuickRepairRouteArgs> {
  QuickRepairRoute({String text = '', Key? key, List<PageRouteInfo>? children})
    : super(
        QuickRepairRoute.name,
        args: QuickRepairRouteArgs(text: text, key: key),
        rawQueryParams: {'text': text},
        initialChildren: children,
      );

  static const String name = 'QuickRepairRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<QuickRepairRouteArgs>(
        orElse: () =>
            QuickRepairRouteArgs(text: queryParams.getString('text', '')),
      );
      return WrappedRoute(
        child: QuickRepairPage(text: args.text, key: args.key),
      );
    },
  );
}

class QuickRepairRouteArgs {
  const QuickRepairRouteArgs({this.text = '', this.key});

  final String text;

  final Key? key;

  @override
  String toString() {
    return 'QuickRepairRouteArgs{text: $text, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! QuickRepairRouteArgs) return false;
    return text == other.text && key == other.key;
  }

  @override
  int get hashCode => text.hashCode ^ key.hashCode;
}

/// generated route for
/// [QuickSlipPage]
class QuickSlipRoute extends PageRouteInfo<void> {
  const QuickSlipRoute({List<PageRouteInfo>? children})
    : super(QuickSlipRoute.name, initialChildren: children);

  static const String name = 'QuickSlipRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const QuickSlipPage());
    },
  );
}

/// generated route for
/// [ReceivedSignalsPage]
class ReceivedSignalsRoute extends PageRouteInfo<void> {
  const ReceivedSignalsRoute({List<PageRouteInfo>? children})
    : super(ReceivedSignalsRoute.name, initialChildren: children);

  static const String name = 'ReceivedSignalsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const ReceivedSignalsPage());
    },
  );
}

/// generated route for
/// [RelationshipPage]
class RelationshipRoute extends PageRouteInfo<void> {
  const RelationshipRoute({List<PageRouteInfo>? children})
    : super(RelationshipRoute.name, initialChildren: children);

  static const String name = 'RelationshipRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const RelationshipPage());
    },
  );
}

/// generated route for
/// [RestorePurchasesPage]
class RestorePurchasesRoute extends PageRouteInfo<void> {
  const RestorePurchasesRoute({List<PageRouteInfo>? children})
    : super(RestorePurchasesRoute.name, initialChildren: children);

  static const String name = 'RestorePurchasesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const RestorePurchasesPage());
    },
  );
}

/// generated route for
/// [RitualEditPage]
class RitualEditRoute extends PageRouteInfo<RitualEditRouteArgs> {
  RitualEditRoute({String? id, Key? key, List<PageRouteInfo>? children})
    : super(
        RitualEditRoute.name,
        args: RitualEditRouteArgs(id: id, key: key),
        rawQueryParams: {'id': id},
        initialChildren: children,
      );

  static const String name = 'RitualEditRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<RitualEditRouteArgs>(
        orElse: () => RitualEditRouteArgs(id: queryParams.optString('id')),
      );
      return WrappedRoute(
        child: RitualEditPage(id: args.id, key: args.key),
      );
    },
  );
}

class RitualEditRouteArgs {
  const RitualEditRouteArgs({this.id, this.key});

  final String? id;

  final Key? key;

  @override
  String toString() {
    return 'RitualEditRouteArgs{id: $id, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RitualEditRouteArgs) return false;
    return id == other.id && key == other.key;
  }

  @override
  int get hashCode => id.hashCode ^ key.hashCode;
}

/// generated route for
/// [RitualsPage]
class RitualsRoute extends PageRouteInfo<void> {
  const RitualsRoute({List<PageRouteInfo>? children})
    : super(RitualsRoute.name, initialChildren: children);

  static const String name = 'RitualsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const RitualsPage());
    },
  );
}

/// generated route for
/// [SafeModePage]
class SafeModeRoute extends PageRouteInfo<void> {
  const SafeModeRoute({List<PageRouteInfo>? children})
    : super(SafeModeRoute.name, initialChildren: children);

  static const String name = 'SafeModeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SafeModePage());
    },
  );
}

/// generated route for
/// [SettingsHomePage]
class SettingsHomeRoute extends PageRouteInfo<void> {
  const SettingsHomeRoute({List<PageRouteInfo>? children})
    : super(SettingsHomeRoute.name, initialChildren: children);

  static const String name = 'SettingsHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SettingsHomePage());
    },
  );
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SignInPage());
    },
  );
}

/// generated route for
/// [SlipDetailPage]
class SlipDetailRoute extends PageRouteInfo<SlipDetailRouteArgs> {
  SlipDetailRoute({required String id, Key? key, List<PageRouteInfo>? children})
    : super(
        SlipDetailRoute.name,
        args: SlipDetailRouteArgs(id: id, key: key),
        rawPathParams: {'id': id},
        initialChildren: children,
      );

  static const String name = 'SlipDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<SlipDetailRouteArgs>(
        orElse: () => SlipDetailRouteArgs(id: pathParams.getString('id')),
      );
      return WrappedRoute(
        child: SlipDetailPage(id: args.id, key: args.key),
      );
    },
  );
}

class SlipDetailRouteArgs {
  const SlipDetailRouteArgs({required this.id, this.key});

  final String id;

  final Key? key;

  @override
  String toString() {
    return 'SlipDetailRouteArgs{id: $id, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SlipDetailRouteArgs) return false;
    return id == other.id && key == other.key;
  }

  @override
  int get hashCode => id.hashCode ^ key.hashCode;
}

/// generated route for
/// [SlipKindPage]
class SlipKindRoute extends PageRouteInfo<SlipKindRouteArgs> {
  SlipKindRoute({
    String kind = 'specific',
    String text = '',
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         SlipKindRoute.name,
         args: SlipKindRouteArgs(kind: kind, text: text, key: key),
         rawQueryParams: {'kind': kind, 'text': text},
         initialChildren: children,
       );

  static const String name = 'SlipKindRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<SlipKindRouteArgs>(
        orElse: () => SlipKindRouteArgs(
          kind: queryParams.getString('kind', 'specific'),
          text: queryParams.getString('text', ''),
        ),
      );
      return WrappedRoute(
        child: SlipKindPage(kind: args.kind, text: args.text, key: args.key),
      );
    },
  );
}

class SlipKindRouteArgs {
  const SlipKindRouteArgs({this.kind = 'specific', this.text = '', this.key});

  final String kind;

  final String text;

  final Key? key;

  @override
  String toString() {
    return 'SlipKindRouteArgs{kind: $kind, text: $text, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SlipKindRouteArgs) return false;
    return kind == other.kind && text == other.text && key == other.key;
  }

  @override
  int get hashCode => kind.hashCode ^ text.hashCode ^ key.hashCode;
}

/// generated route for
/// [SlipsPage]
class SlipsRoute extends PageRouteInfo<void> {
  const SlipsRoute({List<PageRouteInfo>? children})
    : super(SlipsRoute.name, initialChildren: children);

  static const String name = 'SlipsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SlipsPage());
    },
  );
}

/// generated route for
/// [SoftStartPage]
class SoftStartRoute extends PageRouteInfo<void> {
  const SoftStartRoute({List<PageRouteInfo>? children})
    : super(SoftStartRoute.name, initialChildren: children);

  static const String name = 'SoftStartRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SoftStartPage());
    },
  );
}

/// generated route for
/// [StarterPage]
class StarterRoute extends PageRouteInfo<void> {
  const StarterRoute({List<PageRouteInfo>? children})
    : super(StarterRoute.name, initialChildren: children);

  static const String name = 'StarterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const StarterPage());
    },
  );
}

/// generated route for
/// [SundayCardPage]
class SundayCardRoute extends PageRouteInfo<void> {
  const SundayCardRoute({List<PageRouteInfo>? children})
    : super(SundayCardRoute.name, initialChildren: children);

  static const String name = 'SundayCardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SundayCardPage());
    },
  );
}

/// generated route for
/// [SupportPage]
class SupportRoute extends PageRouteInfo<SupportRouteArgs> {
  SupportRoute({
    SupportTopic topic = SupportTopic.account,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         SupportRoute.name,
         args: SupportRouteArgs(topic: topic, key: key),
         initialChildren: children,
       );

  static const String name = 'SupportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SupportRouteArgs>(
        orElse: () => const SupportRouteArgs(),
      );
      return WrappedRoute(
        child: SupportPage(topic: args.topic, key: args.key),
      );
    },
  );
}

class SupportRouteArgs {
  const SupportRouteArgs({this.topic = SupportTopic.account, this.key});

  final SupportTopic topic;

  final Key? key;

  @override
  String toString() {
    return 'SupportRouteArgs{topic: $topic, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SupportRouteArgs) return false;
    return topic == other.topic && key == other.key;
  }

  @override
  int get hashCode => topic.hashCode ^ key.hashCode;
}

/// generated route for
/// [TemperaturePage]
class TemperatureRoute extends PageRouteInfo<void> {
  const TemperatureRoute({List<PageRouteInfo>? children})
    : super(TemperatureRoute.name, initialChildren: children);

  static const String name = 'TemperatureRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const TemperaturePage());
    },
  );
}

/// generated route for
/// [TodayPage]
class TodayRoute extends PageRouteInfo<void> {
  const TodayRoute({List<PageRouteInfo>? children})
    : super(TodayRoute.name, initialChildren: children);

  static const String name = 'TodayRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const TodayPage());
    },
  );
}

/// generated route for
/// [TogetherPage]
class TogetherRoute extends PageRouteInfo<void> {
  const TogetherRoute({List<PageRouteInfo>? children})
    : super(TogetherRoute.name, initialChildren: children);

  static const String name = 'TogetherRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const TogetherPage());
    },
  );
}

/// generated route for
/// [UnpairDonePage]
class UnpairDoneRoute extends PageRouteInfo<void> {
  const UnpairDoneRoute({List<PageRouteInfo>? children})
    : super(UnpairDoneRoute.name, initialChildren: children);

  static const String name = 'UnpairDoneRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const UnpairDonePage());
    },
  );
}

/// generated route for
/// [UnpairPage]
class UnpairRoute extends PageRouteInfo<void> {
  const UnpairRoute({List<PageRouteInfo>? children})
    : super(UnpairRoute.name, initialChildren: children);

  static const String name = 'UnpairRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const UnpairPage());
    },
  );
}

/// generated route for
/// [WelcomePage]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
    : super(WelcomeRoute.name, initialChildren: children);

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WelcomePage();
    },
  );
}
