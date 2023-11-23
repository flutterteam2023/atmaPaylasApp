import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CitySelect extends StatelessWidget {
  const CitySelect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: (){
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Colors.white,
          border: Border.all(color:const Color(AppColors.primaryColor),width: 1)
        ),
        child: Padding(
          padding:  EdgeInsets.all(12.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('İstanbul',style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Rubik',
                color: const Color(AppColors.primaryTextColor),
              ),),
              Text('Seç',style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Rubik',
                color: const Color(AppColors.primaryColor),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
