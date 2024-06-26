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
    BlockedUsersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BlockedUsersView(),
      );
    },
    CategoryListingRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryListingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CategoryListingView(
          categoryId: args.categoryId,
          key: args.key,
          categoryName: args.categoryName,
        ),
      );
    },
    ChangeLocationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChangeLocationView(),
      );
    },
    ChatRoomRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRoomRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ChatRoomView(
          userName: args.userName,
          accessToken: args.accessToken,
          feedId: args.feedId,
          userId: args.userId,
          key: args.key,
        ),
      );
    },
    CreateAdsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateAdsView(),
      );
    },
    EasySplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EasySplashView(),
      );
    },
    EmailVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<EmailVerificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EmailVerificationView(
          args.email,
          args.password,
          key: args.key,
        ),
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
    OtherProfileRoute.name: (routeData) {
      final args = routeData.argsAs<OtherProfileRouteArgs>(
          orElse: () => const OtherProfileRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OtherProfileView(
          key: args.key,
          feed: args.feed,
        ),
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
    PublishToConfirmListingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PublishToConfirmListingsView(),
      );
    },
    Register1Route.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Register1View(),
      );
    },
    Register2Route.name: (routeData) {
      final args = routeData.argsAs<Register2RouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: Register2View(
          confirmPassword: args.confirmPassword,
          password: args.password,
          username: args.username,
          email: args.email,
          phoneNumber: args.phoneNumber,
          name: args.name,
          surname: args.surname,
          key: args.key,
        ),
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
    ReportRoute.name: (routeData) {
      final args = routeData.argsAs<ReportRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReportView(
          userId: args.userId,
          key: args.key,
        ),
      );
    },
    SearchingRoute.name: (routeData) {
      final args = routeData.argsAs<SearchingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchingView(
          query: args.query,
          key: args.key,
        ),
      );
    },
    SecturityVerifDetailRoute.name: (routeData) {
      final args = routeData.argsAs<SecturityVerifDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SecturityVerifDetailView(
          args.email,
          key: args.key,
        ),
      );
    },
    SecturityVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<SecturityVerificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SecturityVerificationView(
          args.email,
          key: args.key,
        ),
      );
    },
    SetNewPasswordNotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SetNewPasswordNotificationView(),
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
    WaitingToConfirmListingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WaitingToConfirmListingsView(),
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
/// [BlockedUsersView]
class BlockedUsersRoute extends PageRouteInfo<void> {
  const BlockedUsersRoute({List<PageRouteInfo>? children})
      : super(
          BlockedUsersRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlockedUsersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoryListingView]
class CategoryListingRoute extends PageRouteInfo<CategoryListingRouteArgs> {
  CategoryListingRoute({
    required String categoryId,
    Key? key,
    String? categoryName,
    List<PageRouteInfo>? children,
  }) : super(
          CategoryListingRoute.name,
          args: CategoryListingRouteArgs(
            categoryId: categoryId,
            key: key,
            categoryName: categoryName,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryListingRoute';

  static const PageInfo<CategoryListingRouteArgs> page =
      PageInfo<CategoryListingRouteArgs>(name);
}

class CategoryListingRouteArgs {
  const CategoryListingRouteArgs({
    required this.categoryId,
    this.key,
    this.categoryName,
  });

  final String categoryId;

  final Key? key;

  final String? categoryName;

  @override
  String toString() {
    return 'CategoryListingRouteArgs{categoryId: $categoryId, key: $key, categoryName: $categoryName}';
  }
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
/// [ChatRoomView]
class ChatRoomRoute extends PageRouteInfo<ChatRoomRouteArgs> {
  ChatRoomRoute({
    required String userName,
    required String accessToken,
    required String? feedId,
    required int userId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ChatRoomRoute.name,
          args: ChatRoomRouteArgs(
            userName: userName,
            accessToken: accessToken,
            feedId: feedId,
            userId: userId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatRoomRoute';

  static const PageInfo<ChatRoomRouteArgs> page =
      PageInfo<ChatRoomRouteArgs>(name);
}

class ChatRoomRouteArgs {
  const ChatRoomRouteArgs({
    required this.userName,
    required this.accessToken,
    required this.feedId,
    required this.userId,
    this.key,
  });

  final String userName;

  final String accessToken;

  final String? feedId;

  final int userId;

  final Key? key;

  @override
  String toString() {
    return 'ChatRoomRouteArgs{userName: $userName, accessToken: $accessToken, feedId: $feedId, userId: $userId, key: $key}';
  }
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
/// [EasySplashView]
class EasySplashRoute extends PageRouteInfo<void> {
  const EasySplashRoute({List<PageRouteInfo>? children})
      : super(
          EasySplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'EasySplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmailVerificationView]
class EmailVerificationRoute extends PageRouteInfo<EmailVerificationRouteArgs> {
  EmailVerificationRoute({
    required String email,
    required String? password,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EmailVerificationRoute.name,
          args: EmailVerificationRouteArgs(
            email: email,
            password: password,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EmailVerificationRoute';

  static const PageInfo<EmailVerificationRouteArgs> page =
      PageInfo<EmailVerificationRouteArgs>(name);
}

class EmailVerificationRouteArgs {
  const EmailVerificationRouteArgs({
    required this.email,
    required this.password,
    this.key,
  });

  final String email;

  final String? password;

  final Key? key;

  @override
  String toString() {
    return 'EmailVerificationRouteArgs{email: $email, password: $password, key: $key}';
  }
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
/// [OtherProfileView]
class OtherProfileRoute extends PageRouteInfo<OtherProfileRouteArgs> {
  OtherProfileRoute({
    Key? key,
    FeedDetailModel? feed,
    List<PageRouteInfo>? children,
  }) : super(
          OtherProfileRoute.name,
          args: OtherProfileRouteArgs(
            key: key,
            feed: feed,
          ),
          initialChildren: children,
        );

  static const String name = 'OtherProfileRoute';

  static const PageInfo<OtherProfileRouteArgs> page =
      PageInfo<OtherProfileRouteArgs>(name);
}

class OtherProfileRouteArgs {
  const OtherProfileRouteArgs({
    this.key,
    this.feed,
  });

  final Key? key;

  final FeedDetailModel? feed;

  @override
  String toString() {
    return 'OtherProfileRouteArgs{key: $key, feed: $feed}';
  }
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
/// [PublishToConfirmListingsView]
class PublishToConfirmListingsRoute extends PageRouteInfo<void> {
  const PublishToConfirmListingsRoute({List<PageRouteInfo>? children})
      : super(
          PublishToConfirmListingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PublishToConfirmListingsRoute';

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
class Register2Route extends PageRouteInfo<Register2RouteArgs> {
  Register2Route({
    required String confirmPassword,
    required String password,
    required String username,
    required String email,
    required String phoneNumber,
    required String name,
    required String surname,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          Register2Route.name,
          args: Register2RouteArgs(
            confirmPassword: confirmPassword,
            password: password,
            username: username,
            email: email,
            phoneNumber: phoneNumber,
            name: name,
            surname: surname,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'Register2Route';

  static const PageInfo<Register2RouteArgs> page =
      PageInfo<Register2RouteArgs>(name);
}

class Register2RouteArgs {
  const Register2RouteArgs({
    required this.confirmPassword,
    required this.password,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.name,
    required this.surname,
    this.key,
  });

  final String confirmPassword;

  final String password;

  final String username;

  final String email;

  final String phoneNumber;

  final String name;

  final String surname;

  final Key? key;

  @override
  String toString() {
    return 'Register2RouteArgs{confirmPassword: $confirmPassword, password: $password, username: $username, email: $email, phoneNumber: $phoneNumber, name: $name, surname: $surname, key: $key}';
  }
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
/// [ReportView]
class ReportRoute extends PageRouteInfo<ReportRouteArgs> {
  ReportRoute({
    required int? userId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ReportRoute.name,
          args: ReportRouteArgs(
            userId: userId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ReportRoute';

  static const PageInfo<ReportRouteArgs> page = PageInfo<ReportRouteArgs>(name);
}

class ReportRouteArgs {
  const ReportRouteArgs({
    required this.userId,
    this.key,
  });

  final int? userId;

  final Key? key;

  @override
  String toString() {
    return 'ReportRouteArgs{userId: $userId, key: $key}';
  }
}

/// generated route for
/// [SearchingView]
class SearchingRoute extends PageRouteInfo<SearchingRouteArgs> {
  SearchingRoute({
    required String query,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SearchingRoute.name,
          args: SearchingRouteArgs(
            query: query,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchingRoute';

  static const PageInfo<SearchingRouteArgs> page =
      PageInfo<SearchingRouteArgs>(name);
}

class SearchingRouteArgs {
  const SearchingRouteArgs({
    required this.query,
    this.key,
  });

  final String query;

  final Key? key;

  @override
  String toString() {
    return 'SearchingRouteArgs{query: $query, key: $key}';
  }
}

/// generated route for
/// [SecturityVerifDetailView]
class SecturityVerifDetailRoute
    extends PageRouteInfo<SecturityVerifDetailRouteArgs> {
  SecturityVerifDetailRoute({
    required String email,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SecturityVerifDetailRoute.name,
          args: SecturityVerifDetailRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SecturityVerifDetailRoute';

  static const PageInfo<SecturityVerifDetailRouteArgs> page =
      PageInfo<SecturityVerifDetailRouteArgs>(name);
}

class SecturityVerifDetailRouteArgs {
  const SecturityVerifDetailRouteArgs({
    required this.email,
    this.key,
  });

  final String email;

  final Key? key;

  @override
  String toString() {
    return 'SecturityVerifDetailRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [SecturityVerificationView]
class SecturityVerificationRoute
    extends PageRouteInfo<SecturityVerificationRouteArgs> {
  SecturityVerificationRoute({
    required String email,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SecturityVerificationRoute.name,
          args: SecturityVerificationRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SecturityVerificationRoute';

  static const PageInfo<SecturityVerificationRouteArgs> page =
      PageInfo<SecturityVerificationRouteArgs>(name);
}

class SecturityVerificationRouteArgs {
  const SecturityVerificationRouteArgs({
    required this.email,
    this.key,
  });

  final String email;

  final Key? key;

  @override
  String toString() {
    return 'SecturityVerificationRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [SetNewPasswordNotificationView]
class SetNewPasswordNotificationRoute extends PageRouteInfo<void> {
  const SetNewPasswordNotificationRoute({List<PageRouteInfo>? children})
      : super(
          SetNewPasswordNotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetNewPasswordNotificationRoute';

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
/// [WaitingToConfirmListingsView]
class WaitingToConfirmListingsRoute extends PageRouteInfo<void> {
  const WaitingToConfirmListingsRoute({List<PageRouteInfo>? children})
      : super(
          WaitingToConfirmListingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'WaitingToConfirmListingsRoute';

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
