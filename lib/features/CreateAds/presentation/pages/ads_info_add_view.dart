import 'package:atma_paylas_app/common_widgets/auth_textfield.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class AdsInfoAddView extends HookConsumerWidget {
  const AdsInfoAddView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          Padding(
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
          )
        ],
        title: Text(
          'İlan Oluştur',
          style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w500, fontFamily: 'Rubik', color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 24.h, left: 16.w,bottom: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kadın / Aksesuar / Saat',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Rubik',
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding:  EdgeInsets.only(right: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.white,
                          border: Border.all(color: const Color(AppColors.primaryColor))),
                      child: Padding(
                        padding:  EdgeInsets.only(right: 8.w, left: 8.w, top: 10.h, bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8.r,
                              width: 8.r,
                              child: Radio(
                                value: 0,
                                groupValue: 1,
                                onChanged: (value) {},
                                activeColor: const Color(AppColors.primaryColor),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            
                            Text('Paylaşmak istiyorum',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Rubik',
                              color: const Color(AppColors.primaryColor),
                            ),
                          
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Colors.white,
                          border: Border.all(color: const Color(AppColors.primaryColor))),
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.w, left: 8.w, top: 10.h, bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8.r,
                              width: 8.r,
                              child: Radio(
                                value: 1,
                                groupValue: 1,
                                onChanged: (value) {},
                                activeColor: const Color(AppColors.primaryColor),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text('Takaslamak istiyorum',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Rubik',
                              color: const Color(AppColors.primaryColor),
                            ),
                          
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'İlan Fotoğrafları',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Rubik',
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              SizedBox(
                height: 90.h,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Bounceable(
                      onTap: () {
                        
                      },
                      child: Container(
                        width: 105.w,
                        height: 90.h,
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          border: Border.all(color:  const Color(0xffC2C2C2)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/svg/imageico.svg'),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text('Ekle',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Rubik',
                              color: const Color(AppColors.primaryTextColor),
                            ),
                          
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90.h,
                      width: 300,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 14.w,right: 7.w),
                            child: Stack(
                              children: [
                                Container(
                                  width: 105.w,
                                  height: 90.h,
                                  decoration:  BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                                    border: Border.all(color:  const Color(0xffC2C2C2)),
                                    image: const DecorationImage(image: AssetImage('assets/images/clockdemo.png'),fit: BoxFit.fill)
                                  ),
                                  
                                ),
                                Positioned(
                                  bottom: 8.h,
                                  right: 8.w,
                                  child: Bounceable(
                                    onTap: () {
                                      
                                    },
                                    child: Container(
                                      height: 32.r,
                                      width: 32.r,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset('assets/svg/trash-outline.svg'),
                                      )
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'İlan Detayları',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Rubik',
                  color: Colors.black,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(right: 16.w,top: 16.h),
                child:  Column(
                  children: [
                    const AuthTextfield(text: 'İlan Başlığı', textInputType: TextInputType.multiline, hintText: 'Casio Saat'),
                    SizedBox(
                      height: 24.h,
                    ),
                    const AuthTextfield(text: 'İlan Açıklaması', textInputType: TextInputType.multiline, hintText: 'Açıklama',maxLine: 5,minLine: 5,),
                    SizedBox(
                      height: 48.h,
                    ),
                    CustomFilledButton(text: 'İlanı Yayınla', onTap: (){})
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
