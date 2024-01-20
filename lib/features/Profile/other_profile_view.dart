// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/features/Feed/models/feed_detail_model.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

@RoutePage()
class OtherProfileView extends StatefulWidget {
  FeedDetailModel? feed;
   OtherProfileView({super.key, this.feed});
   
   

  @override
  State<OtherProfileView> createState() => _OtherProfileViewState();
}

class _OtherProfileViewState extends State<OtherProfileView> {
  
  @override
  Widget build(BuildContext context) {
    
    
    return ListenableBuilder(
      listenable: GetIt.instance<UserRepository>(),
      builder: (context, _) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: const Color(AppColors.primaryColor),
            centerTitle: false,
            title: FutureBuilder(
              future: GetIt.instance<UserRepository>().getOtherUserProfile(userId: widget.feed!.ownerInfo.userId!),
              
              builder: (context,snapshot) {

                if (snapshot.hasError) {
                  return Text('Hata');
                  
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  return snapshot.data!.fold((l) => CircularProgressIndicator(), (r) {
                    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text(
                      '${r.name} ${r.surname}',
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${r.userLocatedDistrict} / ${r.userLocatedCity}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                        color: const Color(0xFFC2C2C2),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                );

                  });
                  
                }
                return const Center(child: CircularProgressIndicator());
                
              },
            ),
            leadingWidth: MediaQuery.of(context).size.width / 5,
            actions: [
              // Padding(
              //   padding:  EdgeInsets.only(right: 18.w),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(5.r),
              //       color: Colors.white
              //     ),
              //     child: Padding(
              //       padding:  EdgeInsets.all(8.r),
              //       child: Text('Mesaj Gönder',
              //       style: TextStyle(
              //         fontSize: 12.sp,
              //         color: Color(AppColors.primaryColor),
              //         fontFamily: 'Rubik',
              //         fontWeight: FontWeight.w400,
              //       ),
              //       ),
              //     ),
              //   ),
              // )
            ],
            leading: FutureBuilder(
              future: GetIt.instance<UserRepository>().getOtherUserProfile(userId: widget.feed!.ownerInfo.userId!),
              builder: (context,snapshot) {
                if (snapshot.hasError) {
                  return Text('Hata');
                  
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  return snapshot.data!.fold((l) => CircularProgressIndicator(), (r) {
                    return Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: r.image == null
                        ? null
                        : NetworkImage('${r.image}'),
                    child:r.image != null
                        ? null
                        : const Icon(Icons.person, color: Color(AppColors.primaryColor)),
                  ),
                );

                  });
                  
                }
                return const Center(child: CircularProgressIndicator());
                
              },
            ),
            bottom: PreferredSize(
              preferredSize: Size(
                MediaQuery.of(context).size.width,
                110,
              ),
              child: FutureBuilder(
                future: GetIt.instance<UserRepository>().getOtherUserProfile(userId: widget.feed!.ownerInfo.userId!),
                builder: (context,snapshot) {
                  if (snapshot.hasError) {
                    return Text('Hata');
                    
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    return snapshot.data!.fold((l) => CircularProgressIndicator(), (r){
                      return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '${r.receiverConfirmedTradableListingsCount}',
                                style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Text(
                                'Takaslanan',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 64,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '${r.receiverConfirmedFreeListingsCount}',
                                style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Text(
                                'Ücretsiz',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 64,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '${r.activeListingsCount}',
                                style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Aktif',
                                style: GoogleFonts.rubik(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                      
                    });
                    
                  }
                  return const Center(child: CircularProgressIndicator());
                  
                },
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  DefaultTabController(
                    length: 2,
                    child: FutureBuilder(
                      future: GetIt.instance<UserRepository>().getOtherUserProfile(userId: widget.feed!.ownerInfo.userId!),
                      builder: (context,snapshot) {
                        if (snapshot.hasError) {
                          return Text('Hata');
                          
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasData) {
                          return snapshot.data!.fold((l) => CircularProgressIndicator(), (r) {
                            return Column(
                          children: [
                            const TabBar(tabs: [
                              Tab(text: 'Takaslanan Ürünler'),
                              Tab(text: 'Ücretsiz Paylaşılan'),
                            ]),
                            Container(
                              height: MediaQuery.of(context).size.height - 150.h, //height of TabBarView
                              child: TabBarView(children:[
                                Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.red,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.blue,
                                )
                                
                              ]),
                            )
                          ],
                        );

                          });
                          
                        }
                        return const Center(child: CircularProgressIndicator());
                        
                      },
                    ),
                  ),
                  const Gap(9 * 3),
                  const Text(
                    '2023 © Atma Paylaş',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF858585),
                      fontSize: 12,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  FutureBuilder(
                    future: PackageInfo.fromPlatform(),
                    builder: (context, platform) {
                      return Text(
                        'versiyon: ${platform.data?.version ?? '1.0.0'}+${platform.data?.buildNumber ?? '1'}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    },
                  ),
                  Gap(MediaQuery.of(context).viewPadding.bottom + kBottomNavigationBarHeight + 18 * 3),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
