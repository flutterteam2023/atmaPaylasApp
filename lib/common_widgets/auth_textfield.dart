import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextfield extends StatelessWidget {
  const AuthTextfield({
    super.key, required this.text,  this.textInputType, required this.hintText, this.obscureText, this.isPassword, this.maxLine, this.minLine, this.controller, this.fillColor,
  });
  final String text ;
  final TextInputType? textInputType;
  final String hintText;
  final bool? obscureText;
  final bool? isPassword ;
  final int? maxLine;
  final int? minLine;
  final TextEditingController? controller;
  final Color? fillColor;

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
      controller: controller,
      minLines: minLine??1,
      maxLines: maxLine??1,
      obscureText:obscureText??false ,
      keyboardType:textInputType,
      cursorColor: const Color(AppColors.primaryColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        suffixIcon:isPassword==true? Bounceable(
          onTap: () {
            
          },
          child: const Icon(Icons.visibility_outlined,color: Color(AppColors.primaryColor),)):null,
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