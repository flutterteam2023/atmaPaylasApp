import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropField extends StatelessWidget {
  const DropField({
    super.key, required this.text, required this.textInputType, required this.hintText, required this.onTap,
  });
  final String text ;
  final TextInputType textInputType;
  final String hintText;
  final Function() onTap;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
      text,
      style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'Rubik',
          color: const Color(AppColors.primaryTextColor)),
    ),
    SizedBox(
      height: 5.h,
    ),
    TextField(
      onTap: () {
        
      },
      enabled: false,
      keyboardType:textInputType,
      cursorColor: const Color(AppColors.primaryColor),
      decoration: InputDecoration(
        suffixIcon:Bounceable(
          onTap: () {
            
          },
          child: const Icon(Icons.expand_more,color: Color(AppColors.primaryColor),)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(color: Color(0xff858585)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(color: Color(0xff858585)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(color: Color(0xff858585)),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Rubik',
            color: const Color(AppColors.primaryTextColor)),
      ),
    )
      ],
    );
  }
}