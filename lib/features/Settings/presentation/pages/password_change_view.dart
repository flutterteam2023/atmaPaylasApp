import 'package:atma_paylas_app/common_widgets/auth_textfield.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/common_widgets/warning_password.dart';
import 'package:atma_paylas_app/repositories/auth_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class PasswordChangeView extends HookConsumerWidget {
  const PasswordChangeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final oldPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final newPasswordConfirmController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Şifre Değiştir',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontFamily: 'Rubik'
        ),
        ),
        
      
      
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            AuthTextfield(
              controller: oldPasswordController,
              text: 'Eski Şifre', hintText: '***********',obscureText: true,isPassword: true,fillColor: Colors.white,),
            SizedBox(height: 24.h,),
            
            Image.asset('assets/images/linee.png'),
            SizedBox(height: 24.h,),
            AuthTextfield(
              controller: newPasswordController,
              text: 'Yeni Şifre', hintText: '***********',obscureText: true,isPassword: true,fillColor: Colors.white,),
            SizedBox(height: 16.h,),
            Text('Şİfren:',
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
            AuthTextfield(
              controller: newPasswordConfirmController,
              text: 'Yeni Şifre Onayı', hintText: '***********',obscureText: true,isPassword: true,fillColor: Colors.white,),
            SizedBox(height: 24.h,),
            CustomFilledButton(text: 'Uygula ve Devam Et', onTap: (){
              GetIt.instance<AuthRepository>().changePassword(currentPassword: oldPasswordController.value.text, newPassword: newPasswordController.value.text, confirmPassword: newPasswordConfirmController.value.text).then((value) {
                value.fold((l) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l))), (r) => context.router.pop());
              });
              

            })



            
          ],
        ),
      ),
    );
  }
}