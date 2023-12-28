import 'package:atma_paylas_app/common_widgets/share_ads_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class SwapProductsView extends ConsumerWidget {
  const SwapProductsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Takaslanacak Ürünlerim',
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
                type: 'Takaslıyor',
                textColor:  Colors.white,
                color: const Color(0xffFD8435),
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