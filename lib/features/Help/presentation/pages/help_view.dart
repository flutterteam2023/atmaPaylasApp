// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HelpView extends ConsumerWidget {
  const HelpView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Yardım & Destek',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black, fontFamily: 'Rubik'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            Bounceable(
              onTap: () {
                context.pushRoute(const GiveFeedBackRoute());
              },
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                  border: Border.all(color: const Color.fromARGB(255, 130, 127, 127), width: 1.w),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Geri Bildirim Ver',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'Rubik',
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16.sp,
                        color: const Color(AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Bounceable(
              onTap: () {},
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                  border: Border.all(color: const Color.fromARGB(255, 130, 127, 127), width: 1.w),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gizlilik Politikası',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'Rubik',
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16.sp,
                        color: const Color(AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Bounceable(
              onTap: () {
                context.pushRoute(const UserAgreementRoute());
              },
              child: Container(
                height: 48.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Colors.white,
                  border: Border.all(color: const Color.fromARGB(255, 130, 127, 127), width: 1.w),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kullanıcı Sözleşmesi',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'Rubik',
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16.sp,
                        color: const Color(AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
