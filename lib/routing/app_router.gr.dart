// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AdsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<AdsDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AdsDetailView(
          args.id,
          key: args.key,
        ),
      );
    },
    AdsInfoAddRoute.name: (routeData) {
      final args = routeData.argsAs<AdsInfoAddRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AdsInfoAddView(
          args.id,
          key: args.key,
        ),
      );
    },
    AdsStateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdsStateView(),
      );
    },
    AdsSuccessCreateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdsSuccessCreateView(),
      );
    },
    ChangeLocationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangeLocationView(),
      );
    },
    CreateAdsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateAdsView(),
      );
    },
    FeedBackApprovalRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FeedBackApprovalView(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPasswordView(),
      );
    },
    GiveFeedBackRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GiveFeedBackView(),
      );
    },
    HelpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HelpView(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    MessagesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MessagesView(),
      );
    },
    MyAddsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyAddsView(),
      );
    },
    MyAdsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyAdsView(),
      );
    },
    NavigatorRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NavigatorView(),
      );
    },
    NegativeNotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NegativeNotificationView(),
      );
    },
    PasswordChangeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PasswordChangeView(),
      );
    },
    ProfileEditRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileEditView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileView(),
      );
    },
    Register1Route.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Register1View(),
      );
    },
    Register2Route.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Register2View(),
      );
    },
    RegisterCitySelectRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterCitySelectView(),
      );
    },
    RegisterDistrictSelectRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterDistrictSelectView(),
      );
    },
    RegisterNotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterNotificationView(),
      );
    },
    SecturityVerifDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SecturityVerifDetailView(),
      );
    },
    SecturityVerificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SecturityVerificationView(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsView(),
      );
    },
    ShareAdsRoute.name: (routeData) {
      final args = routeData.argsAs<ShareAdsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ShareAdsView(
          type: args.type,
          key: args.key,
        ),
      );
    },
    SharedProductsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SharedProductsView(),
      );
    },
    SharingProductsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SharingProductsView(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    SwapProductsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SwapProductsView(),
      );
    },
    SwappedProductsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SwappedProductsView(),
      );
    },
    TransitionCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<TransitionCategoryRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TransitionCategoryView(
          args.title,
          key: args.key,
        ),
      );
    },
    UserAdsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<UserAdsDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UserAdsDetailView(
          args.id,
          key: args.key,
        ),
      );
    },
    UserAgreementRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserAgreementView(),
      );
    },
    WelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomeView(),
      );
    },
  };
}

/// generated route for
/// [AdsDetailView]
class AdsDetailRoute extends PageRouteInfo<AdsDetailRouteArgs> {
  AdsDetailRoute({
    required int id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AdsDetailRoute.name,
          args: AdsDetailRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AdsDetailRoute';

  static const PageInfo<AdsDetailRouteArgs> page =
      PageInfo<AdsDetailRouteArgs>(name);
}

class AdsDetailRouteArgs {
  const AdsDetailRouteArgs({
    required this.id,
    this.key,
  });

  final int id;

  final Key? key;

  @override
  String toString() {
    return 'AdsDetailRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [AdsInfoAddView]
class AdsInfoAddRoute extends PageRouteInfo<AdsInfoAddRouteArgs> {
  AdsInfoAddRoute({
    required String? id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AdsInfoAddRoute.name,
          args: AdsInfoAddRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AdsInfoAddRoute';

  static const PageInfo<AdsInfoAddRouteArgs> page =
      PageInfo<AdsInfoAddRouteArgs>(name);
}

class AdsInfoAddRouteArgs {
  const AdsInfoAddRouteArgs({
    required this.id,
    this.key,
  });

  final String? id;

  final Key? key;

  @override
  String toString() {
    return 'AdsInfoAddRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [AdsStateView]
class AdsStateRoute extends PageRouteInfo<void> {
  const AdsStateRoute({List<PageRouteInfo>? children})
      : super(
          AdsStateRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdsStateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AdsSuccessCreateView]
class AdsSuccessCreateRoute extends PageRouteInfo<void> {
  const AdsSuccessCreateRoute({List<PageRouteInfo>? children})
      : super(
          AdsSuccessCreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdsSuccessCreateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChangeLocationView]
class ChangeLocationRoute extends PageRouteInfo<void> {
  const ChangeLocationRoute({List<PageRouteInfo>? children})
      : super(
          ChangeLocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangeLocationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateAdsView]
class CreateAdsRoute extends PageRouteInfo<void> {
  const CreateAdsRoute({List<PageRouteInfo>? children})
      : super(
          CreateAdsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAdsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FeedBackApprovalView]
class FeedBackApprovalRoute extends PageRouteInfo<void> {
  const FeedBackApprovalRoute({List<PageRouteInfo>? children})
      : super(
          FeedBackApprovalRoute.name,
          initialChildren: children,
        );

  static const String name = 'FeedBackApprovalRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPasswordView]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GiveFeedBackView]
class GiveFeedBackRoute extends PageRouteInfo<void> {
  const GiveFeedBackRoute({List<PageRouteInfo>? children})
      : super(
          GiveFeedBackRoute.name,
          initialChildren: children,
        );

  static const String name = 'GiveFeedBackRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HelpView]
class HelpRoute extends PageRouteInfo<void> {
  const HelpRoute({List<PageRouteInfo>? children})
      : super(
          HelpRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MessagesView]
class MessagesRoute extends PageRouteInfo<void> {
  const MessagesRoute({List<PageRouteInfo>? children})
      : super(
          MessagesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MessagesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyAddsView]
class MyAddsRoute extends PageRouteInfo<void> {
  const MyAddsRoute({List<PageRouteInfo>? children})
      : super(
          MyAddsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAddsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyAdsView]
class MyAdsRoute extends PageRouteInfo<void> {
  const MyAdsRoute({List<PageRouteInfo>? children})
      : super(
          MyAdsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAdsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NavigatorView]
class NavigatorRoute extends PageRouteInfo<void> {
  const NavigatorRoute({List<PageRouteInfo>? children})
      : super(
          NavigatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigatorRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NegativeNotificationView]
class NegativeNotificationRoute extends PageRouteInfo<void> {
  const NegativeNotificationRoute({List<PageRouteInfo>? children})
      : super(
          NegativeNotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NegativeNotificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PasswordChangeView]
class PasswordChangeRoute extends PageRouteInfo<void> {
  const PasswordChangeRoute({List<PageRouteInfo>? children})
      : super(
          PasswordChangeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordChangeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileEditView]
class ProfileEditRoute extends PageRouteInfo<void> {
  const ProfileEditRoute({List<PageRouteInfo>? children})
      : super(
          ProfileEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileEditRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Register1View]
class Register1Route extends PageRouteInfo<void> {
  const Register1Route({List<PageRouteInfo>? children})
      : super(
          Register1Route.name,
          initialChildren: children,
        );

  static const String name = 'Register1Route';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Register2View]
class Register2Route extends PageRouteInfo<void> {
  const Register2Route({List<PageRouteInfo>? children})
      : super(
          Register2Route.name,
          initialChildren: children,
        );

  static const String name = 'Register2Route';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterCitySelectView]
class RegisterCitySelectRoute extends PageRouteInfo<void> {
  const RegisterCitySelectRoute({List<PageRouteInfo>? children})
      : super(
          RegisterCitySelectRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterCitySelectRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterDistrictSelectView]
class RegisterDistrictSelectRoute extends PageRouteInfo<void> {
  const RegisterDistrictSelectRoute({List<PageRouteInfo>? children})
      : super(
          RegisterDistrictSelectRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterDistrictSelectRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterNotificationView]
class RegisterNotificationRoute extends PageRouteInfo<void> {
  const RegisterNotificationRoute({List<PageRouteInfo>? children})
      : super(
          RegisterNotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterNotificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SecturityVerifDetailView]
class SecturityVerifDetailRoute extends PageRouteInfo<void> {
  const SecturityVerifDetailRoute({List<PageRouteInfo>? children})
      : super(
          SecturityVerifDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecturityVerifDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SecturityVerificationView]
class SecturityVerificationRoute extends PageRouteInfo<void> {
  const SecturityVerificationRoute({List<PageRouteInfo>? children})
      : super(
          SecturityVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecturityVerificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShareAdsView]
class ShareAdsRoute extends PageRouteInfo<ShareAdsRouteArgs> {
  ShareAdsRoute({
    required String type,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ShareAdsRoute.name,
          args: ShareAdsRouteArgs(
            type: type,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ShareAdsRoute';

  static const PageInfo<ShareAdsRouteArgs> page =
      PageInfo<ShareAdsRouteArgs>(name);
}

class ShareAdsRouteArgs {
  const ShareAdsRouteArgs({
    required this.type,
    this.key,
  });

  final String type;

  final Key? key;

  @override
  String toString() {
    return 'ShareAdsRouteArgs{type: $type, key: $key}';
  }
}

/// generated route for
/// [SharedProductsView]
class SharedProductsRoute extends PageRouteInfo<void> {
  const SharedProductsRoute({List<PageRouteInfo>? children})
      : super(
          SharedProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SharedProductsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SharingProductsView]
class SharingProductsRoute extends PageRouteInfo<void> {
  const SharingProductsRoute({List<PageRouteInfo>? children})
      : super(
          SharingProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SharingProductsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SwapProductsView]
class SwapProductsRoute extends PageRouteInfo<void> {
  const SwapProductsRoute({List<PageRouteInfo>? children})
      : super(
          SwapProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SwapProductsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SwappedProductsView]
class SwappedProductsRoute extends PageRouteInfo<void> {
  const SwappedProductsRoute({List<PageRouteInfo>? children})
      : super(
          SwappedProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SwappedProductsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TransitionCategoryView]
class TransitionCategoryRoute
    extends PageRouteInfo<TransitionCategoryRouteArgs> {
  TransitionCategoryRoute({
    required String title,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TransitionCategoryRoute.name,
          args: TransitionCategoryRouteArgs(
            title: title,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TransitionCategoryRoute';

  static const PageInfo<TransitionCategoryRouteArgs> page =
      PageInfo<TransitionCategoryRouteArgs>(name);
}

class TransitionCategoryRouteArgs {
  const TransitionCategoryRouteArgs({
    required this.title,
    this.key,
  });

  final String title;

  final Key? key;

  @override
  String toString() {
    return 'TransitionCategoryRouteArgs{title: $title, key: $key}';
  }
}

/// generated route for
/// [UserAdsDetailView]
class UserAdsDetailRoute extends PageRouteInfo<UserAdsDetailRouteArgs> {
  UserAdsDetailRoute({
    required int? id,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UserAdsDetailRoute.name,
          args: UserAdsDetailRouteArgs(
            id: id,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UserAdsDetailRoute';

  static const PageInfo<UserAdsDetailRouteArgs> page =
      PageInfo<UserAdsDetailRouteArgs>(name);
}

class UserAdsDetailRouteArgs {
  const UserAdsDetailRouteArgs({
    required this.id,
    this.key,
  });

  final int? id;

  final Key? key;

  @override
  String toString() {
    return 'UserAdsDetailRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [UserAgreementView]
class UserAgreementRoute extends PageRouteInfo<void> {
  const UserAgreementRoute({List<PageRouteInfo>? children})
      : super(
          UserAgreementRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserAgreementRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomeView]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
