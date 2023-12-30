// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/common_widgets/ads_card.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MyAdsView extends ConsumerWidget {
  const MyAdsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 80,
        ),
        child: Column(
          children: [
            DefaultTabController(
                length: 2, // length of tabs
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                  const TabBar(
                    physics: NeverScrollableScrollPhysics(),
                    indicatorColor: Color(AppColors.primaryColor),
                    labelColor: Color(AppColors.primaryColor),
                    unselectedLabelColor: Color(AppColors.primaryTextColor),
                    tabs: [
                      Tab(text: 'Aktif İlanlarım'),
                      Tab(text: 'Arşivlediklerim'),
                    ],
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height - 150.h, //height of TabBarView
                      decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
                      child: TabBarView(physics: const NeverScrollableScrollPhysics(), children: <Widget>[
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 24.h,
                              bottom: MediaQuery.of(context).viewPadding.bottom + kBottomNavigationBarHeight + 18 * 2,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Paylaşılacak Ürünlerim',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Hepsini Gör',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                          color: const Color(AppColors.primaryColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                SizedBox(
                                  height: 300.h,
                                  child: FutureBuilder(
                                    future: GetIt.instance<FeedRepository>().myActiveFreeFeeds,
                                    builder: (context, snapshot) {
                                      return ListView.builder(
                                        itemCount: snapshot.data?.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return AdsCard(
                                            width: 265.w,
                                            isSaved: false,
                                            adsType: 'Ücretsiz Paylaşıyor',
                                            address: '${snapshot.data?[index].category} / İstanbul',
                                            date: '21/10/2023',
                                            userName: 'user123456',
                                            productImage: snapshot.data?[index].image1,
                                            productName: '${snapshot.data?[index].title}',
                                            colorType: const Color(0xff6DCEBB),
                                            textColor: const Color(0xff05473A),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Takaslanacak Ürünlerim',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Hepsini Gör',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'Rubik',
                                          fontWeight: FontWeight.w500,
                                          color: const Color(AppColors.primaryColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                SizedBox(
                                  height: 300.h,
                                  child: FutureBuilder(
                                    future: GetIt.instance<FeedRepository>().myActiveTradableFeeds,
                                    builder: (context, snapshot) {
                                      return ListView.builder(
                                        itemCount: snapshot.data?.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return AdsCard(
                                            width: 265.w,
                                            adsType: 'Ücretsiz Paylaşıyor',
                                            address: 'Kadıköy / İstanbul',
                                            date: '21/10/2023',
                                            userName: 'user123456',
                                            productImage: snapshot.data?[index].image1,
                                            productName: '${snapshot.data?[index].title}',
                                            colorType: const Color(0xffFD8435),
                                            textColor: Colors.white,
                                            isSaved: false,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            child: ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 16.w, top: 16.h),
                              child: AdsCard(
                                adsType: 'Takaslıyor',
                                address: 'Kadıköy / İstanbul',
                                date: '21/10/2023',
                                userName: 'user123456',
                                productImage: 'assets/images/bicycle.png',
                                productName: 'Lorem Ipsum Bisiklet',
                                colorType: const Color(0xffFD8435),
                                textColor: Colors.white,
                                isSaved: true,
                                width: 358.w,
                              ),
                            );
                          },
                        )),
                      ]))
                ])),
          ],
        ),
      ),
    );
  }
}
