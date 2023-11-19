import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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