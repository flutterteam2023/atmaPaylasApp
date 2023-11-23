import 'package:atma_paylas_app/common_widgets/auth_textfield.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class LoginView extends HookConsumerWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 103.h,left: 16.w,right: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Giriş Yap',
                style: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Rubik',
                  color: const Color(AppColors.primaryColor),
                ),
                
                ),
                SizedBox(height: 16.h,),
                Text('Hesap bilgilerinizi girerek giriş yapabilirsiniz.',
                
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Rubik',
                  color: const Color(AppColors.primaryTextColor),
                ),
                
                ),
                SizedBox(height: 37.h,),
                const AuthTextfield(text: 'E-Posta Adresi', textInputType: TextInputType.emailAddress, hintText: 'user@example.com'),
                SizedBox(height: 24.h,),
                const AuthTextfield(text: 'Şifre', textInputType: TextInputType.visiblePassword, hintText: '********',obscureText: true,isPassword: true,),
                SizedBox(height: 16.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Bounceable(
                      onTap: (){
                      },
                      child: Text('Şifremi Unuttum',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Rubik',
                        color: const Color(AppColors.primaryColor),
                      ),
                      
                      ),

                    ),
                  ],
                ),
                SizedBox(height: 40.h,),
                CustomFilledButton(text: 'Giriş Yap', onTap: (){})
              
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: 36.h),
              child: RichText(
                text: TextSpan(
                  text: 'Hesabın yok mu? ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: const Color(AppColors.primaryTextColor),
                  ),
                  children: [
                    TextSpan(
                      text: 'Kayıt Ol',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Rubik',
                        color: const Color(AppColors.primaryColor),
                        
                      ),
                      recognizer: TapGestureRecognizer()..onTap = (){
                      }
                     
                    )
                  ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}