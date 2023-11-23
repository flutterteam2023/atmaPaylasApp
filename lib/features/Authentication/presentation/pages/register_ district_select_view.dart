import 'package:atma_paylas_app/common_widgets/city_select.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class RegisterDistrictSelectView extends ConsumerWidget {
  const RegisterDistrictSelectView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Bulunduğun İlçe',
          style: TextStyle(
            fontSize: 21.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Rubik',
            color: const Color(AppColors.primaryColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 16.h,right: 16.w,left: 16.w,),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('İstanbul’un İlçeleri',
                  style:  TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: Colors.black,
                  ),
                  ),
                  Bounceable(
                    onTap: (){
                    },
                    child: Text('İl Değiştir',
                    style:  TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Rubik',
                      color: const Color(AppColors.primaryColor),
                    )
                    ),
                  )
                ],
              ),
              SizedBox(height: 24.h,),
              TextField(
                cursorColor: const Color(AppColors.primaryColor),
                decoration: InputDecoration(
                  hintText: 'Şehir Ara',
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: const Color(0xff858585),
                  ),
                  prefixIcon:  SvgPicture.asset(
                    'assets/svg/search-normal.svg',
                    fit: BoxFit.scaleDown,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xffE0E0E0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: const BorderSide(
                      color: Color(0xffE0E0E0),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: const BorderSide(
                      color: Color(0xffE0E0E0),
                      width: 2,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6.h,),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context,index){
                
              
                return Padding(
                  padding:  EdgeInsets.only(top: 16.h),
                  child: const CitySelect(),
                );
              },itemCount: 10,)
            ],
          ),
        ),
      ),
    );
  }
}