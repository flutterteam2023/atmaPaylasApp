// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/common_widgets/custom_filled_button_berke.dart';
import 'package:atma_paylas_app/common_widgets/phone_text_field.dart';
import 'package:atma_paylas_app/common_widgets/warning_password.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:validatorless/validatorless.dart';

@RoutePage()
class Register1View extends StatefulHookConsumerWidget {
  const Register1View({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Register1ViewState();
}

class _Register1ViewState extends ConsumerState<Register1View> {
  String initialCountry = 'TR';
  PhoneNumber number = PhoneNumber(isoCode: 'TR');
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordConfirmController = useTextEditingController();
    return Form(
      key: formKey,
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: MediaQuery.of(context).viewPadding.bottom),
          child: CustomFilledButtonBerke(
            text: 'Onayla ve Devam et',
            onTap: () {
              if (formKey.currentState!.validate()) {
                print(number.phoneNumber);
                print(emailController.text);
                print(usernameController.text);
                print(passwordController.text);
                print(passwordConfirmController.text);
                context.pushRoute(
                  Register2Route(
                    phoneNumber: number.phoneNumber!.replaceAll('+', ''),
                    email: emailController.text,
                    username: usernameController.text,
                    password: passwordController.text,
                    confirmPassword: passwordConfirmController.text,
                  ),
                );
              }
            },
          ),
        ),
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
                    color: const Color(AppColors.primaryColor),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          title: Text(
            'Kayıt Ol',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 8.h,
                      width: 171.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(AppColors.primaryColor),
                      ),
                    ),
                    Container(
                      height: 8.h,
                      width: 171.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(AppColors.primaryLightColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Hesap bilgilerinizi girerek kayıt olma işlemine devam edebilirsiniz',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: const Color(AppColors.primaryTextColor),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Telefon Numarası',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: const Color(AppColors.primaryTextColor),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber numberValue) {
                    print(number.phoneNumber);
                    number = numberValue;
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  cursorColor: const Color(AppColors.primaryColor),
                  selectorTextStyle: const TextStyle(color: Colors.black),
                  initialValue: number,
                  inputDecoration: InputDecoration(
                    hintText: '534 000 00 00',
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Rubik',
                      color: const Color(AppColors.primaryTextColor),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: const BorderSide(color: Color(0xff858585)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: const BorderSide(color: Color(0xff858585)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: const BorderSide(color: Color(0xff858585)),
                    ),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true,
                  ),
                  inputBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff858585)),
                  ),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
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
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Kullanıcı Adı',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: const Color(AppColors.primaryTextColor),
                  ),
                ),
                SizedBox(height: 5.h),
                TextFormField(
                  controller: usernameController,
                  keyboardType: TextInputType.name,
                  validator: Validatorless.multiple([
                    Validatorless.required('Kullanıcı Adı boş bırakılamaz'),
                    Validatorless.max(32, 'Kullanıcı Adı en fazla 32 karakter olabilir'),
                    Validatorless.min(6, 'Kullanıcı Adı en az 6 karakter olabilir'),
                  ]),
                  decoration: const InputDecoration(
                    hintText: 'kullaniciadi',
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Şifre',
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
                SizedBox(height: 16.h),
                Text(
                  'Şİfren:',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: const Color(0xff515151),
                  ),
                ),
                SizedBox(height: 11.5.h),
                const WarningPassword(
                  text: 'En az 8 karakter olmalı',
                ),
                SizedBox(
                  height: 8.h,
                ),
                const WarningPassword(
                  text: 'En az bir büyük harf içermeli (A-Z)',
                ),
                SizedBox(
                  height: 8.h,
                ),
                const WarningPassword(
                  text: 'En az bir sayı ya da karakter içermeli (0-9 / *-^)',
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Şifre Tekrar',
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
                    Validatorless.required('Şifre Tekrar boş bırakılamaz'),
                    Validatorless.max(32, 'Şifre Tekrar en fazla 32 karakter olabilir'),
                    Validatorless.min(8, 'Şifre Tekrar en az 8 karakter olabilir'),
                    Validatorless.compare(passwordController, 'Şifreler eşleşmiyor'),
                    Validatorless.regex(
                      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'),
                      'Şifre en az bir büyük harf ve bir sayı içermelidir',
                    ),
                  ]),
                  decoration: const InputDecoration(
                    hintText: '***********',
                  ),
                ),
                SizedBox(height: 45.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getPhoneNumber(String phoneNumber) async {
    final number = await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }
}
