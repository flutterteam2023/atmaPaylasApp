import 'package:atma_paylas_app/gen/assets.gen.dart';
import 'package:atma_paylas_app/repositories/auth_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
@RoutePage()
class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Ayarlar',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontFamily: 'Rubik'
        ),
        ),
        
      
      
      ),
      body: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    context.pushRoute(PasswordChangeRoute());
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
                            'Şifre Değiştir',
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
                    context.pushRoute(ChangeLocationRoute());
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
                            'Konum Değiştir',
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
                            'Hesabımı Sil',
                            style: GoogleFonts.rubik(
                              color: const Color(0xffB8372F),
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
                
                
              ],
            ),
          ),
    );
  }
}
