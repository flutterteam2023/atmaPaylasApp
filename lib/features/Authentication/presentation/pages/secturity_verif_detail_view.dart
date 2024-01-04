import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/common_widgets/warning_password.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/auth_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:validatorless/validatorless.dart';
@RoutePage()
class SecturityVerifDetailView extends StatefulHookWidget {
  final String email;
  const SecturityVerifDetailView(this.email, {super.key});

  @override
  State<SecturityVerifDetailView> createState() => _SecturityVerifDetailViewState();
}

class _SecturityVerifDetailViewState extends State<SecturityVerifDetailView> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final passwordController = useTextEditingController();
    final passwordConfirmController = useTextEditingController();
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
                Text(
                    'Yeni Şifre',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Rubik',
                      color: const Color(AppColors.primaryTextColor),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Şifre boş bırakılamaz'),
                      Validatorless.max(32, 'Şifre en fazla 32 karakter olabilir'),
                      Validatorless.min(8, 'Şifre en az 8 karakter olabilir'),
                      Validatorless.compare(passwordConfirmController, 'Şifreler eşleşmiyor'),
                      Validatorless.regex(
                        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'),
                        'Şifre en az bir büyük harf ve bir sayı içermelidir',
                      ),
                    ]),
                    decoration: const InputDecoration(
                      hintText: '***********',
                    ),
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
   
                Text(
                    'Şifre Onayı',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Rubik',
                      color: const Color(AppColors.primaryTextColor),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  TextFormField(
                    controller: passwordConfirmController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Şifre boş bırakılamaz'),
                      Validatorless.max(32, 'Şifre en fazla 32 karakter olabilir'),
                      Validatorless.min(8, 'Şifre en az 8 karakter olabilir'),
                      Validatorless.compare(passwordConfirmController, 'Şifreler eşleşmiyor'),
                      Validatorless.regex(
                        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'),
                        'Şifre en az bir büyük harf ve bir sayı içermelidir',
                      ),
                    ]),
                    decoration: const InputDecoration(
                      hintText: '***********',
                    ),
                  ),
                SizedBox(height:45.h),
                CustomFilledButton(text: 'Yeni Şifre Yarat', onTap: (){
                  if (formKey.currentState!.validate()) {
                    // ignore: lines_longer_than_80_chars
                    GetIt.instance<AuthRepository>().setNewPassword(email: widget.email, newPassword: passwordController.value.text, confirmPassword: passwordConfirmController.value.text).then((value){
                      // ignore: lines_longer_than_80_chars
                      value.fold((l) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l))), (r) => context.replaceRoute(const SetNewPasswordNotificationRoute()));
                    
                    });
                  }
   
   
                })
              ],
            ),
          ),
        ),
      ),
   );
  }
}