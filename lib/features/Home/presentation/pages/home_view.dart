// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:atma_paylas_app/common_widgets/ads_card.dart';
import 'package:atma_paylas_app/common_widgets/ads_title.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/category_repository.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          'Atma Paylaş Takasla',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Rubik',
            color: Color(AppColors.primaryColor),
          ),
        ),
        actions: [
          InkWell(
            onTap: () async {
              await showModalBottomSheet<void>(
                context: context,
                builder: (context) {
                  File? image1;
                  File? image2;
                  File? image3;
                  ListingTypes listingType = ListingTypes.free;
                  int categoryId = 3;
                  String title = 'Deneme Title';
                  String description = 'Deneme description';

                  return Column(
                    children: [
                      Row(
                        children: [
                          FilledButton(
                            onPressed: () async {
                              final picker = ImagePicker();
                              final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                              if (pickedFile != null) {
                                final image = File(pickedFile.path);
                                image1 = image;
                              }
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.image),
                                SizedBox(width: 8.w),
                                const Text('Galeri 1'),
                              ],
                            ),
                          ),
                          const Text(' veya '),
                          FilledButton(
                            onPressed: () async {
                              final picker = ImagePicker();
                              final pickedFile = await picker.pickImage(source: ImageSource.camera);
                              if (pickedFile != null) {
                                final image = File(pickedFile.path);
                                image1 = image;
                              }
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.camera),
                                SizedBox(width: 8.w),
                                const Text('Kamera 1'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          FilledButton(
                            onPressed: () async {
                              final picker = ImagePicker();
                              final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                              if (pickedFile != null) {
                                final image = File(pickedFile.path);
                                image2 = image;
                              }
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.image),
                                SizedBox(width: 8.w),
                                const Text('Galeri 2'),
                              ],
                            ),
                          ),
                          const Text(' veya '),
                          FilledButton(
                            onPressed: () async {
                              final picker = ImagePicker();
                              final pickedFile = await picker.pickImage(source: ImageSource.camera);
                              if (pickedFile != null) {
                                final image = File(pickedFile.path);
                                image2 = image;
                              }
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.camera),
                                SizedBox(width: 8.w),
                                const Text('Kamera 2'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          FilledButton(
                            onPressed: () async {
                              final picker = ImagePicker();
                              final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                              if (pickedFile != null) {
                                final image = File(pickedFile.path);
                                image3 = image;
                              }
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.image),
                                SizedBox(width: 8.w),
                                const Text('Galeri 3'),
                              ],
                            ),
                          ),
                          const Text(' veya '),
                          FilledButton(
                            onPressed: () async {
                              final picker = ImagePicker();
                              final pickedFile = await picker.pickImage(source: ImageSource.camera);
                              if (pickedFile != null) {
                                final image = File(pickedFile.path);
                                image3 = image;
                              }
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.camera),
                                SizedBox(width: 8.w),
                                const Text('Kamera 3'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      FloatingActionButton(
                        onPressed: () async {
                          await FeedRepository()
                              .addFeed(image1, image2, image3, listingType, categoryId, title, description);
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  );
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: SvgPicture.asset(
                'assets/svg/notifications-outline.svg',
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 16.h,
                right: 16.w,
                left: 16.w,
              ),
              child: Column(
                children: [
                  TextField(
                    cursorColor: const Color(AppColors.primaryColor),
                    decoration: InputDecoration(
                      hintText: 'Ürün, kategori ara',
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Rubik',
                        color: const Color(0xff858585),
                      ),
                      prefixIcon: SvgPicture.asset(
                        'assets/svg/search-primary.svg',
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
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32.h,
              child: FutureBuilder(
                future: GetIt.instance<CategoryRepository>().getMainCategories(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const CircularProgressIndicator.adaptive();
                  }
                  return snapshot.data!.fold(
                    (l) => const SizedBox(),
                    (r) => ListView.builder(
                      padding: EdgeInsets.only(left: 8.w, right: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: r.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(AppColors.primaryColor),
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              child: Center(
                                child: Text(
                                  r[index].name,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Rubik',
                                    color: const Color(AppColors.primaryColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                children: [
                  Container(
                    height: 100.h,
                    color: const Color(AppColors.primaryLightColor),
                    child: Center(
                      child: Text(
                        'Reklam Alanı',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Rubik',
                          color: const Color(AppColors.primaryColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AdsTitle(
                    title: 'Yakındaki İlanlar',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300.h,
              child: ListView.builder(
                padding: EdgeInsets.only(right: 16.w),
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return AdsCard(
                    isSaved: true,
                    width: 265.w,
                    colorType: const Color(0xff6DCEBB),
                    textColor: const Color(0xff05473A),
                    adsType: 'Ücretsiz Paylaşıyor',
                    address: 'Kadıköy / İstanbul',
                    productName: 'Casio Saat',
                    date: '21/10/2023',
                    userName: 'user123456',
                    productImage: 'assets/images/clockdemo.png',
                    saveButtonOnTap: () {},
                    seeAdsDetailOnTap: () {},
                  );
                },
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: AdsTitle(title: 'En Çok Ziyaret Edilenler', onTap: () {}),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 300.h,
              child: ListView.builder(
                padding: EdgeInsets.only(right: 16.w),
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return AdsCard(
                    width: 265.w,
                    isSaved: true,
                    colorType: const Color(0xff6DCEBB),
                    textColor: const Color(0xff05473A),
                    adsType: 'Ücretsiz Paylaşıyor',
                    address: 'Kadıköy / İstanbul',
                    productName: 'Lorem Bisiklet',
                    date: '21/10/2023',
                    userName: 'user123456',
                    productImage: 'assets/images/bicycle.png',
                    saveButtonOnTap: () {},
                    seeAdsDetailOnTap: () {},
                  );
                },
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: AdsTitle(title: 'Paylaşılan Ürünler', onTap: () {}),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 300.h,
              child: ListView.builder(
                padding: EdgeInsets.only(right: 16.w),
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return AdsCard(
                    width: 265.w,
                    isSaved: true,
                    textColor: const Color(0xff05473A),
                    colorType: const Color(0xff6DCEBB),
                    adsType: 'Ücretsiz Paylaşıyor',
                    address: 'Kadıköy / İstanbul',
                    productName: 'Lorem Bisiklet',
                    date: '21/10/2023',
                    userName: 'user123456',
                    productImage: 'assets/images/bicycle.png',
                    saveButtonOnTap: () {},
                    seeAdsDetailOnTap: () {},
                  );
                },
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: AdsTitle(title: 'Paylaşılan Ürünler', onTap: () {}),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 300.h,
              child: ListView.builder(
                padding: EdgeInsets.only(right: 16.w),
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return AdsCard(
                    width: 265.w,
                    isSaved: true,
                    textColor: Colors.white,
                    colorType: const Color(0xffFD8435),
                    adsType: 'Takaslıyor',
                    address: 'Kadıköy / İstanbul',
                    productName: 'Makyaj Malzemesi',
                    date: '21/10/2023',
                    userName: 'user123456',
                    productImage: 'assets/images/demoo.png',
                    saveButtonOnTap: () {},
                    seeAdsDetailOnTap: () {},
                  );
                },
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
