import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class UserAgreementView extends ConsumerWidget {
  const UserAgreementView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Kullanıcı Sözleşmesi',
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontFamily: 'Rubik'
        ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lorem Ipsum',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontFamily: 'Rubik'
            ),
            ),
            SizedBox(height: 16.h,),
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore .Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id es',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Color(AppColors.primaryTextColor),
              fontFamily: 'Rubik'
            ),
            
            
            ),
            SizedBox(height: 16.h,),
            Text('Lorem Ipsum',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontFamily: 'Rubik'
            ),
            ),
            SizedBox(height: 16.h,),
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore .Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id es',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Color(AppColors.primaryTextColor),
              fontFamily: 'Rubik'
            ),
            
            
            )
          ],
        ),
      ),
    );
  }
}