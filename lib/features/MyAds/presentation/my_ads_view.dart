import 'package:atma_paylas_app/common_widgets/ads_card.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MyAdsView extends ConsumerWidget {
  const MyAdsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 80),
        child: Column(
          children: [
            DefaultTabController(
              
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                  Container(
                    child: TabBar(
                      physics: NeverScrollableScrollPhysics(),
                      indicatorColor: Color(AppColors.primaryColor),
                      labelColor: Color(AppColors.primaryColor),
                      unselectedLabelColor: Color(AppColors.primaryTextColor),
                      tabs: [
                        Tab(text: 'İlanlarım'),
                        Tab(text: 'Arşivlediklerim'),
                      ],
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height-150.h, //height of TabBarView
                      decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: <Widget>[
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(top: 24.h),
                            child: Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 16.w),
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
                                          color: Color(AppColors.primaryColor),
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
                                  child: ListView.builder(
                                    itemCount: 4,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return AdsCard(
                                        width:  265.w,
                                        isSaved: false,
                                        adsType: 'Ücretsiz Paylaşıyor',
                                        address: 'Kadıköy / İstanbul',
                                        date: '21/10/2023',
                                        userName: 'user123456',
                                        productImage: 'assets/images/clockdemo.png',
                                        productName: 'Casio Saat',
                                        colorType: Color(0xff6DCEBB),
                                        textColor: Color(0xff05473A),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                 Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 16.w),
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
                                          color: Color(AppColors.primaryColor),
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
                                  child: ListView.builder(
                                    itemCount: 4,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return AdsCard(
                                        width:  265.w,
                                        adsType: 'Ücretsiz Paylaşıyor',
                                        address: 'Kadıköy / İstanbul',
                                        date: '21/10/2023',
                                        userName: 'user123456',
                                        productImage: 'assets/images/clockdemo.png',
                                        productName: 'Casio Saat',
                                        colorType: Color(0xffFD8435),
                                        textColor: Colors.white,
                                        isSaved: false,
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
                                padding:  EdgeInsets.only(right: 16.w,top: 16.h),
                                child: AdsCard(adsType: 'Takaslıyor', address: 'Kadıköy / İstanbul', date: '21/10/2023', userName: 'user123456', productImage: 'assets/images/bicycle.png', productName: 'Lorem Ipsum Bisiklet', colorType: Color(0xffFD8435), textColor: Colors.white, isSaved: true,width: 358.w,),
                              );
                              
                            },
                          )
                        ),
                      ]))
                ])),
          ],
        ),
      ),
    );
  }
}
