// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/gen/assets.gen.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class NavigatorView extends StatelessWidget {
  const NavigatorView({super.key});
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      homeIndex: 0,
      lazyLoad: false,
      routes: const [
        HomeRoute(),
        MessagesRoute(),
        CreateAdsRoute(),
        MyAdsRoute(),
        ProfileRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        // the passed child is technically our animated selected-tab page
        child: child,
      ),
      builder: (context, child) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        // Here we're building our Scaffold inside of AutoTabsRouter
        // to access the tabsRouter controller provided in this context
        //
        //alterntivly you could use a global key
        return DecoratedBox(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x1E000000),
                blurRadius: 40,
                offset: Offset(10, 16),
              ),
            ],
          ),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              body: child,
              backgroundColor: Colors.transparent,
              extendBody: true,
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                selectedItemColor: const Color(AppColors.primaryColor),
                unselectedItemColor: const Color(0xFF7B7B7D),
                showUnselectedLabels: true,
                showSelectedLabels: true,
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  tabsRouter.setActiveIndex(index);
                  // here we switch between tabs
                  /* if (index != 2) {
                    tabsRouter.setActiveIndex(index);
                  } else {
                    context.pushRoute(const NavigatorRoute());
                  } */
                },
                items: [
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      Assets.bottomnavbar.home,
                      colorFilter: const ColorFilter.mode(Color(AppColors.primaryColor), BlendMode.srcIn),
                    ),
                    icon: SvgPicture.asset(
                      Assets.bottomnavbar.homeOutline,
                      colorFilter: const ColorFilter.mode(Color(0xFF7B7B7D), BlendMode.srcIn),
                    ),
                    label: 'Ana Sayfa',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      Assets.bottomnavbar.mail,
                      colorFilter: const ColorFilter.mode(Color(AppColors.primaryColor), BlendMode.srcIn),
                    ),
                    icon: SvgPicture.asset(
                      Assets.bottomnavbar.mailOutline,
                      colorFilter: const ColorFilter.mode(Color(0xFF7B7B7D), BlendMode.srcIn),
                    ),
                    label: 'Sohbet',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      Assets.bottomnavbar.addCircleSharp,
                      height: 24,
                      width: 25,
                      colorFilter: const ColorFilter.mode(Color(AppColors.primaryColor), BlendMode.srcIn),
                    ),
                    icon: SvgPicture.asset(
                      Assets.bottomnavbar.addCircleSharp,
                      height: 24,
                      width: 25,
                      colorFilter: const ColorFilter.mode(Color(AppColors.primaryColor), BlendMode.srcIn),
                    ),
                    label: 'İlan Ekle',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      Assets.bottomnavbar.documentText,
                      height: 24,
                      width: 25,
                      colorFilter: const ColorFilter.mode(Color(AppColors.primaryColor), BlendMode.srcIn),
                    ),
                    icon: SvgPicture.asset(
                      Assets.bottomnavbar.documentTextOutline,
                      height: 24,
                      width: 25,
                      colorFilter: const ColorFilter.mode(Color(0xFF7B7B7D), BlendMode.srcIn),
                    ),
                    label: 'İlanlarım',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      Assets.bottomnavbar.person,
                      height: 24,
                      width: 25,
                      colorFilter: const ColorFilter.mode(Color(AppColors.primaryColor), BlendMode.srcIn),
                    ),
                    icon: SvgPicture.asset(
                      Assets.bottomnavbar.personOutline,
                      height: 24,
                      width: 25,
                      colorFilter: const ColorFilter.mode(Color(0xFF7B7B7D), BlendMode.srcIn),
                    ),
                    label: 'Profilim',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
