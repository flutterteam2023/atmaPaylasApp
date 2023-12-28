import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/auth_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PackageInfo.fromPlatform();
  EasyLoading.instance
    ..userInteractions = false
    ..dismissOnTap = false;
  /*  const storage = FlutterSecureStorage();
  await storage.write(key: "access_token", value: "value"); */
  await UserRepository().getMyUserProfile().then((value) {
    value.fold(
      (l) {
        Log.error(l);
        UserRepository.user = null;
      },
      (r) {
        Log.success(r.runtimeType);
        UserRepository.user = r;
      },
    );
  });
  /*  const storage = FlutterSecureStorage();
  await storage.read(key: "access_token").then((value) => Log.info(value, path: "mian"));
  await storage.read(key: "refresh_token").then((value) => Log.info(value, path: "mian"));

  await AuthRepository().login('berkeugur67@gmail.com', '123456Berke').then((value) {
    value.fold(
      (l) => Log.error(l),
      (r) => Log.success(r.access),
    );
  });
  await storage.read(key: "access_token").then((value) => Log.info(value, path: "mian"));
  await storage.read(key: "refresh_token").then((value) => Log.info(value, path: "mian")); */
  runApp(const ProviderScope(child: MyApp()));
}

final route = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        final inputDecorationThemeBorderRadius = BorderRadius.circular(8.r);
        return MaterialApp.router(
          builder: EasyLoading.init(builder: FToastBuilder()),
          routerConfig: route.config(),
          routerDelegate: null,
          debugShowCheckedModeBanner: false,
          title: 'Atma Paylaş',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: const Color(0x99EFF0F8),
              focusColor: const Color(0x99EFF0F8),
              hoverColor: const Color(0x99EFF0F8),
              errorMaxLines: 2,
              errorStyle: const TextStyle(color: Color(AppColors.primaryColor)),
              border: const OutlineInputBorder(),
              errorBorder: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderRadius: inputDecorationThemeBorderRadius,
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: inputDecorationThemeBorderRadius,
                borderSide: const BorderSide(color: Color(AppColors.primaryColor)),
              ),
              disabledBorder: const OutlineInputBorder(),
              focusedErrorBorder: const OutlineInputBorder(),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              scrolledUnderElevation: 0,
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
            ),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}