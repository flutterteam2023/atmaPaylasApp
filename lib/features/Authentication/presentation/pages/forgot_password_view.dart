import 'package:atma_paylas_app/common_widgets/auth_textfield.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/auth_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:validatorless/validatorless.dart';
@RoutePage()
class ForgotPasswordView extends HookWidget {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
  final formKey = GlobalKey<FormState>();

    final emailController = useTextEditingController();

    return Form(
      key: formKey,
      child: Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                Text(
                    'E-Posta Adresi',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Rubik',
                      color: const Color(AppColors.primaryTextColor),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-Posta Adresi boş bırakılamaz'),
                      Validatorless.email('Geçerli bir E-Posta Adresi giriniz'),
                      Validatorless.max(128, 'E-Posta Adresi en fazla 128 karakter olabilir'),
                      Validatorless.min(6, 'E-Posta Adresi en az 6 karakter olabilir'),
                    ]),
                    decoration: const InputDecoration(
                      hintText: 'user@example.com',
                    ),
                  ),
              SizedBox(height: 48.h,),
              CustomFilledButton(text: 'Doğrulama Kodunu Gönder', onTap:(){
                 if (formKey.currentState!.validate()) {
                  // ignore: lines_longer_than_80_chars
                  GetIt.instance<AuthRepository>().passwordReset(email: emailController.value.text).then((value){
                    // ignore: lines_longer_than_80_chars
                    value.fold((l) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l))), (r) => context.pushRoute(SecturityVerificationRoute(email: emailController.value.text)));
                  });
                 
                 
                  print(emailController.text);
                
                  
                }
    
              })
            ],
          ),
        ),
      ),
    );
    
  }
}