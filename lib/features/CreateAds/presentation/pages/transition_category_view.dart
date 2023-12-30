import 'package:atma_paylas_app/common_widgets/custom_border_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/features/CreateAds/data/dummy_list.dart';
import 'package:atma_paylas_app/features/CreateAds/presentation/pages/create_ads_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class TransitionCategoryView extends ConsumerWidget {
  final String title;

  
  const TransitionCategoryView(this.title, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          Bounceable(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Text(
                'Vazgeç',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Rubik',
                  color: const Color(AppColors.primaryColor),
                ),
              ),
            ),
          )
        ],
        title: Text(
          'İlan Oluştur',
          style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w500, fontFamily: 'Rubik', color: Colors.black),
        ),
      ),
      body: SizedBox()
    );
  }
  
}