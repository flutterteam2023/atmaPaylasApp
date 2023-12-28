import 'package:atma_paylas_app/common_widgets/auth_textfield.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class AdsStateView extends ConsumerStatefulWidget {
  const AdsStateView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdsStateViewState();
}
class _AdsStateViewState extends ConsumerState<AdsStateView> {
  String  _currentSelectedValue = 'İstanbul';
  int _radioValue1 = 1;
  int _radioValue2 = 0;
  PageController _pageController = PageController(initialPage: 0);
  var _currencies = [
    "İstanbul",
    "Ankara",
    "İzmir",
    "Adana",
    "Adıyaman",
    "Afyonkarahisar",
    "Ağrı",
    "Aksaray",
  ];
  List<Widget> fields = [
    

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
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
                  color: const Color(AppColors.primaryColor),
                ),
              ),
            ),
          )
        ],
        title: Text(
          'İlan Durumu Belirle',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, fontFamily: 'Rubik', color: Colors.black),
        ),
      
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 48.h,left: 16.w,right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Bounceable(
                  onTap: () {
                    setState(() {
                      if (_radioValue1==0) {


                        _radioValue1 = 1;
                        _pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeIn);

                      } 
                      _radioValue2 = 0;
                    });
                  },
                  child: Container(
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
                              value:_radioValue1,
                              groupValue: 1,
                              onChanged: (value) {},
                              activeColor: const Color(AppColors.primaryColor),
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          
                          Text('Ücretsiz Paylaştım',
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
                ),
                Bounceable(
                  onTap: () {
                    setState(() {
                      if (_radioValue2==0) {
                        _radioValue2 = 1;
                        _pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                      } 
                      _radioValue1 = 0;        
                      
                                  });
                  },
                  child: Container(
                    width: 171.w,
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
                              value: _radioValue2,
                              groupValue: 1,
                              onChanged: (value) {
                              },
                              activeColor: const Color(AppColors.primaryColor),
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text('Takasladım',
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
                ),
              ],
            ),
            SizedBox(height: 42.h,),
            SizedBox(
              height: 280.h,
              child: PageView.builder(
                controller: _pageController,
               
                physics: NeverScrollableScrollPhysics(),
                
                itemCount: 2,
                itemBuilder: (context, index) {
                return index==0? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthTextfield(text: 'Paylaşılan Kullanıcı' , hintText: 'user123'),
              SizedBox(height: 24.h,),
              Text('Paylaşılan Şehir',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Rubik',
                color: const Color(AppColors.primaryTextColor),
              ),
                      
              
              ),
              SizedBox(height: 5.h,),
              
              FormField<String>(
                      builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                    labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, fontFamily: 'Rubik', color: Colors.black),
                    errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                    hintText: 'Please select expense',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                isEmpty: _currentSelectedValue == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _currentSelectedValue,
                    isDense: true,
                    onChanged: ( value) {
                      setState(() {
                        _currentSelectedValue = value!;
                        state.didChange(value);
                      });
                    },
                    items: _currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
                      },
                    ),
                    SizedBox(height: 48.h,),
                    
                ],
              ):Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthTextfield(text: 'Takaslanan Kullanıcı' , hintText: 'user123'),
              SizedBox(height: 24.h,),
              Text('Takaslanan Şehir',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Rubik',
                color: const Color(AppColors.primaryTextColor),
              ),
                      
              
              ),
              SizedBox(height: 5.h,),
              
              FormField<String>(
                      builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                    labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, fontFamily: 'Rubik', color: Colors.black),
                    errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                    hintText: 'Please select expense',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                isEmpty: _currentSelectedValue == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _currentSelectedValue,
                    isDense: true,
                    onChanged: ( value) {
                      setState(() {
                        _currentSelectedValue = value!;
                        state.didChange(value);
                      });
                    },
                    items: _currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
                      },
                    ),
                    SizedBox(height: 48.h,),
                    
                ],
              );
                  
                },
              ),
            ),
            CustomFilledButton(text: 'Onayla ve Devam et', onTap: (){
                      
                      
                    })
            
            
          ],
        ),
      ),
    );
  }
}