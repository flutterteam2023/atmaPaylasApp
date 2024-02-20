import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/email_vireification_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/forgot_password_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/login_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/negative_notification_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/register1_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/register2_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/register_%20district_select_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/register_city_select_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/register_notification_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/secturity_verif_detail_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/secturity_verification_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/set_new_password_notification_view.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/welcome_view.dart';
import 'package:atma_paylas_app/features/Category/views/categort_listing_view.dart';
import 'package:atma_paylas_app/features/CreateAds/presentation/pages/ads_detail_view.dart';
import 'package:atma_paylas_app/features/CreateAds/presentation/pages/ads_info_add_view.dart';
import 'package:atma_paylas_app/features/CreateAds/presentation/pages/ads_success_create_view.dart';
import 'package:atma_paylas_app/features/CreateAds/presentation/pages/create_ads_view.dart';
import 'package:atma_paylas_app/features/CreateAds/presentation/pages/transition_category_view.dart';
import 'package:atma_paylas_app/features/Feed/models/feed_detail_model.dart';
import 'package:atma_paylas_app/features/FeedBackApproval/presentation/pages/feedback_approval_view.dart';
import 'package:atma_paylas_app/features/FeedBackApproval/presentation/pages/give_feedback_view.dart';
import 'package:atma_paylas_app/features/Help/presentation/pages/help_view.dart';
import 'package:atma_paylas_app/features/Home/presentation/pages/home_view.dart';
import 'package:atma_paylas_app/features/Home/presentation/pages/searching_view.dart';
import 'package:atma_paylas_app/features/Messages/views/chat_room_view.dart';
import 'package:atma_paylas_app/features/Messages/views/messages_view.dart';
import 'package:atma_paylas_app/features/MyAdds/my_adds_view.dart';
import 'package:atma_paylas_app/features/MyAds/presentation/ads_state_view.dart';
import 'package:atma_paylas_app/features/MyAds/presentation/my_ads_view.dart';
import 'package:atma_paylas_app/features/MyAds/presentation/user_ads_detail_view.dart';
import 'package:atma_paylas_app/features/Navigator/navigator_view.dart';
import 'package:atma_paylas_app/features/Profile/other_profile_view.dart';
import 'package:atma_paylas_app/features/Profile/profile_edit_view.dart';
import 'package:atma_paylas_app/features/Profile/profile_view.dart';
import 'package:atma_paylas_app/features/ReportAndBlock/views/blocked_users_view.dart';
import 'package:atma_paylas_app/features/ReportAndBlock/views/report_view.dart';
import 'package:atma_paylas_app/features/Settings/presentation/pages/change_location_view.dart';
import 'package:atma_paylas_app/features/Settings/presentation/pages/password_change_view.dart';
import 'package:atma_paylas_app/features/Settings/presentation/pages/settings_view.dart';
import 'package:atma_paylas_app/features/ShareAds/presentation/pages/share_ads_view.dart';
import 'package:atma_paylas_app/features/SharedProduct/presentation/pages/shared_products_view.dart';
import 'package:atma_paylas_app/features/SharedProduct/presentation/pages/sharing_products_view.dart';
import 'package:atma_paylas_app/features/Splash/pages/splash_view.dart';
import 'package:atma_paylas_app/features/SwapProducts/presentation/swap_products_view.dart';
import 'package:atma_paylas_app/features/SwapProducts/presentation/swapped_products_view.dart';
import 'package:atma_paylas_app/features/UserAgreement/page/user_agreement_view.dart';
import 'package:atma_paylas_app/features/WaitingToConfirm/waiting_to_confirm_listings_view.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
                Log.info(GetIt.instance<UserRepository>().user, path: "AppRouter");
                if (GetIt.instance<UserRepository>().user != null) {
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
        AutoRoute(page: OtherProfileRoute.page, initial: false),
        AutoRoute(page: ProfileEditRoute.page, initial: false),
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
          page: SetNewPasswordNotificationRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: PasswordChangeRoute.page,
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
          page: ChangeLocationRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: EmailVerificationRoute.page,
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
              initial: false,
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
              page: MyAdsRoute.page,
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
          page: ReportRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: BlockedUsersRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: SearchingRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: ShareAdsRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: CategoryListingRoute.page,
          initial: false,
        ),
        AutoRoute(
          page: CreateAdsRoute.page,
          initial: false,
        ),
        AutoRoute(page: TransitionCategoryRoute.page, initial: false),
        AutoRoute(page: WaitingToConfirmListingsRoute.page, initial: false),
        AutoRoute(page: ChatRoomRoute.page, initial: false),
        AutoRoute(page: AdsInfoAddRoute.page, initial: false),
        AutoRoute(page: AdsSuccessCreateRoute.page, initial: false),
        AutoRoute(page: AdsDetailRoute.page, initial: false),
        AutoRoute(page: MyAddsRoute.page, initial: false),
        AutoRoute(page: UserAdsDetailRoute.page, initial: false),
        AutoRoute(page: AdsStateRoute.page, initial: false),
        AutoRoute(page: SharingProductsRoute.page, initial: false),
        AutoRoute(page: SharedProductsRoute.page, initial: false),
        AutoRoute(page: SwapProductsRoute.page, initial: false),
        AutoRoute(page: SwappedProductsRoute.page, initial: false),
        AutoRoute(page: UserAgreementRoute.page, initial: false),
        AutoRoute(page: FeedBackApprovalRoute.page, initial: false),
        AutoRoute(page: GiveFeedBackRoute.page, initial: false),
        AutoRoute(page: HelpRoute.page, initial: false),
        AutoRoute(page: SettingsRoute.page, initial: false),
        AutoRoute(page: ProfileRoute.page, initial: false),
      ];
}
