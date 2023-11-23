import 'package:atma_paylas_app/common_widgets/auth_textfield.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class ForgotPasswordView extends ConsumerWidget {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Bounceable(
              onTap: () {},
              child: Text(
                'Vazgeç',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: const Color(AppColors.primaryColor)),
              ),
            ),
          )
        ],
        centerTitle: false,
        title: Text(
          'Şifremi Unuttum',
          style: TextStyle(
            fontSize: 21.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Rubik',
            color: const Color(AppColors.primaryColor),
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 16.h,right: 16.w,left: 16.w),
        child: Column(
          children: [
            Text('Şifre değiştirme işlemi için kayıtlı E-posta üzerinden Güvenlik Doğrulaması yapmanız gerekmektedir.',
            
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Rubik',
              color: const Color(AppColors.primaryTextColor),
            ),
            
            ),
            SizedBox(height: 32.h,),
            const AuthTextfield(text: 'E-Posta Adresi', textInputType: TextInputType.emailAddress, hintText: 'user@example.com'),
            SizedBox(height: 48.h,),
            CustomFilledButton(text: 'Doğrulama Kodunu Gönder', onTap:(){})
          ],
        ),
      ),
    );
    
  }
}