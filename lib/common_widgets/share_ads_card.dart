// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShareAdsCard extends StatelessWidget {
  const ShareAdsCard({
    super.key,
    required this.title,
    required this.address,
    required this.date,
    required this.userName,
    required this.image,
    this.onTap,
    required this.color,
    required this.textColor,
    required this.type,
    required this.isShimmer,
  });
  final bool isShimmer;
  final String title;
  final String address;
  final String date;
  final String userName;
  final String? image;
  final void Function()? onTap;
  final Color color;
  final Color textColor;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                if (image != null)
                  Image.network(image!, fit: BoxFit.fill, width: 143.w, height: 152.h)
                else
                  Image.asset('assets/images/bicycle.png', fit: BoxFit.fill, width: 143.w, height: 152.h),
                Positioned(
                  top: 17.h,
                  left: 17.w,
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r), color: color),
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 4.h, bottom: 4.h),
                      child: Center(
                        child: Text(
                          type,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Rubik',
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 16.w,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 208.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Rubik',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Rubik',
                      color: const Color(AppColors.primaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Rubik',
                      color: const Color(0xff858585),
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Rubik',
                          color: const Color(0xff858585),
                        ),
                      ),
                      Bounceable(
                        onTap: () {},
                        child: Container(
                          height: 32.r,
                          width: 32.r,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(AppColors.primaryColor),
                          ),
                          child: Icon(Icons.arrow_forward, color: Colors.white, size: 20.r),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
