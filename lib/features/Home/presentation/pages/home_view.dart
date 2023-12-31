// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/common_widgets/ads_card.dart';
import 'package:atma_paylas_app/common_widgets/ads_title.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/arhived_repository.dart';
import 'package:atma_paylas_app/repositories/category_repository.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd/MM/yyyy');
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          'Atma Paylaş Takasla',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Rubik',
            color: Color(AppColors.primaryColor),
          ),
        ),
        actions: [
          InkWell(
            onTap: () async {},
            child: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: SvgPicture.asset(
                'assets/svg/notifications-outline.svg',
              ),
            ),
          ),
        ],
      ),
      body: StatefulBuilder(
        builder: (context, setStateMostViewedState) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 16.h,
                    right: 16.w,
                    left: 16.w,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        cursorColor: const Color(AppColors.primaryColor),
                        decoration: InputDecoration(
                          hintText: 'Ürün, kategori ara',
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Rubik',
                            color: const Color(0xff858585),
                          ),
                          prefixIcon: SvgPicture.asset(
                            'assets/svg/search-primary.svg',
                            fit: BoxFit.scaleDown,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Color(0xffE0E0E0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: const BorderSide(
                              color: Color(0xffE0E0E0),
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: const BorderSide(
                              color: Color(0xffE0E0E0),
                              width: 2,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32.h,
                  child: FutureBuilder(
                    future: GetIt.instance<CategoryRepository>().getMainCategories(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return const CircularProgressIndicator.adaptive();
                      }
                      return snapshot.data!.fold(
                        (l) => const SizedBox(),
                        (r) => ListView.builder(
                          padding: EdgeInsets.only(left: 8.w, right: 16),
                          scrollDirection: Axis.horizontal,
                          itemCount: r.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: const Color(AppColors.primaryColor),
                                    width: 2,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                                  child: Center(
                                    child: Text(
                                      r[index].name,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Rubik',
                                        color: const Color(AppColors.primaryColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Column(
                    children: [
                      Container(
                        height: 100.h,
                        color: const Color(AppColors.primaryLightColor),
                        child: Center(
                          child: Text(
                            'Reklam Alanı',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Rubik',
                              color: const Color(AppColors.primaryColor),
                            ),
                          ),
                        ),
                      ),
                      if (false)
                        SizedBox(
                          height: 16.h,
                        ),
                      if (false)
                        AdsTitle(
                          title: 'Yakındaki İlanlar',
                          onTap: () {},
                        ),
                      if (false)
                        SizedBox(
                          height: 16.h,
                        ),
                    ],
                  ),
                ),
                if (false)
                  SizedBox(
                    height: 300.h,
                    child: FutureBuilder(
                      future: GetIt.instance<FeedRepository>().mostViewedFeeds,
                      builder: (context, snaphot) {
                        if (snaphot.connectionState != ConnectionState.done) {
                          return customListViewShimmer(formatter);
                        }
                        return ListView.builder(
                          padding: EdgeInsets.only(right: 16.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: snaphot.data?.length,
                          itemBuilder: (context, index) {
                            return AdsCard(
                              isSaved: snaphot.data?[index].isArchived ?? false,
                              width: 265.w,
                              colorType: const Color(0xff6DCEBB),
                              textColor: const Color(0xff05473A),
                              adsType: snaphot.data?[index].listingType == ListingTypes.free.name
                                  ? 'Ücretsiz Paylaşıyor'
                                  : 'Takas Ediyor',
                              address:
                                  '${snaphot.data?[index].ownerInfo.district} / ${snaphot.data?[index].ownerInfo.city}',
                              productName: '${snaphot.data?[index].title}}',
                              date: formatter.format(snaphot.data?[index].createdAt ?? DateTime.now()),
                              userName: '${snaphot.data?[index].ownerInfo.username}',
                              productImage: snaphot.data?[index].image1,
                              saveButtonOnTap: () async {
                                await GetIt.instance<ArchivedRepository>()
                                    .toggleArchiveStatus(feedId: snaphot.data![index].id);
                                await GetIt.instance<FeedRepository>().clearMostViewedFeeds();
                                setStateMostViewedState(() {});
                              },
                              seeAdsDetailOnTap: () {
                                context.pushRoute(AdsDetailRoute(id: snaphot.data![index].id));
                              },
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
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: AdsTitle(
                    title: 'En Çok Ziyaret Edilenler',
                    onTap: () {
                      context.pushRoute(ShareAdsRoute(type: 'most_viewed'));
                    },
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 300.h,
                  child: FutureBuilder(
                    future: GetIt.instance<FeedRepository>().mostViewedFeeds,
                    builder: (context, snaphot) {
                      if (snaphot.connectionState != ConnectionState.done) {
                        return customListViewShimmer(formatter);
                      }
                      return ListView.builder(
                        padding: EdgeInsets.only(right: 16.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: snaphot.data?.length,
                        itemBuilder: (context, index) {
                          return AdsCard(
                            isSaved: snaphot.data?[index].isArchived ?? false,
                            width: 265.w,
                            textColor: snaphot.data?[index].listingType == ListingTypes.free.name
                                ? const Color(0xff05473A)
                                : Colors.white,
                            colorType: snaphot.data?[index].listingType == ListingTypes.free.name
                                ? const Color(0xff6DCEBB)
                                : const Color(0xffFD8435),
                            adsType: snaphot.data?[index].listingType == ListingTypes.free.name
                                ? 'Ücretsiz Paylaşıyor'
                                : 'Takas Ediyor',
                            address:
                                '${snaphot.data?[index].ownerInfo.district} / ${snaphot.data?[index].ownerInfo.city}',
                            productName: '${snaphot.data?[index].title}}',
                            date: formatter.format(snaphot.data?[index].createdAt ?? DateTime.now()),
                            userName: '${snaphot.data?[index].ownerInfo.username}',
                            productImage: snaphot.data?[index].image1,
                            saveButtonOnTap: () async {
                              await GetIt.instance<ArchivedRepository>()
                                  .toggleArchiveStatus(feedId: snaphot.data![index].id);
                              await GetIt.instance<FeedRepository>().clearMostViewedFeeds();
                              setStateMostViewedState(() {});
                            },
                            seeAdsDetailOnTap: () {
                              context.pushRoute(AdsDetailRoute(id: snaphot.data![index].id));
                            },
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
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: AdsTitle(
                      title: 'Ücretsiz Paylaşılar',
                      onTap: () {
                        context.pushRoute(ShareAdsRoute(type: 'free'));
                      }),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 300.h,
                  child: FutureBuilder(
                    future: GetIt.instance<FeedRepository>().freeListingFeeds,
                    builder: (context, snaphot) {
                      if (snaphot.connectionState != ConnectionState.done) {
                        return customListViewShimmer(formatter);
                      }
                      return ListView.builder(
                        padding: EdgeInsets.only(right: 16.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: snaphot.data?.length,
                        itemBuilder: (context, index) {
                          return AdsCard(
                            isSaved: snaphot.data?[index].isArchived ?? false,
                            width: 265.w,
                            textColor: snaphot.data?[index].listingType == ListingTypes.free.name
                                ? const Color(0xff05473A)
                                : Colors.white,
                            colorType: snaphot.data?[index].listingType == ListingTypes.free.name
                                ? const Color(0xff6DCEBB)
                                : const Color(0xffFD8435),
                            adsType: snaphot.data?[index].listingType == ListingTypes.free.name
                                ? 'Ücretsiz Paylaşıyor'
                                : 'Takas Ediyor',
                            address:
                                '${snaphot.data?[index].ownerInfo.district} / ${snaphot.data?[index].ownerInfo.city}',
                            productName: '${snaphot.data?[index].title}}',
                            date: formatter.format(snaphot.data?[index].createdAt ?? DateTime.now()),
                            userName: '${snaphot.data?[index].ownerInfo.username}',
                            productImage: snaphot.data?[index].image1,
                            saveButtonOnTap: () async {
                              await GetIt.instance<ArchivedRepository>()
                                  .toggleArchiveStatus(feedId: snaphot.data![index].id);
                              await GetIt.instance<FeedRepository>().clearMostViewedFeeds();
                              setStateMostViewedState(() {});
                            },
                            seeAdsDetailOnTap: () {
                              context.pushRoute(AdsDetailRoute(id: snaphot.data![index].id));
                            },
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
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: AdsTitle(
                      title: 'Takas Ürünleri',
                      onTap: () {
                        context.pushRoute(ShareAdsRoute(type: 'tradable'));
                      }),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 300.h,
                  child: FutureBuilder(
                    future: GetIt.instance<FeedRepository>().tradableListingFeeds,
                    builder: (context, snaphot) {
                      if (snaphot.connectionState != ConnectionState.done) {
                        return customListViewShimmer(formatter);
                      }
                      return ListView.builder(
                        padding: EdgeInsets.only(right: 16.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: snaphot.data?.length,
                        itemBuilder: (context, index) {
                          return AdsCard(
                            isSaved: snaphot.data?[index].isArchived ?? false,
                            width: 265.w,
                            textColor: snaphot.data?[index].listingType == ListingTypes.free.name
                                ? const Color(0xff05473A)
                                : Colors.white,
                            colorType: snaphot.data?[index].listingType == ListingTypes.free.name
                                ? const Color(0xff6DCEBB)
                                : const Color(0xffFD8435),
                            adsType: snaphot.data?[index].listingType == ListingTypes.free.name
                                ? 'Ücretsiz Paylaşıyor'
                                : 'Takas Ediyor',
                            address:
                                '${snaphot.data?[index].ownerInfo.district} / ${snaphot.data?[index].ownerInfo.city}',
                            productName: '${snaphot.data?[index].title}}',
                            date: formatter.format(snaphot.data?[index].createdAt ?? DateTime.now()),
                            userName: '${snaphot.data?[index].ownerInfo.username}',
                            productImage: snaphot.data?[index].image1,
                            saveButtonOnTap: () async {
                              await GetIt.instance<ArchivedRepository>()
                                  .toggleArchiveStatus(feedId: snaphot.data![index].id);
                              await GetIt.instance<FeedRepository>().clearMostViewedFeeds();
                              setStateMostViewedState(() {});
                            },
                            seeAdsDetailOnTap: () {
                              context.pushRoute(AdsDetailRoute(id: snaphot.data![index].id));
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.bottom + kBottomNavigationBarHeight + 18 * 2,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  ListView customListViewShimmer(DateFormat formatter) {
    return ListView.builder(
      padding: EdgeInsets.only(right: 16.w),
      scrollDirection: Axis.horizontal,
      itemCount: 20,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: AdsCard(
            isSaved: false,
            width: 265.w,
            colorType: const Color(0xff6DCEBB),
            textColor: const Color(0xff05473A),
            adsType: 'Ücretsiz Paylaşıyor',
            address: '',
            productName: '',
            date: formatter.format(DateTime.now()),
            userName: '',
            productImage: null,
            saveButtonOnTap: () async {},
            seeAdsDetailOnTap: () {},
          ),
        );
      },
    );
  }
}
