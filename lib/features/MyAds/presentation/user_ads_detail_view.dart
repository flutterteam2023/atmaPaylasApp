// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:atma_paylas_app/common_widgets/custom_filled_button_berke.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/features/Feed/models/feed_detail_model.dart';
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
    final choise = ValueNotifier<int?>(null);
    final titleControlller = useTextEditingController(text: "");
    final descriptionControlller = useTextEditingController(text: "");
    ValueNotifier<List<AdsImage>> images = ValueNotifier<List<AdsImage>>([]);
    ValueNotifier<List<XFile>> fileImages = ValueNotifier<List<XFile>>([]);
    ValueNotifier<List<int>> imageId = ValueNotifier<List<int>>([]);


    // ignore: no_leading_underscores_for_local_identifiers
    Future<void> _imgFromCamera() async {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 50);
    }

    ;

    // ignore: no_leading_underscores_for_local_identifiers
    Future<void> _imgFromGallery() async {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50);

      fileImages.value.add(pickedFile!);
      fileImages.notifyListeners();

      //pickedFile!.path'i url formatına çevirmek istiyorum
    }

    // ignore: no_leading_underscores_for_local_identifiers
    void _showPicker(BuildContext context) {
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
                    onTap: () async {
                      // ignore: deprecated_member_use
                      await _imgFromGallery();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Kameradan Çek'),
                    onTap: () {
                      // ignore: deprecated_member_use
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
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
              for (final element in r.images) {
                images.value.add(element);
              }

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
                                          if (r.listingType == ListingTypes.free.name) {
                                            choise.value = 0;
                                          } else {
                                            choise.value = 1;
                                          }
                                        });
                                        return Container(
                                          height: MediaQuery.of(context).size.height * 0.8,
                                          padding: EdgeInsets.only(
                                              left: 18,
                                              right: 18,
                                              top: 18,
                                              bottom: MediaQuery.of(context).viewInsets.bottom + 18 * 2),
                                          child: SingleChildScrollView(
                                            child: Column(
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
                                                  builder: (context, _, __) {
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
                                                SizedBox(
                                                  height: 9.h,
                                                ),
                                                ValueListenableBuilder(
                                                  valueListenable: choise,
                                                  builder: (context, _, __) {
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
                                                  decoration: InputDecoration(
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
                                                  'İlan Görseli Sil',
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
                                                  valueListenable: images,
                                                  builder: (context, _, __) {
                                                    return SizedBox(
                                                      height: 150.h,
                                                      child: GridView.builder(
                                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 3, childAspectRatio: 1),
                                                        itemCount: images.value.length,
                                                        shrinkWrap: true,
                                                        itemBuilder: (context, index) {
                                                          return Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Stack(
                                                              children: [
                                                                Container(
                                                                  height: 90.r,
                                                                  width: 90.r,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(5.r),
                                                                  ),
                                                                  child: Image.network(
                                                                    images.value[index].image,
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  top: 5.h,
                                                                  right: 20.w,
                                                                  child: InkWell(
                                                                    onTap: () {
                                                                      imageId.value.add(images.value[index].id);

                                                                      images.value.removeAt(index);
                                                                      images.notifyListeners();
                                                                    },
                                                                    child: Container(
                                                                      height: 30.r,
                                                                      width: 30.r,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.white,
                                                                        shape: BoxShape.circle,
                                                                      ),
                                                                      child: const Icon(
                                                                        Icons.delete,
                                                                        size: 20,
                                                                        color: Color(AppColors.primaryColor),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Text(
                                                  'İlan Görseli Ekle',
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Rubik',
                                                    color: const Color(AppColors.primaryTextColor),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 9.h,
                                                ),
                                                const Divider(),
                                                Row(
                                                  children: [
                                                    Bounceable(
                                                      onTap: () {
                                                        _imgFromGallery();
                                                        fileImages.notifyListeners();
                                                      },
                                                      child: Container(
                                                        width: 90.r,
                                                        height: 90.r,
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(5.r),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              const Icon(
                                                                Icons.image,
                                                                color: Color(AppColors.primaryColor),
                                                              ),
                                                              Text(
                                                                'Görsel Ekle',
                                                                style: TextStyle(
                                                                  fontSize: 10.sp,
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
                                                    SizedBox(
                                                      width: 30.w,
                                                    ),
                                                    ValueListenableBuilder(
                                                      valueListenable: fileImages,
                                                      builder: (context, _, __) {
                                                        return Expanded(
                                                          child: GridView.builder(
                                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount: 3, childAspectRatio: 1),
                                                            itemCount: fileImages.value.length,
                                                            shrinkWrap: true,
                                                            itemBuilder: (context, index) {
                                                              return Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Stack(
                                                                  children: [
                                                                    Container(
                                                                      height: 90.r,
                                                                      width: 90.r,
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(5.r),
                                                                      ),
                                                                      child: Image.file(
                                                                        File(fileImages.value[index].path),
                                                                        fit: BoxFit.cover,
                                                                      ),
                                                                    ),
                                                                    Positioned(
                                                                      top: 5.h,
                                                                      right: 5.w,
                                                                      child: InkWell(
                                                                        onTap: () {
                                                                          fileImages.value.removeAt(index);
                                                                          fileImages.notifyListeners();
                                                                        },
                                                                        child: Container(
                                                                          height: 20.r,
                                                                          width: 20.r,
                                                                          decoration: BoxDecoration(
                                                                            color: Colors.white,
                                                                            shape: BoxShape.circle,
                                                                          ),
                                                                          child: const Icon(
                                                                            Icons.delete,
                                                                            size: 15,
                                                                            color: Color(AppColors.primaryColor),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 9.h,
                                                ),
                                                CustomFilledButtonBerke(
                                                  text: 'İlanımı Güncelle',
                                                  onTap: ()  {
                                                    
                                                    setState(() {
                                                      setState(() {
                                                       EasyLoading.show(status: 'İlanınız güncelleniyor...');
                                                     GetIt.instance<FeedRepository>()
                                                        .updateFeed(
                                                            widget.id.toString(),
                                                            imageId.value,
                                                            fileImages.value,
                                                            choise.value == 0
                                                                ? ListingTypes.free
                                                                : ListingTypes.tradable,
                                                            titleControlller.text != ""
                                                                ? titleControlller.text
                                                                : snapshot.data!.fold(
                                                                    (l) => '',
                                                                    (r) => r.title,
                                                                  ),
                                                            descriptionControlller.text != ""
                                                                ? descriptionControlller.text
                                                                : snapshot.data!.fold(
                                                                    (l) => '',
                                                                    (r) => r.description,
                                                                  ),
                                                            context)
                                                        .then((value) {
                                                      value.fold((l) {
                                                        EasyLoading.dismiss();
                                                        EasyLoading.showError(l);
                                                      }, (r) {});
                                                    });
                                                    });
                                                      
                                                    });
                                                    
                                                  },
                                                ),
                                              ],
                                            ),
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
                                    // ignore: unnecessary_null_comparison
                                    image: r.images.isNotEmpty
                                        ? DecorationImage(image: NetworkImage(r.images[0].image), fit: BoxFit.cover)
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
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 8.w, right: 16.w),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: r.images.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: InkWell(
                                onTap: () {
                                  // final images = <String>[];
                                  // if (r.image1 != null) images.add(r.image1!);
                                  // if (r.image2 != null) images.add(r.image2!);
                                  // if (r.image3 != null) images.add(r.image3!);
                                },
                                child: Container(
                                  width: 113.w,
                                  height: 90.h,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                                    image: DecorationImage(
                                      image: NetworkImage(r.images[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
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
