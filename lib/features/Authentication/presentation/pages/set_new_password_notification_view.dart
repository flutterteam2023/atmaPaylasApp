import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
@RoutePage()
class SetNewPasswordNotificationView extends StatelessWidget {
  const SetNewPasswordNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 150.h,left: 16.w,right: 16.w),
        child: Column(
          
          children: [
            SvgPicture.asset(
              'assets/svg/tick-circle.svg',
              fit: BoxFit.scaleDown,
            ),
            SizedBox(height: 16.h,),
            Text('Şifre değiştirme İşlemi Başarılı!',
            style:  TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'Rubik',
              color: const Color(AppColors.primaryColor),
            ),
            
            ),
            SizedBox(height: 24.h,),
            Text('Şifre değiştirme işlemini başarıyla tamamladın!',
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Rubik',
              color: const Color(AppColors.primaryTextColor),
            ),
            ),
            SizedBox(height: 80.h,),
            CustomFilledButton(text: 'Giriş Yap', onTap: (){
              context.replaceRoute(const LoginRoute());
            },),
          ],
        ),
      ),
    );
  }
}
