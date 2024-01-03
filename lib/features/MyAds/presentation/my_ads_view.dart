// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/common_widgets/ads_card.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/arhived_repository.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MyAdsView extends ConsumerWidget {
  const MyAdsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatter = DateFormat('dd/MM/yyyy');
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: ListenableBuilder(
        listenable: GetIt.instance<FeedRepository>(),
        builder: (context, widget) {
          return Column(
            children: [
              DefaultTabController(
                length: 2, // length of tabs
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
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
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 24.h,
                                bottom: MediaQuery.of(context).viewPadding.bottom + kBottomNavigationBarHeight + 18 * 2,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FutureBuilder(
                                    future: GetIt.instance<FeedRepository>().myActiveFreeFeeds,
                                    builder: (context, snapshot) {
                                      return Column(
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
                                                if (snapshot.data?.isNotEmpty ?? false)
                                                  InkWell(
                                                    onTap: () {
                                                      context.pushRoute(const SharedProductsRoute());
                                                    },
                                                    child: Text(
                                                      'Hepsini Gör',
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontFamily: 'Rubik',
                                                        fontWeight: FontWeight.w500,
                                                        color: const Color(AppColors.primaryColor),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16.h,
                                          ),
                                          if (snapshot.data?.isEmpty ?? true)
                                            SizedBox(
                                              height: 350.h,
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.swap_horiz_outlined,
                                                      size: 64.w,
                                                      color: const Color(
                                                        AppColors.primaryColor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(18),
                                                      child: Text(
                                                        'Hiç paylaşılacak ilanınız bulunmamaktadır.',
                                                        textAlign: TextAlign.center,
                                                        style: Theme.of(context).textTheme.titleMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          if (snapshot.data?.isNotEmpty ?? false)
                                            SizedBox(
                                              height: 350.h,
                                              child: ListView.builder(
                                                itemCount: snapshot.data?.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return AdsCard(
                                                    width: 265.w,
                                                    isSaved: snapshot.data?[index].isArchived ?? false,
                                                    adsType: 'Ücretsiz Paylaşıyor',
                                                    address:
                                                        '${snapshot.data?[index].ownerInfo.district} / ${snapshot.data?[index].ownerInfo.city}',
                                                    date: formatter
                                                        .format(snapshot.data?[index].createdAt ?? DateTime(2022)),
                                                    userName: '${snapshot.data?[index].ownerInfo.username}',
                                                    productImage: snapshot.data?[index].image1,
                                                    productName: '${snapshot.data?[index].title}',
                                                    colorType: const Color(0xff6DCEBB),
                                                    textColor: const Color(0xff05473A),
                                                    seeAdsDetailOnTap: () {
                                                      context
                                                          .pushRoute(UserAdsDetailRoute(id: snapshot.data?[index].id));
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                        ],
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                  FutureBuilder(
                                    future: GetIt.instance<FeedRepository>().myActiveTradableFeeds,
                                    builder: (context, snapshot) {
                                      return Column(
                                        children: [
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
                                                if (snapshot.data?.isNotEmpty ?? false)
                                                  InkWell(
                                                    onTap: () {
                                                      context.pushRoute(const SwapProductsRoute());
                                                    },
                                                    child: Text(
                                                      'Hepsini Gör',
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontFamily: 'Rubik',
                                                        fontWeight: FontWeight.w500,
                                                        color: const Color(AppColors.primaryColor),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 16.h,
                                          ),
                                          if (snapshot.data?.isEmpty ?? true)
                                            SizedBox(
                                              height: 350.h,
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.swap_horiz_outlined,
                                                      size: 64.w,
                                                      color: const Color(
                                                        AppColors.primaryColor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(18),
                                                      child: Text(
                                                        'Hiç takaslanacak ilanınız bulunmamaktadır.',
                                                        textAlign: TextAlign.center,
                                                        style: Theme.of(context).textTheme.titleMedium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          if (snapshot.data?.isNotEmpty ?? false)
                                            SizedBox(
                                              height: 350.h,
                                              child: ListView.builder(
                                                itemCount: snapshot.data?.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return AdsCard(
                                                    width: 265.w,
                                                    adsType: 'Takaslıyor',
                                                    address:
                                                        '${snapshot.data?[index].ownerInfo.district} / ${snapshot.data?[index].ownerInfo.city}',
                                                    date: formatter
                                                        .format(snapshot.data?[index].createdAt ?? DateTime(2022)),
                                                    userName: '${snapshot.data?[index].ownerInfo.username}}',
                                                    productImage: snapshot.data?[index].image1,
                                                    productName: '${snapshot.data?[index].title}',
                                                    colorType: const Color(0xffFD8435),
                                                    textColor: Colors.white,
                                                    isSaved: snapshot.data?[index].isArchived ?? false,
                                                    seeAdsDetailOnTap: () {
                                                      context
                                                          .pushRoute(UserAdsDetailRoute(id: snapshot.data?[index].id));
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ListenableBuilder(
                            listenable: GetIt.instance<ArchivedRepository>(),
                            builder: (context, widget) {
                              return FutureBuilder(
                                future: GetIt.instance<ArchivedRepository>().getArchivedFeeds(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState != ConnectionState.done) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  if (GetIt.instance<ArchivedRepository>().archivedList.isEmpty) {
                                    return Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.archive_outlined,
                                            size: 64.w,
                                            color: const Color(
                                              AppColors.primaryColor,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(18),
                                            child: Text(
                                              'Hiç arşivlenmiş ilanınız bulunmamaktadır.',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context).textTheme.titleMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }

                                  return ListView.builder(
                                    itemCount: GetIt.instance<ArchivedRepository>().archivedList.length,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) {
                                      final item = GetIt.instance<ArchivedRepository>().archivedList[index];
                                      return Padding(
                                        padding: EdgeInsets.only(right: 16.w, top: 16.h),
                                        child: AdsCard(
                                          adsType: item.listingType == ListingTypes.free.name
                                              ? 'Ücretsiz Paylaşıyor'
                                              : 'Takaslıyor',
                                          saveButtonOnTap: () async {
                                            if (item.isArchived) {
                                              GetIt.instance<ArchivedRepository>().removeArchivedList(item);
                                              await GetIt.instance<ArchivedRepository>()
                                                  .toggleArchiveStatus(feedId: item.id);
                                            } else {
                                              GetIt.instance<ArchivedRepository>().addArchivedList(item);
                                              await GetIt.instance<ArchivedRepository>()
                                                  .toggleArchiveStatus(feedId: item.id);
                                            }
                                          },
                                          address: '${item.ownerInfo.district} / ${item.ownerInfo.city}',
                                          date: formatter.format(item.createdAt),
                                          userName: item.ownerInfo.username,
                                          productImage: item.image1,
                                          productName: item.title,
                                          textColor: item.listingType == ListingTypes.free.name
                                              ? const Color(0xff05473A)
                                              : Colors.white,
                                          colorType: item.listingType == ListingTypes.free.name
                                              ? const Color(0xff6DCEBB)
                                              : const Color(0xffFD8435),
                                          isSaved: item.isArchived,
                                          width: 358.w,
                                          seeAdsDetailOnTap: () {
                                            context.pushRoute(UserAdsDetailRoute(id: item.id));
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
