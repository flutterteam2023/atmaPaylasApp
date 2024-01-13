// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/common_widgets/show_gallert.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/arhived_repository.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_viewer/image_viewer.dart';

@RoutePage()
class AdsDetailView extends StatefulWidget {
  final int id;
  const AdsDetailView(this.id, {super.key});

  @override
  State<AdsDetailView> createState() => _AdsDetailViewState();
}

class _AdsDetailViewState extends State<AdsDetailView> {
  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('dd/MM/yyyy');

    return FutureBuilder(
      future: GetIt.instance<FeedRepository>().getFeedDetails(widget.id.toString()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 100,
                  ),
                  Text(
                    'Bir hata oluştu',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasData) {
          return snapshot.data!.fold((l) => const SizedBox(), (r) {
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
                  if (r.ownerInfo.username != GetIt.instance<UserRepository>().user?.username)
                    Bounceable(
                      onTap: () async {
                        await GetIt.instance<ArchivedRepository>()
                            .toggleArchiveStatus(feedId: widget.id)
                            .then((value) => setState(() {}));
                      },
                      child: SvgPicture.asset(
                        r.isArchived ? 'assets/svg/bookmark.svg' : 'assets/svg/bookmark-outline.svg',
                        height: 24.r,
                        width: 24.r,
                      ),
                    ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Image.asset('assets/images/line.png'),
                  if (false)
                    SizedBox(
                      width: 16.w,
                    ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Gap(9),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                            const Gap(9),
                            ListTile(
                              onTap: () async {},
                              title: const Text('Şikayet Et'),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                            const Divider(),
                            ListTile(
                              onTap: () {},
                              title: const Text('Profili Gör'),
                              trailing: const Icon(Icons.arrow_forward_ios),
                            ),
                            Gap(MediaQuery.of(context).viewPadding.bottom),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.more_vert),
                  ),
                  if (false)
                    Bounceable(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/svg/share-social-outline.svg',
                        height: 24.r,
                        width: 24.r,
                      ),
                    ),
                  SizedBox(
                    width: 16.w,
                  ),
                ],
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
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          r.image1 ?? "https://cdn-icons-png.flaticon.com/512/1160/1160358.png"),
                                      fit: BoxFit.cover),
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
                            r.description,
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
                                    image: NetworkImage(
                                        r.image1 ?? 'https://cdn-icons-png.flaticon.com/512/1160/1160358.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                                          color: const Color(AppColors.primaryTextColor),
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
                            height: 54.h,
                          ),
                          CustomFilledButton(
                            text: 'Mesaj Gönder',
                            onTap: () async {
                              await const FlutterSecureStorage().read(key: 'access_token').then((value) {
                                if (value != null) {
                                  context.pushRoute(
                                    ChatRoomRoute(
                                      userName: r.ownerInfo.username!,
                                      accessToken: value,
                                      feedId: r.id.toString(),
                                      userId: r.ownerInfo.userId!,
                                    ),
                                  );
                                }
                              });
                            },
                            iconPath: 'mail-outline.svg',
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
