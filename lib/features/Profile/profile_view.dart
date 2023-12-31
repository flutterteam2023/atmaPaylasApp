// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/gen/assets.gen.dart';
import 'package:atma_paylas_app/repositories/auth_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

@RoutePage()
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: GetIt.instance<UserRepository>(),
      builder: (context, widget) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: const Color(AppColors.primaryColor),
            centerTitle: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${GetIt.instance<UserRepository>().user?.name} ${GetIt.instance<UserRepository>().user?.surname}',
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${GetIt.instance<UserRepository>().user?.userLocatedDistrict} / ${GetIt.instance<UserRepository>().user?.userLocatedCity}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rubik(
                    color: const Color(0xFFC2C2C2),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            leadingWidth: MediaQuery.of(context).size.width / 5,
            leading: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: GetIt.instance<UserRepository>().user?.image == null
                    ? null
                    : NetworkImage('${GetIt.instance<UserRepository>().user?.image}'),
                child: GetIt.instance<UserRepository>().user?.image != null
                    ? null
                    : const Icon(Icons.person, color: Color(AppColors.primaryColor)),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size(
                MediaQuery.of(context).size.width,
                110,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            '${GetIt.instance<UserRepository>().user?.nonActiveTradableListingsCount}',
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
                            '${GetIt.instance<UserRepository>().user?.nonActiveFreeListingsCount}',
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
                            '${GetIt.instance<UserRepository>().user?.activeListingsCount}',
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
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Text(
                            'Takaslananlar',
                            style: GoogleFonts.rubik(
                              color: Colors.grey[850],
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 18),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Color(0xFF7B7B7D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(9),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Text(
                            'Ücretsiz Paylaşılanlar',
                            style: GoogleFonts.rubik(
                              color: Colors.grey[850],
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 18),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Color(0xFF7B7B7D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(9),
                InkWell(
                  onTap: () {
                    context.pushRoute(const ProfileEditRoute());
                  },
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Text(
                            'Profili Düzenle',
                            style: GoogleFonts.rubik(
                              color: Colors.grey[850],
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 18),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Color(0xFF7B7B7D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(9),
                InkWell(
                  onTap: () {
                    context.pushRoute(const SettingsRoute());
                  },
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Text(
                            'Ayarlar',
                            style: GoogleFonts.rubik(
                              color: Colors.grey[850],
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 18),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Color(0xFF7B7B7D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(9),
                InkWell(
                  onTap: () {
                    context.pushRoute(const HelpRoute());
                  },
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Text(
                            'Yardım & Destek',
                            style: GoogleFonts.rubik(
                              color: Colors.grey[850],
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 18),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Color(0xFF7B7B7D),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(9 * 3),
                InkWell(
                  onTap: () async {
                    await EasyLoading.show(
                      indicator: const CircularProgressIndicator.adaptive(),
                      status: 'Çıkış Yapılıyor...',
                    );
                    await GetIt.instance<AuthRepository>().logout().then((value) async {
                      await value.fold(
                        (l) async => Fluttertoast.showToast(msg: 'Çıkış Yapılamadı'),
                        (r) async {
                          GetIt.instance<UserRepository>().user = null;
                          await EasyLoading.dismiss();
                          await context.pushRoute(const WelcomeRoute());
                        },
                      );
                    });
                  },
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Text(
                            'Çıkış Yap',
                            style: GoogleFonts.rubik(
                              color: Colors.red[800],
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18),
                          child: SvgPicture.asset(
                            Assets.svg.logOutOutline,
                            color: Colors.red[800],
                            width: 20,
                          ),
                        ),
                      ],
                    ),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
