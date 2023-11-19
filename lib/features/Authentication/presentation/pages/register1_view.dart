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
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

@RoutePage()
class Register1View extends StatefulHookConsumerWidget {
  const Register1View({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Register1ViewState();
}

class _Register1ViewState extends ConsumerState<Register1View> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'TR';
  PhoneNumber number = PhoneNumber(isoCode: 'TR');
  @override
  Widget build(BuildContext context) {
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
                        borderRadius: BorderRadius.circular(10.r), color: const Color(AppColors.primaryColor)),
                  ),
                  Container(
                    height: 8.h,
                    width: 171.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r), color: const Color(AppColors.primaryLightColor)),
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
                    color: const Color(AppColors.primaryTextColor)),
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
                    color: const Color(AppColors.primaryTextColor)),
              ),
              SizedBox(
                height: 5.h,
              ),
              PhoneTextField(number: number, controller: controller),
              SizedBox(
                height: 24.h,
              ),
              const AuthTextfield(
                text:'E-Posta Adresi',
                textInputType: TextInputType.emailAddress,
                hintText: 'user@example.com',
      
              ),
              SizedBox(
                height: 24.h,
              ),
              const AuthTextfield(
                text:'Kullanıcı Adı',
                textInputType: TextInputType.visiblePassword,
                hintText: 'xxuser123456',
              ),
              SizedBox(
                height: 24.h,
              ),
              const AuthTextfield(
                text:'Şifre',
                textInputType: TextInputType.visiblePassword,
                hintText: '********',
                obscureText: true,
                isPassword: true,
              ),
              SizedBox(height:16.h),
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

              const AuthTextfield(
                text:'Şifre Onayı',
                textInputType: TextInputType.visiblePassword,
                hintText: '********',
                obscureText: true,
                isPassword: true,
              ),
              SizedBox(height:45.h),
              CustomFilledButton(text: 'Onayla ve Devam et', onTap: (){})
            ],
          ),
        ),
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number = await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}






