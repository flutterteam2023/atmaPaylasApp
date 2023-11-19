import 'package:atma_paylas_app/common_widgets/auth_textfield.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/common_widgets/drop_field.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class Register2View extends HookConsumerWidget {
  const Register2View({super.key});
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
                        borderRadius: BorderRadius.circular(10.r), color: const Color(AppColors.primaryLightColor)),
                  ),
                  Container(
                    height: 8.h,
                    width: 171.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r), color: const Color(AppColors.primaryColor)),
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
                    color: const Color(AppColors.primaryTextColor)),
              ),
              SizedBox(
                height: 24.h,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 88.r,
                      width: 88.r,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(AppColors.primaryLightColor)),
                      child: SvgPicture.asset(
                        'assets/svg/gallery-edit.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text('Profil Resmi Ekle',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Rubik',
                      color: const Color(AppColors.primaryColor)
                    ),
                    )
              
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              const AuthTextfield(text: 'Ad', textInputType: TextInputType.name, hintText: 'Adalet'),
              SizedBox(
                height: 24.h,
              ),
              const AuthTextfield(text: 'Soyad', textInputType: TextInputType.name, hintText: 'Saçar'),
              SizedBox(
                height: 24.h,
              ),
              DropField(text: 'Bulunduğun İl', textInputType: TextInputType.name, hintText: 'İstanbul',
              onTap: () {
                
              },
              ),
              SizedBox(
                height: 24.h,
              ),
              DropField(
                onTap: () {
                  
                },
                text: 'Bulunduğun İlçe', textInputType: TextInputType.name, hintText: 'Kadıköy'),

              SizedBox(height: 16.h,),
              RichText(

                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Kayıt olma işlemini tamamladıktan sonra ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Rubik',
                        color: const Color(AppColors.primaryTextColor)
                      ),
                    ),
                    TextSpan(
                      text: 'Kullanıcı Aydınlatma Metnini',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Rubik',
                        color: const Color(AppColors.primaryColor)
                      ),
                    ),
                    TextSpan(
                      text: 'okumuş ve onaylamış sayılırsın.',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Rubik',
                        color: const Color(AppColors.primaryTextColor)
                      ),
                    ),
                    
                  ]
                ),
              ),
              SizedBox(height: 57.h,),
              CustomFilledButton(text: 'Kayıt Ol', onTap: (){})
              

            ],
          ),
        ),
      ),
    );
  }
}
