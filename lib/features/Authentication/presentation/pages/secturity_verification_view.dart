import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class SecturityVerificationView extends ConsumerStatefulWidget {
  const SecturityVerificationView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SecturityVerificationViewState();
}
class _SecturityVerificationViewState extends ConsumerState<SecturityVerificationView> {
  bool _onEditing = true;
  String? _code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Bounceable(
              onTap: () {},
              child: Text(
                'Vazgeç',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: const Color(AppColors.primaryColor)),
              ),
            ),
          )
        ],
        centerTitle: false,
        title: Text(
          'Güvenlik Doğrulaması',
          style: TextStyle(
            fontSize: 21.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Rubik',
            color: const Color(AppColors.primaryColor),
          ),
        ),
      ) ,
      body: Padding(
      
        padding: EdgeInsets.only(left: 16.w, right: 16.w, ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            SizedBox(
              height: 41.h,
            ),
           
            SizedBox(
              height: 8.25.h,
            ),
            Text(
              'user@example.com E-posta adresinize gelen 6 haneli kodu girerek devam edebilirsiniz',
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                color: const Color(AppColors.primaryTextColor),
              ),
            ),
            SizedBox(
              height: 48.h,
            ),
            Text('Doğrulama Kodu',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Rubik',
              color: const Color(AppColors.primaryTextColor),
            ),
            
            
            ),
            SizedBox(
              height: 8.h,
            ),
            Center(
              
              child: VerificationCode(
                
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black),
              keyboardType: TextInputType.number,
                       fillColor: Colors.white,
                       fullBorder: true,
                      
                       underlineColor: Color(AppColors.primaryColor),
              length: 6,
              
              underlineUnfocusedColor:Color(0xffF2F4F7) ,
              
              cursorColor:
                  Color(AppColors.primaryColor), // If this is null it will default to the ambient
              // clearAll is NOT required, you can delete it
              // takes any widget, so you can implement your design
              
              margin:  EdgeInsets.all(3.r),
              onCompleted: (String value) {
                setState(() {
                  _code = value;
                });
              },
              
              onEditing: (bool value) {
                setState(() {
                  _onEditing = value;
                });
                if (!_onEditing) FocusScope.of(context).unfocus();
                
              },
                      ),
            ),
          SizedBox(height: 40.h,),
          Center(
            child: Bounceable(
              onTap: () {
                
              },
              child: Text('Kodu Tekrar Gönder',
              style: TextStyle(
                color: Color(AppColors.primaryColor),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'Rubik'
              ),
              ),
            ),
          ),
           
           
          SizedBox(
              height: 48.h,
            ),
            CustomFilledButton(
              onTap: () {
              },
              text: 'Onayla ve Devam Et',
              
            ),
            
              ],
            ),
            
           
          ],
        ),
      ),
    );
  }
}