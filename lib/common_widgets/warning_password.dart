import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WarningPassword extends StatelessWidget {
  const WarningPassword({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/svg/checkmark.svg'),
        SizedBox(width: 8.w,),
        Text(text,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'Rubik',
          color: const Color(0xff515151)
        ),
        
        ),
      ],
    );
  }
}