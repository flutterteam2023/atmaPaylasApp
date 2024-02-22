import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:atma_paylas_app/features/Authentication/presentation/pages/welcome_view.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class EasySplashView extends ConsumerWidget {
  const EasySplashView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: FlutterSplashScreen.fadeIn(
      backgroundColor: Colors.white,
      onEnd: () {
        context.replaceRoute(const WelcomeRoute());
      },
      childWidget: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Center(child: Image.asset('assets/images/logo.png',
        height:  200.h,
        width: 200.w,
        )),
      ),
      onAnimationEnd: () {
        debugPrint('On Fade In End');
      },
      nextScreen: const WelcomeView(),
    ));
  }
}