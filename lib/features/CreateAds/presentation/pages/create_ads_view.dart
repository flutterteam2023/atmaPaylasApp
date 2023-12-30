import 'package:atma_paylas_app/common_widgets/custom_border_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/features/CreateAds/presentation/pages/ads_info_add_view.dart';
import 'package:atma_paylas_app/repositories/category_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class CreateAdsView extends StatefulHookConsumerWidget {
  const CreateAdsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateAdsViewState();
}
class _CreateAdsViewState extends ConsumerState<CreateAdsView> {
  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final maincategoryid = useState<int?>(null);

    
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
      body:PageView.builder(
        controller: pageController,
        itemCount:GetIt.instance<CategoryRepository>().pageviewLength ,
        onPageChanged: (value) {
          print(value);
        },

        itemBuilder: (context,index){

          if (GetIt.instance<CategoryRepository>().pageviewLength!=1) {
            if(index == 0){
            return productCategorySelect(pageController,);
          }
          else if(index !=0 && index !=GetIt.instance<CategoryRepository>().pageviewLength -1 ){
            return productSubCategorySelect( pageController, GetIt.instance<CategoryRepository>().categoryid!,GetIt.instance<CategoryRepository>().categoryname! ,);
          }else if(index ==GetIt.instance<CategoryRepository>().pageviewLength -1){
            return AdsInfoAddView(GetIt.instance<CategoryRepository>().categoryid.toString());
          }
            
          }else{
            return AdsInfoAddView(GetIt.instance<CategoryRepository>().categoryid.toString());
          }
        },
      )
    );
  }
  ListView productCategorySelect(PageController? pageController) {
    return ListView(
    children: [
      Padding(
        padding:  EdgeInsets.only(top: 16.h,left: 16.w,right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ürün kategorisini seçiniz',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Rubik',
              color: Colors.black,
            ),
      
            
            ),
            SizedBox(height: 32.h,),
            FutureBuilder(
              future:GetIt.instance<CategoryRepository>().getMainCategories(),
              builder: (context,snapshot) {
               if (snapshot.data == null) {
                  return const CircularProgressIndicator.adaptive();
                }
                return snapshot.data!.fold(
                  (l) => const SizedBox(), 
                  (r) {
                    
                  return  SizedBox(
                  height: 1000,
                  child: GridView.builder(
                    itemCount: r.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 24.w,mainAxisSpacing: 24.h,childAspectRatio: 3),
                    itemBuilder: (context, index) {
                     
                      return SizedBox(
                        width: 167.w,
                        height: 48.h,
                        child: CustomBorderButton(onTap: (){
                          setState(() {
                        if (r[index].hasSubcategories == true) {
                            GetIt.instance<CategoryRepository>().pageviewLength =  GetIt.instance<CategoryRepository>().pageviewLength+1;


                        
                      }else{
                        GetIt.instance<CategoryRepository>().pageviewLength =  2;}
                     });
                             pageController!.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                          GetIt.instance<CategoryRepository>().categoryid = r[index].id;
                          GetIt.instance<CategoryRepository>().categoryname = r[index].name;
                            
                          
                         
                         
                        }, text: r[index].name),);
                    },
                  ),
                );
                  }  
                  );
                
               
              },
            )
          ],
        ),
      ),
    ],
  );
  }
 
  ListView productSubCategorySelect(PageController? pageController,int maincategoryid,String? maincategoryname) {
    return ListView(
    children: [
      Padding(
        padding:  EdgeInsets.only(top: 16.h,left: 16.w,right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${maincategoryname}',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Rubik',
              color: Colors.black,
            ),
      
            
            ),
            SizedBox(height: 32.h,),
            FutureBuilder(
              future:GetIt.instance<CategoryRepository>().getSubcategory(maincategoryid.toString()),
              builder: (context,snapshot) {
               if (snapshot.data == null) {
                  return const CircularProgressIndicator.adaptive();
                }
                return snapshot.data!.fold(
                  (l) {
                    return const SizedBox();

                  }, 
                  (r) =>  SizedBox(
                  height: 1000,
                  child: GridView.builder(
                    itemCount: r.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 24.w,mainAxisSpacing: 24.h,childAspectRatio: 3),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 167.w,
                        height: 48.h,
                        child: CustomBorderButton(onTap: (){
                          if (r[index].hasSubcategories == true) {
                            GetIt.instance<CategoryRepository>().pageviewLength =  GetIt.instance<CategoryRepository>().pageviewLength+1;


                        
                      }else{
                        GetIt.instance<CategoryRepository>().pageviewLength =  1;}
                          GetIt.instance<CategoryRepository>().categoryid = r[index].id;
                          GetIt.instance<CategoryRepository>().categoryname = maincategoryname! + ' / ' + r[index].name;
                          pageController!.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);

                         
                        }, text: r[index].name),);
                    },
                  ),
                ));
                
               
              },
            )
          ],
        ),
      ),
    ],
  );
  }
}



