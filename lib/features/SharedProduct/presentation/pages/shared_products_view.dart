import 'package:atma_paylas_app/common_widgets/share_ads_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class SharedProductsView extends ConsumerWidget {
  const SharedProductsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Paylaşılacak Ürünlerim',
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontFamily: 'Rubik'
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
                type: 'Ücretsiz',
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