// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/auth_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
@RoutePage()
class EmailVerificationView extends StatefulHookConsumerWidget {
  final String email;
  final String? password;
  const EmailVerificationView(this.email, this.password, {super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EmailVerificationViewState();
}
class _EmailVerificationViewState extends ConsumerState<EmailVerificationView> {
  bool _onEditing = true;
  String? _code;


  @override
  Widget build(BuildContext context) {
  final isloading = useState(false);

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
              '${widget.email} E-posta adresinize gelen 6 haneli kodu girerek devam edebilirsiniz',
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
                GetIt.instance<AuthRepository>().passwordReset(email: widget.email).then((value) {
                  value.fold((l) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l))), (r) => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Kod Tekrar Gönderildi'))));
                });
                
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
          if (isloading.value==false) CustomFilledButton(
              onTap: ()async {
                if (_code!=null && _code!.length==6) {
                  isloading.value = true;
                await GetIt.instance<AuthRepository>().verifyLogin(email: widget.email, code: _code!).then((value) {
                  value.fold((l){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l)));
                    isloading.value = false;
                  }, (r)async{
                    isloading.value = false;
                 await  GetIt.instance<AuthRepository>()
                          .login(
                        widget.email,
                        widget.password!,
                      )
                          .then((value) {
                        value.fold(
                          (l) => Fluttertoast.showToast(msg: l),
                          
                          (r) async {
                            if (r.success==null) {
                              await GetIt.instance<UserRepository>().getMyUserProfile().then((val) {
                              val.fold(
                                (l) {
                                  Log.error(l);
                                  GetIt.instance<UserRepository>().user = null;
                                },
                                (r) {
                                  Log.success(r.runtimeType);
                                
                              
                                  GetIt.instance<UserRepository>().user = r;
                                  context.pushRoute(const NavigatorRoute());
                                },
                              );
                            });
                              
                            } else {
                              await Fluttertoast.showToast(msg: r.success!);
                              // ignore: use_build_context_synchronously
                              await context.pushRoute(EmailVerificationRoute(email:widget.email,password: widget.password));
                              
                            }
                          },
                        );
                      });
                  });
                });
                  
                }else 
                {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Doğrulama Kodu 6 haneli olmalıdır')));
                }
              },
              text: 'Onayla ve Devam Et',
              
            ) else const Center(child: CircularProgressIndicator(color: Color(AppColors.primaryColor),))
            
              ],
            ),
            
           
          ],
        ),
      ),
    );
  }
}