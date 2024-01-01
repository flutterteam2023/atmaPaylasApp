// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/common_widgets/share_ads_card.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class SharingProductsView extends ConsumerWidget {
  const SharingProductsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formatter = DateFormat('dd/MM/yyyy');
    return FutureBuilder(
      future: GetIt.instance<FeedRepository>().myActiveFreeFeeds,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text(
                'Paylaşılacak Ürünlerim',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Rubik',
                  color: Colors.black,
                ),
              ),
            ),
            body: Padding(
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
          );
        }

        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              'Paylaşılacak Ürünlerim',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Rubik',
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
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
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return ShareAdsCard(
                        isShimmer: false,
                        type: snapshot.data![index].listingType == ListingTypes.free.name ? 'Ücretsiz' : 'Takas',
                        textColor: snapshot.data![index].listingType == ListingTypes.free.name
                            ? const Color(0xff05473A)
                            : Colors.white,
                        color: snapshot.data![index].listingType == ListingTypes.free.name
                            ? const Color(0xff6DCEBB)
                            : const Color(0xffFD8435),
                        onTap: () {},
                        image: snapshot.data![index].image1,
                        title: snapshot.data![index].title,
                        address:
                            '${snapshot.data![index].ownerInfo.district} / ${snapshot.data![index].ownerInfo.city}',
                        date: formatter.format(snapshot.data![index].createdAt),
                        userName: snapshot.data![index].ownerInfo.username,
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
