import 'package:atma_paylas_app/common_widgets/custom_border_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/features/CreateAds/data/dummy_list.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class CreateAdsView extends ConsumerWidget {
  
  const CreateAdsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DummyList dummyList=DummyList();
    
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
      body: ProductCategorySelect(title: 'Ürün kategorisini seçiniz', categoryList: DummyList().categories)
    );
  }
  
}

class ProductCategorySelect extends StatelessWidget {
  const ProductCategorySelect( {
    super.key, required this.title, required this.categoryList,
  });
  final String title;
  final List<String> categoryList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 16.h,left: 16.w,right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Rubik',
                color: Colors.black,
              ),
        
              
              ),
              SizedBox(height: 32.h,),
              SizedBox(
                height: 1000,
                child: GridView.builder(
                  itemCount: categoryList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 24.w,mainAxisSpacing: 24.h,childAspectRatio: 3),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 167.w,
                      height: 48.h,
                      child: CustomBorderButton(onTap: (){
                        if (categoryList.isNotEmpty) {
                          if (title!='Ürün kategorisini seçiniz') {
                        context.pushRoute(TransitionCategoryRoute(title: '$title/${categoryList[index]}'));
                            
                          }else{
                        context.pushRoute(TransitionCategoryRoute(title: categoryList[index]));

                          }
                          
                        }else{
                          context.pushRoute(const AdsInfoAddRoute());
                        }
                      }, text: categoryList[index]));
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
