// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/common_widgets/share_ads_card.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:atma_paylas_app/repositories/publish_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class PublishToConfirmListingsView extends StatefulWidget {
  const PublishToConfirmListingsView({super.key});

  @override
  State<PublishToConfirmListingsView> createState() => _PublishToConfirmListingsViewState();
}

class _PublishToConfirmListingsViewState extends State<PublishToConfirmListingsView> {
  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd/MM/yyyy');
    return FutureBuilder(
      future: Future.wait([
       PublishRepository().fetchAdminApprovalPending(),
   
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: false,
                title: Text(
                  'Onay Bekleyen İlanlarım',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: Colors.black,
                  ),
                ),
                bottom: const TabBar(
                  tabs: [
                    Tab(
                      text: 'Onay Bekleyen',
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 16.w,
                      left: 16.w,
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: ShareAdsCard(
                            isShimmer: true,
                            type: 'Ücretsiz',
                            textColor: const Color(0xff05473A),
                            color: const Color(0xff6DCEBB),
                            onTap: () {},
                            image: null,
                            title: 'Casio Saat',
                            address: 'İstanbul / Kadıköy',
                            date: '21/10/2023',
                            userName: 'user123456',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        final  publisAds = snapshot.data!.first;

        return ListenableBuilder(
          listenable: GetIt.instance<FeedRepository>(),
          builder: (context, widget) {
            return DefaultTabController(
              length: 1,
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: false,
                  title: Text(
                    'Yayınlanmayı Bekleyen İlanlar',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Rubik',
                      color: Colors.black,
                    ),
                  ),
                  bottom: const TabBar(
                    tabs: [
                      Tab(text: 'Onay Bekleyen'),
                    ],
                  ),
                ),
                body: publisAds.fold((l) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.feed,
                          size: 100,
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
                }, (r) {
                  return TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 16.w,
                        left: 16.w,
                      ),
                      child: snapshot.data?.isEmpty ?? true
                          ? Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.feed,
                                    size: 100,
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
                            )
                          : ListView.builder(
                              itemCount:r.length,
                              itemBuilder: (context, index) {
                                return ShareAdsCard(
                                  isShimmer: false,
                                  type: r[index].listingType == ListingTypes.free.name
                                      ? 'Ücretsiz'
                                      : 'Takas',
                                  textColor: r[index].listingType == ListingTypes.free.name
                                      ? const Color(0xff05473A)
                                      : Colors.white,
                                  color: r[index].listingType == ListingTypes.free.name
                                      ? const Color(0xff6DCEBB)
                                      : const Color(0xffFD8435),
                                  onTap: () {
                                    if (GetIt.instance<UserRepository>().user?.userId ==
                                       r[index].ownerInfo.userId) {
                                      context.pushRoute(UserAdsDetailRoute(id: r[index].id));
                                    } else {
                                      context.pushRoute(AdsDetailRoute(id: r[index].id));
                                    }
                                  },
                                  image: r[index].image1,
                                  title: r[index].title ?? 'impossible',
                                  address:
                                      '${r[index].ownerInfo.district} / ${r[index].ownerInfo.city}',
                                  date: formatter.format(r[index].createdAt),
                                  userName: r[index].ownerInfo.username ?? 'impossible',
                                );
                              },
                            ),
                    ),
                  ],
                );
                })
              ),
            );
          },
        );
      },
    );
  }
}
