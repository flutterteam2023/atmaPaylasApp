import 'package:atma_paylas_app/common_widgets/auth_textfield.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/common_widgets/phone_text_field.dart';
import 'package:atma_paylas_app/common_widgets/warning_password.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class SecturityVerifDetailView extends ConsumerWidget {
  const SecturityVerifDetailView({super.key});
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
          'Güvenlik Doğrulaması',
          style: TextStyle(
            fontSize: 21.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Rubik',
            color: const Color(AppColors.primaryColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h, bottom: 44.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Doğrulama işlemi başarılı! Şimdi yeni şifreyi yaratabilirsin.',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: const Color(AppColors.primaryTextColor)),
              ),
              
              
             
              
              SizedBox(
                height: 24.h,
              ),
              const AuthTextfield(
                text:'Yeni Şifre',
                textInputType: TextInputType.visiblePassword,
                hintText: '********',
                obscureText: true,
                isPassword: true,
              ),
              SizedBox(height:16.h),
              Text('Şifren:',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Rubik',
                color: const Color(0xff515151)
              ),
              
              ),
              SizedBox(height:11.5.h),
              const WarningPassword(
                text: 'En az 8 karakter olmalı',
              ),
              SizedBox(height: 8.h,),
              const WarningPassword(
                text: 'En az bir büyük harf içermeli (A-Z)',
              ),
              SizedBox(height: 8.h,),

              const WarningPassword(
                text: 'En az bir sayı ya da karakter içermeli (0-9 / *-^)',
              ),
              SizedBox(
                height: 24.h,
              ),

              const AuthTextfield(
                text:'Yeni Şifre Onayı',
                textInputType: TextInputType.visiblePassword,
                hintText: '********',
                obscureText: true,
                isPassword: true,
              ),
              SizedBox(height:45.h),
              CustomFilledButton(text: 'Yeni Şifre Yarat', onTap: (){})
            ],
          ),
        ),
      ),
    );
  }
}