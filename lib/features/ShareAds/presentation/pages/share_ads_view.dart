import 'package:atma_paylas_app/common_widgets/share_ads_card.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ShareAdsView extends ConsumerWidget {
  const ShareAdsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'En Çok Ziyaret Edilenler',
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
            itemCount: 2,
            itemBuilder: (context, index) {
              return ShareAdsCard(
                textColor: const Color(0xff05473A),
                color: const Color(0xff6DCEBB),
                onTap: () {
                  
                },
              image: 'assets/images/bicycle.png',
              title: 'Casio Saat',
              address: 'İstanbul / Kadıköy',
              date: '21/10/2023',
              userName: 'user123456',
              );
            },
          )),
    );
  }
}

