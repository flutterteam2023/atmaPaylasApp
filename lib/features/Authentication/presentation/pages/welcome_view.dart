import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class WelcomeView extends ConsumerWidget {
  const WelcomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: 111.h,bottom: 87.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset('assets/images/logo.png',
                width: 100.w,
                height: 98.779.h,
                ),
                SizedBox(height: 24.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 92.w, right: 91.w),
                  child: SizedBox(
                    width: 207.w,
                    child: Text('Atma Paylaş Takasla',
                    style: TextStyle(
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Rubik',
                      color: Color(AppColors.primaryColor)
                    ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 51.w, right: 50.w),
                  child: SizedBox(
                    width: 289.w,
                    child: Center(
                      child: Text('Kullanmadığın eşyaları takasla ya da ücretsiz olarak başkasıyla paylaş.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Rubik',
                        color: Color(AppColors.primaryColor)
                      ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                CustomFilledButton(
                  onTap: () {
                    
                  },
                  text: 'E-posta ile kayıt ol',
                  iconPath: 'assets/svg/Email.svg',
                ),
                SizedBox(height: 24.h,),
                CustomBorderButton(
                  onTap: () {
                    
                  },
                  text: 'Giriş Yap',
                ),
              ],
            ),
          )
          ]
          ,
        ),
      ),
    );
  }
}

class CustomBorderButton extends StatelessWidget {
  const CustomBorderButton({
    super.key, required this.onTap,required this.text,
  });
  final void Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color: const Color(AppColors.primaryColor),
            width: 1.w
          )
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 14.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/Google.svg'),
              SizedBox(width: 16.w,),
              Text(text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Rubik',
                color: const Color(AppColors.primaryColor)
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key, required this.text, required this.onTap, this.iconPath,
  });
  final String text;
  final void Function() onTap;
  final String? iconPath;


  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: const Color(AppColors.primaryColor)
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 14.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconPath!=null? SvgPicture.asset('assets/svg/Email.svg'):const SizedBox.shrink(),
            iconPath!=null?  SizedBox(width: 16.w,):const SizedBox.shrink(),
              Text(text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Rubik',
                color: const Color(AppColors.other)
              ),
              )
            ],
          ),
        )
      ),
    );
  }
}