import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBorderButton extends StatelessWidget {
  const CustomBorderButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  final void Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: const Color(AppColors.primaryColor), width: 1.w)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //SvgPicture.asset('assets/svg/Google.svg'),
              SizedBox(
                width: 16.w,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Rubik',
                    color: const Color(AppColors.primaryColor)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
