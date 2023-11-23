import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class NegativeNotificationView extends ConsumerWidget {
  const NegativeNotificationView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
  return  Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 150.h,left: 16.w,right: 16.w),
        child: Column(
          
          children: [
            SvgPicture.asset(
              'assets/svg/close-circle.svg',
              fit: BoxFit.scaleDown,
            ),
            SizedBox(height: 16.h,),
            Text('İşlem Başarısız!',
            style:  TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Rubik',
              color: const Color(0xffB8372F),
            ),
            
            ),
            SizedBox(height: 24.h,),
            Text('İşleminiz gerçekleştirilemedi! Lütfen girdiğiniz bilgileri kontrol edip tekrar deneyiniz.',
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Rubik',
              color: const Color(AppColors.primaryTextColor),
            ),
            ),
            SizedBox(height: 80.h,),
            CustomFilledButton(text: 'Giriş Ekranına Dön', onTap: (){})
          ],
        ),
      ),
    );
  }
}