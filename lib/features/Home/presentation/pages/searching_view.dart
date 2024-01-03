// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/common_widgets/ads_card.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/features/Category/models/main_category_model.dart';
import 'package:atma_paylas_app/features/Feed/models/feed_model.dart';
import 'package:atma_paylas_app/repositories/arhived_repository.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class SearchingView extends StatelessWidget {
  SearchingView({required this.query, super.key});
  final String query;
  final List<FeedModel> searchedList = [];
  final List<MainCategoryModel> searchedCategoryList = [];

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd/MM/yyyy');
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Arama Sonuçları:$query'),
      ),
      body: FutureBuilder(
        future: GetIt.instance<FeedRepository>().searchListings(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done || snapshot.data == null) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.data!.isLeft()) {
            return const Center(child: Text('Hata oluştu'));
          }
          Log.success(snapshot.data);

          return snapshot.data!.fold((l) => Text('Hata oluştu $l'), (r) {
            return SizedBox(
              child: Column(
                children: [
                  ...List.generate(r.item2.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 16.w, top: 16.h, right: 16.w),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: ListTile(
                          title: Text(
                            r.item2[index].name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Kategori',
                            style: TextStyle(
                              color: Color(
                                AppColors.primaryColor,
                              ),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                          ),
                        ),
                      ),
                    );
                  }),
                  ...List.generate(r.item1.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 16.w, top: 16.h),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: AdsCard(
                          adsType: r.item1[index].listingType == ListingTypes.free.name
                              ? 'Ücretsiz Paylaşıyor'
                              : 'Takaslıyor',
                          saveButtonOnTap: () async {
                            await GetIt.instance<ArchivedRepository>().toggleArchiveStatus(feedId: r.item1[index].id);
                          },
                          address: '${r.item1[index].ownerInfo.district} / ${r.item1[index].ownerInfo.city}',
                          date: formatter.format(r.item1[index].createdAt),
                          userName: r.item1[index].ownerInfo.username,
                          productImage: r.item1[index].image1,
                          productName: r.item1[index].title,
                          textColor: r.item1[index].listingType == ListingTypes.free.name
                              ? const Color(0xff05473A)
                              : Colors.white,
                          colorType: r.item1[index].listingType == ListingTypes.free.name
                              ? const Color(0xff6DCEBB)
                              : const Color(0xffFD8435),
                          isSaved: r.item1[index].isArchived,
                          width: 358.w,
                          seeAdsDetailOnTap: () {
                            context.pushRoute(UserAdsDetailRoute(id: r.item1[index].id));
                          },
                        ),
                      ),
                    );
                  }),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
