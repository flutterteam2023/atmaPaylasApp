// ignore_for_file: always_put_required_named_parameters_first

import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/features/Feed/models/archived_feed_model.dart';
import 'package:atma_paylas_app/repositories/arhived_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

class AdsCard extends StatelessWidget {
  AdsCard({
    super.key,
    required this.adsType,
    required this.address,
    required this.date,
    required this.userName,
    this.seeAdsDetailOnTap,
    required this.productImage,
    required this.productName,
    required this.colorType,
    required this.textColor,
    required this.isSaved,
    required this.width,
    required this.id,
  });
  final String adsType;
  final String address;
  final String productName;
  final String date;
  final String userName;
  final void Function()? seeAdsDetailOnTap;
  final String? productImage;
  final Color colorType;
  final Color textColor;
  final bool isSaved;
  final double width;
  final int id;

  void Function()? saveButtonOnTap;

  @override
  Widget build(BuildContext context) {
    saveButtonOnTap = () {
      GetIt.instance<ArchivedRepository>().toggleArchiveStatus(feedId: id).then((value) {
        GetIt.instance<ArchivedRepository>().clearArchivedList();
        GetIt.instance<ArchivedRepository>().getArchivedFeeds();
      });
    };
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Container(
        width: 265.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Colors.white,
            border: Border.all(color: Color(0xffE0E0E0), width: 2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5.r), topRight: Radius.circular(5.r)),
                    child: productImage != null
                        ? Image.network(
                            productImage!,
                            width: width,
                            height: 129,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/clockdemo.png',
                                width: width,
                                height: 129,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const SizedBox();
                                },
                              );
                            },
                          )
                        : Image.asset(
                            'assets/images/clockdemo.png',
                            width: width,
                            fit: BoxFit.fill,
                          )),
                if (userName != GetIt.instance<UserRepository>().user?.username)
                  ListenableBuilder(
                    listenable: GetIt.instance<ArchivedRepository>(),
                    builder: (context, child) {
                      return GetIt.instance<ArchivedRepository>().isContain(id) == true
                          ? Positioned(
                              top: 17.h,
                              right: 15.w,
                              child: Bounceable(
                                onTap: saveButtonOnTap,
                                child: Container(
                                  height: 32.r,
                                  width: 32.r,
                                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                                  child: SvgPicture.asset(
                                    'assets/svg/bookmark.svg',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            )
                          : Positioned(
                              top: 17.h,
                              right: 15.w,
                              child: Bounceable(
                                onTap: saveButtonOnTap,
                                child: Container(
                                  height: 32.r,
                                  width: 32.r,
                                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                                  child: SvgPicture.asset(
                                    'assets/svg/bookmark-outline.svg',
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                            );
                    },
                  ),
                Positioned(
                  left: 15.w,
                  top: 17.h,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: colorType,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 4.h, bottom: 4.h),
                      child: Center(
                        child: Text(
                          adsType,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Rubik',
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w, right: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    height: 4.h,
                  ),
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Rubik',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
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
                    height: 24.h,
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
                      Padding(
                        padding: EdgeInsets.only(bottom: 17.h, right: 17.w),
                        child: Bounceable(
                          onTap: seeAdsDetailOnTap,
                          child: Container(
                            height: 32.r,
                            width: 32.r,
                            decoration:
                                const BoxDecoration(color: Color(AppColors.primaryColor), shape: BoxShape.circle),
                            child: Center(
                                child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 20.r,
                            )),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
