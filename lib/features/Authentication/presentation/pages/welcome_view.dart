import 'package:atma_paylas_app/common_widgets/custom_border_button.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class WelcomeView extends ConsumerWidget {
  const WelcomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 111.h, bottom: 87.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 100.w,
                  height: 98.779.h,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 92.w, right: 91.w),
                  child: SizedBox(
                    width: 207.w,
                    child: Text(
                      'Atma Paylaş Takasla',
                      style: TextStyle(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Rubik',
                          color: const Color(AppColors.primaryColor)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 51.w, right: 50.w),
                  child: SizedBox(
                    width: 289.w,
                    child: Center(
                      child: Text(
                        'Kullanmadığın eşyaları takasla ya da ücretsiz olarak başkasıyla paylaş.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Rubik',
                            color: const Color(AppColors.primaryColor)),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  CustomFilledButton(
                    onTap: () {},
                    text: 'E-posta ile kayıt ol',
                    iconPath: 'assets/svg/Email.svg',
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomBorderButton(
                    onTap: () {
                      context.pushRoute(const LoginRoute());
                    },
                    text: 'Giriş Yap',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
