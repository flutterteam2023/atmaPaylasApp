// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/common_widgets/ads_card.dart';
import 'package:atma_paylas_app/common_widgets/ads_title.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/category_repository.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class HomeView extends StatefulHookWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final searchingController = useTextEditingController();
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
          if (false)
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
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: const Color(0xffF5F5F5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w, right: 16.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: searchingController,
                              decoration: InputDecoration(
                                hintText: 'Ara',
                                fillColor: Colors.transparent,
                                filled: true,
                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Rubik',
                                  color: const Color(0xffBDBDBD),
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              context.pushRoute(SearchingRoute(query: searchingController.text));
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/search-primary.svg',
                                  height: 32,
                                  width: 32,
                                ),
                                const Text(
                                  'Ara',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(
                                      AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                  child: SizedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 18.w),
                          child: Bounceable(
                            onTap: () {
                              context.pushRoute(
                                CategoryListingRoute(
                                  categoryId: 'all',
                                  categoryName: 'Tümü',
                                ),
                              );
                            },
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
                                    'Tümü',
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
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder(
                            future: GetIt.instance<CategoryRepository>().getMainCategories(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.only(right: 16),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 20,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(left: 8.w),
                                        child: Bounceable(
                                          onTap: () {},
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
                                                  "r[index]",
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
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }
                              return snapshot.data!.fold(
                                (l) => const SizedBox(),
                                (r) => ListView.builder(
                                  padding: const EdgeInsets.only(right: 16),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: r.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(left: 8.w),
                                      child: Bounceable(
                                        onTap: () {
                                          context.pushRoute(
                                            CategoryListingRoute(
                                              categoryId: r[index].id.toString(),
                                              categoryName: r[index].name,
                                            ),
                                          );
                                        },
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
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
                              id: 1,
                              seeAdsDetailOnTap: () {
                                if (GetIt.instance<UserRepository>().user?.userId ==
                                    snaphot.data?[index].ownerInfo.userId) {
                                  context.pushRoute(UserAdsDetailRoute(id: snaphot.data![index].id));
                                } else {
                                  context.pushRoute(AdsDetailRoute(id: snaphot.data![index].id!));
                                }
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
                  height: 350.h,
                  child: ListenableBuilder(
                    listenable: GetIt.instance<FeedRepository>(),
                    builder: (context, widget) {
                      return FutureBuilder(
                        future: GetIt.instance<FeedRepository>().mostViewedFeeds,
                        builder: (context, snaphot) {
                          if (snaphot.connectionState != ConnectionState.done) {
                            return customListViewShimmer(formatter);
                          }
                          if (snaphot.data?.isEmpty ?? true) {
                            return Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.feed,
                                    size: 64,
                                    color: Color(AppColors.primaryColor),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: Text(
                                      'Hiç ilan bulunamadı.',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return ListView.builder(
                            padding: EdgeInsets.only(right: 16.w),
                            scrollDirection: Axis.horizontal,
                            itemCount: snaphot.data?.length,
                            itemBuilder: (context, index) {
                              return AdsCard(
                                id: snaphot.data?[index].id ?? 0,
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
                                productName: '${snaphot.data?[index].title}',
                                date: formatter.format(snaphot.data?[index].createdAt ?? DateTime.now()),
                                userName: '${snaphot.data?[index].ownerInfo.username}',
                                productImage: snaphot.data?[index].image1,
                                seeAdsDetailOnTap: () {
                                  if (GetIt.instance<UserRepository>().user?.userId ==
                                      snaphot.data?[index].ownerInfo.userId) {
                                    context.pushRoute(UserAdsDetailRoute(id: snaphot.data![index].id));
                                  } else {
                                    context.pushRoute(AdsDetailRoute(id: snaphot.data![index].id!));
                                  }
                                },
                              );
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
                    },
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 350.h,
                  child: ListenableBuilder(
                    listenable: GetIt.instance<FeedRepository>(),
                    builder: (context, widget) {
                      return FutureBuilder(
                        future: GetIt.instance<FeedRepository>().freeListingFeeds,
                        builder: (context, snaphot) {
                          if (snaphot.connectionState != ConnectionState.done) {
                            return customListViewShimmer(formatter);
                          }
                          if (snaphot.data?.isEmpty ?? true) {
                            return Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.feed,
                                    size: 64,
                                    color: Color(AppColors.primaryColor),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: Text(
                                      'Hiç ilan bulunamadı.',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ),
                                ],
                              ),
                            );
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
                                productName: '${snaphot.data?[index].title}',
                                date: formatter.format(snaphot.data?[index].createdAt ?? DateTime.now()),
                                userName: '${snaphot.data?[index].ownerInfo.username}',
                                productImage: snaphot.data?[index].image1,
                                id: snaphot.data?[index].id ?? 0,
                                seeAdsDetailOnTap: () {
                                  if (GetIt.instance<UserRepository>().user?.userId ==
                                      snaphot.data?[index].ownerInfo.userId) {
                                    context.pushRoute(UserAdsDetailRoute(id: snaphot.data![index].id));
                                  } else {
                                    context.pushRoute(AdsDetailRoute(id: snaphot.data![index].id!));
                                  }
                                },
                              );
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
                    },
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 359.h,
                  child: ListenableBuilder(
                    listenable: GetIt.instance<FeedRepository>(),
                    builder: (context, widget) {
                      return FutureBuilder(
                        future: GetIt.instance<FeedRepository>().tradableListingFeeds,
                        builder: (context, snaphot) {
                          if (snaphot.connectionState != ConnectionState.done) {
                            return customListViewShimmer(formatter);
                          }
                          if (snaphot.data?.isEmpty ?? true) {
                            return Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.feed,
                                    size: 64,
                                    color: Color(AppColors.primaryColor),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: Text(
                                      'Hiç ilan bulunamadı.',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ),
                                ],
                              ),
                            );
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
                                productName: '${snaphot.data?[index].title}',
                                date: formatter.format(snaphot.data?[index].createdAt ?? DateTime.now()),
                                userName: '${snaphot.data?[index].ownerInfo.username}',
                                productImage: snaphot.data?[index].image1,
                                id: snaphot.data?[index].id ?? 0,
                                seeAdsDetailOnTap: () {
                                  if (GetIt.instance<UserRepository>().user?.userId ==
                                      snaphot.data?[index].ownerInfo.userId) {
                                    context.pushRoute(UserAdsDetailRoute(id: snaphot.data![index].id));
                                  } else {
                                    context.pushRoute(AdsDetailRoute(id: snaphot.data![index].id!));
                                  }
                                },
                              );
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
            id: 1,
            seeAdsDetailOnTap: () {},
          ),
        );
      },
    );
  }
}
