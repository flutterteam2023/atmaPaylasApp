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

@RoutePage()
class CategoryListingView extends StatelessWidget {
  const CategoryListingView({required this.categoryId, super.key, this.categoryName});
  final String? categoryName;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd/MM/yyyy');

    return Scaffold(
      appBar: AppBar(
        title: categoryName != null ? Text(categoryName!) : const Text('Kategoriler'),
      ),
      body: FutureBuilder(
        future: GetIt.instance<FeedRepository>().getFeedByCategories(categoryId),
        builder: (context, snapshot) {
          return snapshot.data?.fold(
                Text.new,
                (r) => r.isEmpty
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
                        itemCount: r.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 16.w, top: 16.h),
                            child: AdsCard(
                              adsType:
                                  r[index].listingType == ListingTypes.free.name ? 'Ücretsiz Paylaşıyor' : 'Takaslıyor',
                              id: r[index].id!,
                              address: '${r[index].ownerInfo.district} / ${r[index].ownerInfo.city}',
                              date: formatter.format(r[index].createdAt!),
                              userName: r[index].ownerInfo.username!,
                              productImage: r[index].image1,
                              productName: r[index].title!,
                              textColor: r[index].listingType == ListingTypes.free.name
                                  ? const Color(0xff05473A)
                                  : Colors.white,
                              colorType: r[index].listingType == ListingTypes.free.name
                                  ? const Color(0xff6DCEBB)
                                  : const Color(0xffFD8435),
                              isSaved: r[index].isArchived!,
                              width: 358.w,
                              seeAdsDetailOnTap: () {
                                context.pushRoute(AdsDetailRoute(id: r[index].id!));
                              },
                            ),
                          );
                        },
                      ),
              ) ??
              const CircularProgressIndicator.adaptive();
        },
      ),
    );
  }
}
