import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/forgot_password_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/login_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/register1_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/register_%20district_select_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/register_city_select_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/register_notification_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/secturity_verif_detail_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/secturity_verification_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/welcome_view.dart';
import 'package:atma_paylas_app/features/CreateAds/presentation/pages/ads_detail_view.dart';
import 'package:atma_paylas_app/features/CreateAds/presentation/pages/ads_info_add_view.dart';
import 'package:atma_paylas_app/features/CreateAds/presentation/pages/ads_success_create_view.dart';
import 'package:atma_paylas_app/features/CreateAds/presentation/pages/create_ads_view.dart';
import 'package:atma_paylas_app/features/CreateAds/presentation/pages/transition_category_view.dart';
import 'package:atma_paylas_app/features/Home/presentation/pages/home_view.dart';
import 'package:atma_paylas_app/features/Messages/messages_view.dart';
import 'package:atma_paylas_app/features/MyAdds/my_adds_view.dart';
import 'package:atma_paylas_app/features/Navigator/navigator_view.dart';
import 'package:atma_paylas_app/features/Profile/profile_view.dart';
import 'package:atma_paylas_app/features/Splash/pages/splash_view.dart';
import 'package:atma_paylas_app/features/ShareAds/presentation/pages/share_ads_view.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../features/Authentication/presentation/pages/negative_notification_view.dart';
import '../features/Authentication/presentation/pages/register2_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'View|Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: LoginRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: WelcomeRoute.page,
          initial: true,
          guards: [
            AutoRouteGuard.simple(
              (resolver, router) {
                Log.info(UserRepository.user, path: "AppRouter");
                if (UserRepository.user != null) {
                  router.push(const NavigatorRoute());
                } else {
                  resolver.next();
                }
              },
            )
          ],
        ),
        AutoRoute(
          page: Register1Route.page,
          initial: false,
        ),
        AutoRoute(
          page: Register2Route.page,
          initial: false,
        ),
        AutoRoute(
          page: RegisterCitySelectRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: RegisterDistrictSelectRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: RegisterNotificationRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: ForgotPasswordRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: SecturityVerificationRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: SecturityVerifDetailRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: NegativeNotificationRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: NavigatorRoute.page,
          initial: false,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              initial: true,
            ),
            AutoRoute(
              page: MessagesRoute.page,
              initial: false,
            ),
            AutoRoute(
              page: CreateAdsRoute.page,
              initial: false,
            ),
            AutoRoute(
              page: MyAddsRoute.page,
              initial: false,
            ),
            AutoRoute(
              page: ProfileRoute.page,
              initial: false,
            ),
          ],
        ),
        AutoRoute(
          page: HomeRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: ShareAdsRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: CreateAdsRoute.page,
          initial: false,
        ),
        AutoRoute(page: TransitionCategoryRoute.page, initial: false),
        AutoRoute(page: AdsInfoAddRoute.page, initial: false),
        AutoRoute(page: AdsSuccessCreateRoute.page, initial: false),
        AutoRoute(page: AdsDetailRoute.page, initial: false),
      ];
}
