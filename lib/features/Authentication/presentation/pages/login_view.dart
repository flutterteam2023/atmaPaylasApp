// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/common_widgets/auth_textfield.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button_berke.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/auth_repository.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class LoginView extends HookWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final emailcontroller = useTextEditingController();
    final passcontroller = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.pushRoute(const WelcomeRoute());
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(AppColors.primaryColor),
          ),
        ),
        foregroundColor: const Color(AppColors.primaryColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 18.h, left: 16.w, right: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Giriş Yap',
                    style: TextStyle(
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Rubik',
                      color: const Color(AppColors.primaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Hesap bilgilerinizi girerek giriş yapabilirsiniz.',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Rubik',
                      color: const Color(AppColors.primaryTextColor),
                    ),
                  ),
                  SizedBox(
                    height: 37.h,
                  ),
                  Text(
                    "E-Posta Adresi",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Rubik',
                      color: const Color(
                        AppColors.primaryTextColor,
                      ),
                    ),
                  ),
                  const Gap(9),
                  TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "isim@alanadi.com",
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    "Şifre",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Rubik',
                      color: const Color(AppColors.primaryTextColor),
                    ),
                  ),
                  const Gap(9),
                  TextFormField(
                    controller: passcontroller,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      hintText: "Şifre",
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Bounceable(
                        onTap: () {
                          context.pushRoute(const ForgotPasswordRoute());
                        },
                        child: Text(
                          'Şifremi Unuttum',
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
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomFilledButtonBerke(
                    text: 'Giriş Yap',
                    onTap: () async {
                      await GetIt.instance<AuthRepository>()
                          .login(
                        emailcontroller.text,
                        passcontroller.text,
                      )
                          .then((value) {
                        value.fold(
                          (l) => Fluttertoast.showToast(msg: l),
                          
                          (r) async {
                            if (r.success==null) {
                              await GetIt.instance<UserRepository>().getMyUserProfile().then((val) {
                              val.fold(
                                (l) {
                                  Log.error(l);
                                  GetIt.instance<UserRepository>().user = null;
                                },
                                (r) {
                                  Log.success(r.runtimeType);
                                
                              
                                  GetIt.instance<UserRepository>().user = r;
                                  context.pushRoute(const NavigatorRoute());
                                },
                              );
                            });
                              
                            } else {
                              await Fluttertoast.showToast(msg: r.success!);
                              // ignore: use_build_context_synchronously
                              await context.pushRoute(EmailVerificationRoute(email: emailcontroller.text,password: passcontroller.text));
                              
                            }
                          },
                        );
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 36.h, top: 18),
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
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushRoute(const Register1Route());
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
