import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class AdsDetailView extends ConsumerWidget {
  final int id;
  const AdsDetailView(this.id, {super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'İlan Detayı',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Rubik',
            color: const Color(0xff000000),
          ),
        ),
        centerTitle: false,
        actions: [
          Bounceable(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/svg/bookmark-outline.svg',
                height: 24.r,
                width: 24.r,
              )),
          SizedBox(
            width: 16.w,
          ),
          Image.asset('assets/images/line.png'),
          SizedBox(
            width: 16.w,
          ),
          Bounceable(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/svg/share-social-outline.svg',
                height: 24.r,
                width: 24.r,
              )),
          SizedBox(
            width: 16.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: GetIt.instance<FeedRepository>().getFeedDetails(id.toString()),
          builder: (context,snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Bir hata oluştu'),);
              
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
              
            }

            if (snapshot.hasData) {
            return  snapshot.data!.fold((l) => SizedBox(), 
              (r) {
                return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 200.h,
                            width: 358.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                image:  DecorationImage(
                                    image: NetworkImage(r.image1!), fit: BoxFit.cover)),
                          ),
                          Positioned(
                            top: 16.h,
                            left: 16.w,
                            child: Bounceable(
                              onTap: () {},
                              child: Container(
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(10.r), color: const Color(0xff6DCEBB)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                                  child: Text(
                                    'Ücretsiz Paylaşıyor',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Rubik',
                                      color: const Color(0xff05473A),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r.title,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Rubik',
                              color: const Color(0xff000000),
                            ),
                          ),
                          Text(
                            '21/10/2023',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Rubik',
                              color: const Color(0xff858585),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text('Kadıköy / İstanbul',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Rubik',
                            color: const Color(AppColors.primaryColor),
                          )),
                      SizedBox(height: 24.h),
                      Text('Ürün Açıklaması',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Rubik',
                        color: const Color(0xff000000),
                    
                      
                      ),
                      ),
                      SizedBox(height: 8.h,),
                      SizedBox(
                        width: 358.w,
                        child: Text(r.description,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Rubik',
                          color: const Color(AppColors.primaryTextColor),
                        ),
                        
                        ),
                      ),
                      SizedBox(height: 16.h,),
      
                    ],
                  ),
                ),
                SizedBox(
                  height: 90.h,
                  child: ListView(
                    padding: EdgeInsets.only(left: 8.w,right: 16.w),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                       Padding(
                        padding:   EdgeInsets.only(left: 8.w),
                        child: Container(
                          width: 113.w,
                          height: 90.h,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              image: NetworkImage(r.image1!??''),
                              fit: BoxFit.cover,
                            ),
                          ),
                                
                        ),
                      ),
                    r.image2!=null?   Padding(
                        padding:   EdgeInsets.only(left: 8.w),
                        child: Container(
                          width: 113.w,
                          height: 90.h,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              image: NetworkImage(r.image2!),
                              fit: BoxFit.cover,
                            ),
                          ),
                                
                        ),
                      ):SizedBox.shrink(),
                    r.image3!=null?   Padding(
                        padding:   EdgeInsets.only(left: 8.w),
                        child: Container(
                          width: 113.w,
                          height: 90.h,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              image: NetworkImage(r.image3!),
                              fit: BoxFit.cover,
                            ),
                          ),
                                
                        ),
                      ):SizedBox.shrink()
                    ],
                  ),
                ),
                SizedBox(height: 24.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ürün Sahibi',
                      
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Rubik',
                        color: const Color(0xff000000),
                      ),
                      
                      ),
                      SizedBox(height: 15.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 48.r,
                                width: 48.r,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/images/persondemo.png'),fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                  
                                ),
                              ),
                              SizedBox(width: 8.w,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Adalet Saçar',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Rubik',
                                    color: const Color(0xff000000),
                                  ),
                                  
                                  
                                  ),
                                  Text('user123456',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Rubik',
                                    color: const Color(AppColors.primaryTextColor),
                                  ),
                                  
                                  
                                  
                                  
                                  ),
      
                                ],
                              )
                            ],
                          ),
                          Text('Kadıköy / İstanbul',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Rubik',
                            color: const Color(AppColors.primaryColor),
                          ),
                          
                          
                          )
                        ],
                      ),
                      SizedBox(height: 54.h,),
                      CustomFilledButton(text: 'Mesaj Gönder', onTap: (){},iconPath: 'mail-outline.svg',),
                      SizedBox(height: 40.h,)
                      
                    ],
                    
                  ),
                )
              ],
            );
              }
              );
            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}
