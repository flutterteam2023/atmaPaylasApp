// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/features/Messages/models/listing_model.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class FeedInfoChatRoomWidget extends StatelessWidget {
  const FeedInfoChatRoomWidget({super.key, this.listingModel});
  final ListingModel? listingModel;

  @override
  Widget build(BuildContext context) {
    if (listingModel == null) {
      return const SizedBox.shrink();
    }
    return InkWell(
      onTap: () {
        context.pushRoute(AdsDetailRoute(id: listingModel!.id));
      },
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Color(AppColors.primaryLightColor),
        ),
        child: ListTile(
          title: Text(
            listingModel?.title ?? 'null',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4.5, horizontal: 9),
                decoration: BoxDecoration(
                  color: listingModel?.listingType == ListingTypes.free.name
                      ? const Color(0xff6DCEBB)
                      : const Color(0xffFD8435),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Text(
                  listingModel?.listingType == ListingTypes.free.name ? 'Ücretsiz Paylaşılıyor' : 'Takaslanıyor',
                  style: TextStyle(
                    color: listingModel?.listingType == ListingTypes.free.name ? const Color(0xff05473A) : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          leading: CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(
              listingModel?.image1Url ?? 'null',
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
