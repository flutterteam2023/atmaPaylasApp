// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/common_widgets/auth_textfield.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button_berke.dart';
import 'package:atma_paylas_app/common_widgets/drop_field.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/features/Authentication/models/register_request/register_request_model.dart';
import 'package:atma_paylas_app/repositories/auth_repository.dart';
import 'package:atma_paylas_app/repositories/city_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:validatorless/validatorless.dart';

@RoutePage()
class Register2View extends HookConsumerWidget {
  Register2View({
    required this.confirmPassword,
    required this.password,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.name,
    required this.surname,
    super.key,
  });
  final String phoneNumber;
  final String email;
  final String username;
  final String password;
  final String confirmPassword;
  final String name;
  final String surname;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final cityController = useTextEditingController();
    final districtController = useTextEditingController();
    final isloading = useState(false);
    return Form(
      key: formKey,
      child: Scaffold(
        bottomNavigationBar:isloading.value==false? Container(
          height: 60,
          margin: EdgeInsets.only(right: 18, left: 18, bottom: MediaQuery.of(context).viewPadding.bottom + 10.h),
          child: CustomFilledButtonBerke(
            text: 'Hesabımı Oluştur',
            onTap: () async {
              if (formKey.currentState!.validate()) {
                isloading.value = true;
                await GetIt.instance<AuthRepository>()
                    .register(
                  RegisterRequestModel(
                    email: email,
                    username: username,
                    password: password,
                    confirmation: confirmPassword,
                    name: name,
                    surname:surname,
                    phoneNumber: phoneNumber,
                    userLocatedCity: cityController.value.text,
                    userLocatedDistrict: districtController.value.text,
                  ),
                )
                    .then((value) {
                  value.fold(
                    (l) {
                      isloading.value = false;
                      Fluttertoast.showToast(msg: l);
                    },
                    (r) async {
                     await GetIt.instance<AuthRepository>().login(email, password).then((value) {
                      value.fold((loginl){
                        isloading.value = false;
                        Fluttertoast.showToast(msg: loginl);

                      
                      }, (loginr) async{
                        isloading.value = false;
                        await context.pushRoute( EmailVerificationRoute( email: email, password: password));
                       
                      
                      });
                     });
                    },
                  );
                });
              } else {
                Log.error('Formu doğru doldurunuz');
              }
            },
          )
        ):SizedBox(
          width: 50,
          height: 50,
          child: Center(
            child: const CircularProgressIndicator(
              
              color: Color(AppColors.primaryColor),),
          ),
        ),
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Bounceable(
                onTap: () {
                  context.replaceRoute(const LoginRoute());
                },
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
                        color: const Color(AppColors.primaryLightColor),
                      ),
                    ),
                    Container(
                      height: 8.h,
                      width: 171.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Nerdeyse bitti! Kişisel bilgilerini girerek kayıt olma işlemini sonlandırabilirsiniz',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: const Color(AppColors.primaryTextColor),
                  ),
                ),
                if (false)
                  SizedBox(
                    height: 24.h,
                  ),
                if (false)
                  Center(
                    child: Column(
                      children: [
                        Container(
                          height: 88.r,
                          width: 88.r,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle, color: Color(AppColors.primaryLightColor)),
                          child: SvgPicture.asset(
                            'assets/svg/gallery-edit.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          'Profil Resmi Ekle',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Rubik',
                            color: const Color(AppColors.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                
                SizedBox(height: 24.h),
                Text(
                  'Bulunduğun İl',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: const Color(AppColors.primaryTextColor),
                  ),
                ),
                SizedBox(height: 5.h),
                FutureBuilder(
                  future: GetIt.instance<CityRepository>().getCities(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const CircularProgressIndicator.adaptive();
                    }
                    return snapshot.data?.fold(
                          (l) => const Text('Hata oluştu. Lütfen daha sonra tekrar deneyin'),
                          (r) => DropdownButtonFormField<String>(
                            hint: const Text('İl Seçiniz'),
                            isExpanded: true,
                            validator: Validatorless.required('İl seçiniz'),
                            value: cityController.value.text.isEmpty ? null : cityController.value.text,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                            },
                            items: (r.isEmpty ? ['İller Getirilemedi', 'dasd'] : r)
                                .toSet()
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              if (value != null) {
                                districtController.clear();
                                cityController.text = value;
                              }
                            },
                          ),
                        ) ??
                        const Text('Hata oluştu. Lütfen daha sonra tekrar deneyin.');
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Bulunduğun İlçe',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: const Color(AppColors.primaryTextColor),
                  ),
                ),
                SizedBox(height: 5.h),
                ListenableBuilder(
                  listenable: cityController,
                  builder: (context, wid) {
                    if (cityController.value.text.isEmpty) {
                      DropdownButtonFormField<String>(
                        hint: const Text('İlçe Seçiniz'),
                        isExpanded: true,
                        validator: Validatorless.required('İlçe seçiniz'),
                        value: districtController.value.text.isEmpty ? null : districtController.value.text,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          EasyLoading.showToast('Önce şehir seçiniz');
                          districtController.clear();
                        },
                        items: (['Önce İl Seçmeniz Gereklidir'])
                            .toSet()
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            districtController.text = value;
                          }
                        },
                      );
                    }
                    return FutureBuilder(
                      future: GetIt.instance<CityRepository>().getDistricts(cityController.text),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return const CircularProgressIndicator.adaptive();
                        }
                        return snapshot.data?.fold(
                              (l) => const Text('Hata oluştu. Lütfen daha sonra tekrar deneyin'),
                              (r) => DropdownButtonFormField<String>(
                                hint: const Text('İlçe Seçiniz'),
                                isExpanded: true,
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                },
                                validator: Validatorless.required('İlçe seçiniz'),
                                value: districtController.text.isEmpty ? null : districtController.text,
                                items: (r.isNotEmpty ? r : ['İlçele', 'asd', 'asdsa'])
                                    .toSet()
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    districtController.text = value;
                                  }
                                },
                              ),
                            ) ??
                            DropdownButtonFormField<String>(
                              hint: const Text('İlçe Seçiniz'),
                              validator: Validatorless.required('İlçe seçiniz'),
                              value: districtController.text.isEmpty ? null : districtController.text,
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                EasyLoading.showToast('Önce şehir seçiniz');
                              },
                              isExpanded: true,
                              items: {'Önce Şehir Seçmelisiniz', 'asdas'}
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {},
                            );
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Kayıt olma işlemini tamamladıktan sonra ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Rubik',
                          color: const Color(AppColors.primaryTextColor),
                        ),
                      ),
                      TextSpan(
                        text: 'Kullanıcı Aydınlatma Metnini ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Rubik',
                          color: const Color(AppColors.primaryColor),
                        ),
                      ),
                      TextSpan(
                        text: 'okumuş ve onaylamış sayılırsın.',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Rubik',
                          color: const Color(AppColors.primaryTextColor),
                        ),
                      ),
                    ],
                  ),
                ),
               
                SizedBox(
                  height: 57.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
