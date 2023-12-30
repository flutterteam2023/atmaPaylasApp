import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/feedback_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class GiveFeedBackView extends HookConsumerWidget {
  const GiveFeedBackView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Geri Bildirim Ver',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontFamily: 'Rubik'
        ),
        ),
      
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bizimle geri bildirimlerini paylaşabilirsin',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xff858585),
              fontFamily: 'Rubik'
            ),
            ),
            SizedBox(height: 48.h,),
            Text('Notunuz',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(AppColors.primaryTextColor),
              fontFamily: 'Rubik'
            ),
            ),
            SizedBox(height: 16.h,),
            TextField(
              controller: noteController,
              cursorColor: const Color(AppColors.primaryColor),
              maxLines: 5,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: const Color(AppColors.primaryTextColor),
                fontFamily: 'Rubik'
              ),
              decoration: InputDecoration(
                hintText: 'Notunuzu buraya yazınız',
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff858585),
                  fontFamily: 'Rubik'
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide(
                    color: const Color(0xff858585),
                    width: 1.w
                  )
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide(
                    color: const Color(0xff858585),
                    width: 1.w
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 121, 119, 119),
                    width: 1.w
                  )
                ),
              ),
            ),
            
            SizedBox(height: 56.h,),  
            CustomFilledButton(text: 'Geri Bildirim Gönder', onTap: (){
              GetIt.instance<FeedbackRepository>().sendFeedBack(noteController.value.text);
              context.pushRoute(FeedBackApprovalRoute());

            })
            
            
          ],
        ),
      ),

    );
  }
}