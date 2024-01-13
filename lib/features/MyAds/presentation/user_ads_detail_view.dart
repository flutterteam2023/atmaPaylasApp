// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:atma_paylas_app/common_widgets/custom_filled_button_berke.dart';
import 'package:atma_paylas_app/common_widgets/show_gallert.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class UserAdsDetailView extends StatefulHookWidget {
  const UserAdsDetailView(this.id, {super.key});
  final int? id;


  @override
  State<UserAdsDetailView> createState() => _UserAdsDetailViewState();
}

class _UserAdsDetailViewState extends State<UserAdsDetailView> {
  final formatter = DateFormat('dd/MM/yyyy');
  
  @override
  Widget build(BuildContext context) {
    final image = ValueNotifier<File?>(null);
    final image2 = ValueNotifier<File?>(null);
    final image3 = ValueNotifier<File?>(null);
    final choise = ValueNotifier<int?>(null);
    final titleControlller= useTextEditingController();
    final descriptionControlller= useTextEditingController();

 

  // ignore: no_leading_underscores_for_local_identifiers
  Future<void> _imgFromCamera(int imageNO) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        if(imageNO == 1){
          image.value = File(pickedFile.path);
        }else if(imageNO == 2){
          image2.value = File(pickedFile.path);
        }else if(imageNO == 3){
          image3.value = File(pickedFile.path);
        }
      } else {
        print('No image selected.');
      }
    });
  }

  // ignore: no_leading_underscores_for_local_identifiers
  Future<void> _imgFromGallery(int imageNO) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        if(imageNO == 1){
          image.value = File(pickedFile.path);
        }else if(imageNO == 2){
          image2.value = File(pickedFile.path);
        }else if(imageNO == 3){
          image3.value = File(pickedFile.path);
        }
      } else {
        print('No image selected.');
      }
    });
  }

  
  // ignore: no_leading_underscores_for_local_identifiers
  void _showPicker(BuildContext context,int imageNO) {
    // ignore: inference_failure_on_function_invocation
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SizedBox(
              height: 150.h,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Galeriden Seç'),
                    onTap: () {
                      // ignore: deprecated_member_use
                      _imgFromGallery(imageNO);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Kameradan Çek'),
                    onTap: () {
                      // ignore: deprecated_member_use
                      _imgFromCamera(imageNO);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        },);
  }
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        actions: [
          // Padding(
          //   padding: EdgeInsets.only(right: 16.w),
          //   child: Bounceable(
          //       onTap: () {
          //         MenuItemButton(
          //           child: Icon(
          //             Icons.more_horiz,
          //             size: 30.r,
          //           ),

          //         );
          //       },
          //       child: Icon(
          //         Icons.more_horiz,
          //         size: 30.r,
          //       )),
          // )
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: PopupMenuButton<String>(
              iconSize: 30.r,
              onSelected: (String result) async {
                if (result == 'secenek1') {
                  print('Secenek1');
                  // ignore: inference_failure_on_function_invocation
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
                      backgroundColor: Colors.white,
                      title: Text(
                        'İlanı silmek istediğinize emin misiniz?',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Rubik',
                          color: const Color(0xff000000),
                        ),
                      ),
                      content: Padding(
                        padding: EdgeInsets.only(top: 32.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Bounceable(
                              onTap: () {
                                GetIt.instance<FeedRepository>().deleteFeed(widget.id.toString());
                                context.pushRoute(const NavigatorRoute());
                              },
                              child: Container(
                                width: 252.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(color: const Color(0xffB8372F), width: 1.w),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  child: Center(
                                    child: Text(
                                      'Evet, silmek istiyorum',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Rubik',
                                        color: const Color(0xffB8372F),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Bounceable(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 252.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: const Color(0xffB8372F),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  child: Center(
                                    child: Text(
                                      'Hayır, silmek istemiyorum',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Rubik',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (result == 'secenek2') {
                  if (kDebugMode) {
                    print('Secenek2');
                  }
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'secenek1',
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/trash-outline.svg'),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'İlanı Sil',
                        style: TextStyle(
                          color: const Color(0xffB8372F),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Rubik',
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'secenek2',
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/share.svg'),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'İlanı Sil',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Rubik',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        title: Text(
          'İlan Detayı',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, fontFamily: 'Rubik', color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: GetIt.instance<FeedRepository>().getFeedDetails(widget.id.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Hata Oluştu'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ],
            );
          }
          if (snapshot.hasData) {
            return snapshot.data!.fold((l) => const SizedBox(), (r) {
              return Scaffold(
                bottomSheet: r.receiverUser != null && r.receiverConfirmed == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Gap(18),
                              const Icon(
                                Icons.timelapse,
                                color: Color(AppColors.primaryColor),
                                size: 32,
                              ),
                              Text(
                                'Paylaşılan Kullanıcı Tarafından\nOnay Bekleniyor...',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Rubik',
                                  color: const Color(AppColors.primaryColor),
                                ),
                              ),
                              const Gap(18 * 2),
                            ],
                          ),
                        ],
                      )
                    : r.receiverUser != null && r.receiverConfirmed
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Gap(18),
                                  const Icon(
                                    Icons.done,
                                    color: Color(AppColors.primaryColor),
                                    size: 32,
                                  ),
                                  Text(
                                    'İlan Paylaşıldı',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Rubik',
                                      color: const Color(AppColors.primaryColor),
                                    ),
                                  ),
                                  const Gap(18 * 2),
                                ],
                              ),
                            ],
                          )
                        : SizedBox(
                            height: 100.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Bounceable(
                                  onTap: () async {
                                    await showModalBottomSheet<bool>(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) => SendToVerifyingOtherUserView(id: widget.id),
                                    ).then((value) {
                                      if (value ?? false) {
                                        setState(() {});
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 171.w,
                                    height: 49.h,
                                    decoration: BoxDecoration(
                                      color: const Color(AppColors.primaryLightColor),
                                      borderRadius: BorderRadius.circular(5.r),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
                                      child: Center(
                                        child: Text(
                                          'İlan Durumu Belirle',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Rubik',
                                            color: const Color(AppColors.primaryColor),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Bounceable(
                                      onTap: () async {
                                        //buraya show bottom sheet gelecek
                                        await showModalBottomSheet<bool>(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            snapshot.data!.fold((l) => null, (r) {
                                              if (r.listingType == ListingTypes.free.name ) {
                                                choise.value = 0;

                                              }else{
                                                choise.value =1;
                                              }
                                            });
                                            //buraya ilan düzenleme gelecek yapar mısın
                                            return Container(
                                              padding: EdgeInsets.only(
                                                  left: 18,
                                                  right: 18,
                                                  top: 18,
                                                  bottom: MediaQuery.of(context).viewInsets.bottom + 18 * 2),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Paylaşım Türü',
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: 'Rubik',
                                                      color: const Color(AppColors.primaryTextColor),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  ValueListenableBuilder(
                                                    valueListenable: choise,
                                                    builder: (context,_,__) {
                                                      return InkWell(
                                                        onTap: () {
                                                         choise.value = 0;
                                                        

                                                        },
                                                        borderRadius: BorderRadius.circular(9),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                              color: const Color(AppColors.primaryColor),
                                                              width: 1.w,
                                                            ),
                                                            borderRadius: BorderRadius.circular(9),
                                                          ),
                                                          padding: const EdgeInsets.all(18),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                height: 12.r,
                                                                width: 12.r,
                                                                child: Radio(
                                                                  value:0,
                                                                  groupValue:choise.value,
                                                                  onChanged: (value) {
                                                                    choise.value = 0;

                                                                  },
                                                                  activeColor: const Color(AppColors.primaryColor),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 8.w,
                                                              ),
                                                              Text(
                                                                'Ücretsiz Paylaştım',
                                                                style: TextStyle(
                                                                  fontSize: 14.sp,
                                                                  fontWeight: FontWeight.w400,
                                                                  fontFamily: 'Rubik',
                                                                  color: const Color(AppColors.primaryColor),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 9.h,
                                                  ),
                                                  ValueListenableBuilder(
                                                    valueListenable: choise,
                                                    builder: (context,_,__) {
                                                      return InkWell(
                                                        onTap: () {
                                                         choise.value = 1;
                                                        },
                                                        borderRadius: BorderRadius.circular(9),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                              color: const Color(AppColors.primaryColor),
                                                              width: 1.w,
                                                            ),
                                                            borderRadius: BorderRadius.circular(9),
                                                          ),
                                                          padding: const EdgeInsets.all(18),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                height: 12.r,
                                                                width: 12.r,
                                                                child: Radio(
                                                                  value: 1,
                                                                  groupValue: choise.value,
                                                                  onChanged: (value) {
                                                                    choise.value = 1;


                                                                  },
                                                                  activeColor: const Color(AppColors.primaryColor),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 8.w,
                                                              ),
                                                              Text(
                                                                'Takasladım',
                                                                style: TextStyle(
                                                                  fontSize: 14.sp,
                                                                  fontWeight: FontWeight.w400,
                                                                  fontFamily: 'Rubik',
                                                                  color: const Color(AppColors.primaryColor),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 9.h,
                                                  ),
                                                  const Divider(),
                                                  SizedBox(
                                                    height: 9.h,
                                                  ),
                                                  Text(
                                                    'İlan Başlığı',
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: 'Rubik',
                                                      color: const Color(AppColors.primaryTextColor),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  TextFormField(
                                                    controller: titleControlller,
                                                    decoration:  InputDecoration(
                                                      hintText: snapshot.data!.fold(
                                                        (l) => '',
                                                        (r) => r.title,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 9.h,
                                                  ),
                                                  const Divider(),
                                                  SizedBox(
                                                    height: 9.h,
                                                  ),
                                                  Text(
                                                    'İlan Açıklaması',
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: 'Rubik',
                                                      color: const Color(AppColors.primaryTextColor),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  TextFormField(
                                                    controller: descriptionControlller,
                                                    decoration: InputDecoration(
                                                      hintText: snapshot.data!.fold(
                                                        (l) => '',
                                                        (r) => r.description,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 9.h,
                                                  ),
                                                  const Divider(),
                                                  SizedBox(
                                                    height: 9.h,
                                                  ),
                                                  Text(
                                                    'İlan Görselleri',
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: 'Rubik',
                                                      color: const Color(AppColors.primaryTextColor),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      ValueListenableBuilder(
                                                        valueListenable: image,
                                                        builder: (context, value, child) {
                                                          return Bounceable(
                                                            onTap: () {
                                                              //buraya image picker gelecek
                                                          
                                                                _showPicker(context,1);
                                                          
                                                            

                                                            
                                                            },
                                                            child:image.value==null? Container(
                                                              height: 90.r,
                                                              width: 90.r,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(5.r),
                                                                image: snapshot.data!.fold(
                                                                  (l) => const DecorationImage(
                                                                    image: AssetImage('assets/images/adsdemo.png'),
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                  (r) => r.image1 != null
                                                                      ? DecorationImage(
                                                                          image: NetworkImage(r.image1!),
                                                                          fit: BoxFit.cover,
                                                                        )
                                                                      : const DecorationImage(
                                                                          image: AssetImage('assets/images/adsdemo.png'),
                                                                          fit: BoxFit.cover,
                                                                        ),
                                                                ),
                                                              ),
                                                            
                                                            ):Container(
                                                              height: 90.r,
                                                              width: 90.r,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(5.r),
                                                                image: DecorationImage(
                                                                  image: FileImage(image.value!),
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      SizedBox(
                                                        width: 8.w,
                                                      ),
                                                      ValueListenableBuilder(
                                                        valueListenable: image2,
                                                        builder: (context, value, child) {
                                                          return Bounceable(
                                                            onTap: () {
                                                              //buraya image picker gelecek
                                                              _showPicker(context,2);
                                                            },
                                                            child:image2.value==null? Container(
                                                              height: 90.r,
                                                              width: 90.r,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(5.r),
                                                                image: snapshot.data!.fold(
                                                                  (l) => const DecorationImage(
                                                                    image: AssetImage('assets/images/adsdemo.png'),
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                  (r) => r.image2 != null
                                                                      ? DecorationImage(
                                                                          image: NetworkImage(r.image2!),
                                                                          fit: BoxFit.cover,
                                                                        )
                                                                      : const DecorationImage(
                                                                          image: AssetImage('assets/images/adsdemo.png'),
                                                                          fit: BoxFit.cover,
                                                                        ),
                                                                ),
                                                              ),
                                                            
                                                            ):Container(
                                                              height: 90.r,
                                                              width: 90.r,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(5.r),
                                                                image: DecorationImage(
                                                                  image: FileImage(image2.value!),
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      SizedBox(
                                                        width: 8.w,
                                                      ),
                                                      ValueListenableBuilder(
                                                        valueListenable: image3,
                                                        builder: (context, value, child) {
                                                          return Bounceable(
                                                            onTap: () {
                                                              //buraya image picker gelecek
                                                              _showPicker(context,3);
                                                            },
                                                            child:image3.value==null? Container(
                                                              height: 90.r,
                                                              width: 90.r,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(5.r),
                                                                image: snapshot.data!.fold(
                                                                  (l) => const DecorationImage(
                                                                    image: AssetImage('assets/images/adsdemo.png'),
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                  (r) => r.image3 != null
                                                                      ? DecorationImage(
                                                                          image: NetworkImage(r.image3!),
                                                                          fit: BoxFit.cover,
                                                                        )
                                                                      : const DecorationImage(
                                                                          image: AssetImage('assets/images/adsdemo.png'),
                                                                          fit: BoxFit.cover,
                                                                        ),
                                                                ),
                                                              ),
                                                            
                                                            ):Container(
                                                              height: 90.r,
                                                              width: 90.r,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(5.r),
                                                                image: DecorationImage(
                                                                  image: FileImage(image3.value!),
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            
                                                            
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 9.h,
                                                  ),
                                                  const Divider(),
                                                  SizedBox(
                                                    height: 9.h,
                                                  ),
                                                  CustomFilledButtonBerke(text: 'İlanımı Güncelle', onTap: () async {
                                                    await EasyLoading.show(status: 'İlanınız güncelleniyor...');
                                                    // ignore: use_build_context_synchronously
                                                    await GetIt.instance<FeedRepository>().updateFeed(
                                                     snapshot.data!.fold((l) => l.toString(), (r) => r.id.toString()),
                                                      image.value,
                                                      image2.value,
                                                      image3.value,
                                                      choise.value==0?ListingTypes.free:ListingTypes.tradable,
                                                      titleControlller.text,
                                                      descriptionControlller.text,
                                                      context
                                                      
                                                    );
                                                   
                                                   
                                                  },),

                                                   
                                                ],
                                              ),
                                            );
                                          },
                                        ).then((value) {
                                          if (value ?? false) {
                                            setState(() {});
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 171.w,
                                        height: 49.h,
                                        decoration: BoxDecoration(
                                          color: const Color(AppColors.primaryColor),
                                          borderRadius: BorderRadius.circular(5.r),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
                                          child: Center(
                                            child: Text(
                                              'İlanı Düzenle',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Rubik',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                              ],
                            ),
                          ),
                body: SingleChildScrollView(
                  child: Column(
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
                                    image: r.image1 != null
                                        ? DecorationImage(image: NetworkImage(r.image1!), fit: BoxFit.cover)
                                        : const DecorationImage(
                                            image: AssetImage('assets/images/adsdemo.png'),
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                                Positioned(
                                  top: 16.h,
                                  left: 16.w,
                                  child: Bounceable(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.r),
                                        color: r.listingType == ListingTypes.free.name
                                            ? const Color(0xff6DCEBB)
                                            : const Color(0xffFD8435),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                                        child: Text(
                                          r.listingType == ListingTypes.free.name
                                              ? 'Ücretsiz Paylaşıyor'
                                              : 'Takaslanıyor',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Rubik',
                                            color: r.listingType == ListingTypes.free.name
                                                ? const Color(0xff05473A)
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
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
                                  formatter.format(r.createdAt),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Rubik',
                                    color: const Color(0xff858585),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              '${r.ownerInfo.district} / ${r.ownerInfo.city}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Rubik',
                                color: const Color(AppColors.primaryColor),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              r.title,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Rubik',
                                color: const Color(0xff000000),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            SizedBox(
                              width: 358.w,
                              child: Text(
                                r.description,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Rubik',
                                  color: const Color(AppColors.primaryTextColor),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 90.h,
                        child: ListView(
                          padding: EdgeInsets.only(left: 8.w, right: 16.w),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            if (r.image1 != null)
                              Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: InkWell(
                                  onTap: () {
                                    final images = <String>[];
                                    if (r.image1 != null) images.add(r.image1!);
                                    if (r.image2 != null) images.add(r.image2!);
                                    if (r.image3 != null) images.add(r.image3!);
                                    showGallery(context, images: images, startIndex: 0);
                                  },
                                  child: Container(
                                    width: 113.w,
                                    height: 90.h,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                                      image: DecorationImage(
                                        image: NetworkImage(r.image1!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            else
                              const SizedBox.shrink(),
                            if (r.image2 != null)
                              Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: InkWell(
                                  onTap: () {
                                    final images = <String>[];
                                    if (r.image1 != null) images.add(r.image1!);
                                    if (r.image2 != null) images.add(r.image2!);
                                    if (r.image3 != null) images.add(r.image3!);
                                    showGallery(context, images: images, startIndex: 1);
                                  },
                                  child: Container(
                                    width: 113.w,
                                    height: 90.h,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                                      image: DecorationImage(
                                        image: NetworkImage(r.image2!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            else
                              const SizedBox.shrink(),
                            if (r.image3 != null)
                              Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: InkWell(
                                  onTap: () {
                                    final images = <String>[];
                                    if (r.image1 != null) images.add(r.image1!);
                                    if (r.image2 != null) images.add(r.image2!);
                                    if (r.image3 != null) images.add(r.image3!);
                                    showGallery(context, images: images, startIndex: 2);
                                  },
                                  child: Container(
                                    width: 113.w,
                                    height: 90.h,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                                      image: DecorationImage(
                                        image: NetworkImage(r.image3!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            else
                              const SizedBox.shrink(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.w, right: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ürün Sahibi',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Rubik',
                                color: const Color(0xff000000),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 48.r,
                                      width: 48.r,
                                      decoration: BoxDecoration(
                                        image: r.ownerInfo.profileImage != null
                                            ? DecorationImage(
                                                image: NetworkImage(r.ownerInfo.profileImage!),
                                                fit: BoxFit.cover,
                                              )
                                            : const DecorationImage(
                                                image: AssetImage('assets/images/persondemo.png'),
                                                fit: BoxFit.cover,
                                              ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${r.ownerInfo.name} ${r.ownerInfo.surname}',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Rubik',
                                            color: const Color(0xff000000),
                                          ),
                                        ),
                                        Text(
                                          r.ownerInfo.username!,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Rubik',
                                            color: const Color(
                                              AppColors.primaryTextColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  '${r.ownerInfo.district} / ${r.ownerInfo.city}',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Rubik',
                                    color: const Color(AppColors.primaryColor),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 180.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class SendToVerifyingOtherUserView extends HookWidget {
  const SendToVerifyingOtherUserView({
    super.key,
    required this.id,
  });

  final int? id;

  @override
  Widget build(BuildContext context) {
    final otherUserNameController = useTextEditingController();
    final choise = useState(1);
    return Container(
      padding: EdgeInsets.only(left: 18, right: 18, top: 18, bottom: MediaQuery.of(context).viewInsets.bottom + 18 * 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
          const Gap(18),
          Text(
            'Paylaşım Türü',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Rubik',
              color: const Color(AppColors.primaryTextColor),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          ValueListenableBuilder(
            valueListenable: choise,
            builder: (context, val, wid) {
              return InkWell(
                onTap: () {
                  choise.value = 0;
                },
                borderRadius: BorderRadius.circular(9),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: choise.value == 0 ? const Color(AppColors.primaryColor) : Colors.grey[500]!,
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 12.r,
                        width: 12.r,
                        child: Radio(
                          value: 0,
                          groupValue: choise.value,
                          onChanged: (value) {
                            choise.value = 0;
                          },
                          activeColor: const Color(AppColors.primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Ücretsiz Paylaştım',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Rubik',
                          color: const Color(AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const Gap(9),
          ValueListenableBuilder(
            valueListenable: choise,
            builder: (context, val, wid) {
              return InkWell(
                onTap: () {
                  choise.value = 1;
                },
                borderRadius: BorderRadius.circular(9),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: choise.value == 1 ? const Color(AppColors.primaryColor) : Colors.grey[500]!,
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  padding: const EdgeInsets.all(18),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 12.r,
                        width: 12.r,
                        child: Radio(
                          value: 1,
                          groupValue: choise.value,
                          onChanged: (value) {
                            choise.value = 1;
                          },
                          activeColor: const Color(AppColors.primaryColor),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Takasladım',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Rubik',
                          color: const Color(AppColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const Gap(9),
          const Divider(),
          const Gap(9),
          Text(
            'Paylaşılan Kullanıcı',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              fontFamily: 'Rubik',
              color: const Color(AppColors.primaryTextColor),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          TextFormField(
            controller: otherUserNameController,
            decoration: const InputDecoration(
              hintText: 'Paylaşılan kullanıcı adı',
            ),
          ),
          const Gap(9),
          const Divider(),
          const Gap(9),
          CustomFilledButtonBerke(
            text: 'Onaylamaya Gönder',
            onTap: () async {
              await GetIt.instance<FeedRepository>()
                  .completeListing(
                id.toString(),
                choise.value == 0 ? ListingTypes.free : ListingTypes.tradable,
                otherUserNameController.text,
              )
                  .then((value) {
                value.fold(
                  EasyLoading.showError,
                  (r) => Navigator.of(context).pop(true),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
