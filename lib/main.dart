// ignore_for_file: lines_longer_than_80_chars

import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/features/ReportAndBlock/viewmodel/report.viewmodel.dart';
import 'package:atma_paylas_app/repositories/arhived_repository.dart';
import 'package:atma_paylas_app/repositories/auth_repository.dart';
import 'package:atma_paylas_app/repositories/block_repository.dart';
import 'package:atma_paylas_app/repositories/category_repository.dart';
import 'package:atma_paylas_app/repositories/city_repository.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:atma_paylas_app/repositories/feedback_repository.dart';
import 'package:atma_paylas_app/repositories/report_repository.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:atma_paylas_app/routing/routing_observer.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
/*   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final messaging = FirebaseMessaging.instance;
  final settings = await messaging.requestPermission();

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
  // Cihaz tokeninin alınması
  final token = await messaging.getToken();

  // Konsola tokenin yazdırılması
  if (kDebugMode) {
    print('Cihaz tokeni: $token');
  } */
  GetIt.I.registerSingleton<CategoryRepository>(CategoryRepository());
  GetIt.I.registerSingleton<AuthRepository>(AuthRepository());
  GetIt.I.registerSingleton<UserRepository>(UserRepository());
  GetIt.I.registerSingleton<CityRepository>(CityRepository());
  GetIt.I.registerSingleton<FeedbackRepository>(FeedbackRepository());
  GetIt.I.registerSingleton<FeedRepository>(FeedRepository());
  GetIt.I.registerSingleton<ArchivedRepository>(ArchivedRepository());
  GetIt.I.registerSingleton<BlockRepository>(BlockRepository());
  GetIt.I.registerSingleton<ReportRepository>(ReportRepository());

  GetIt.I.registerSingleton<ReportViewModel>(ReportViewModel());
  //Sample usage of GetIt

/*   await GetIt.instance<UserRepository>()
      .editUserProfile(
    null,
    null,
    null,
    'Konya',
    'Selçuklu',
  )
      .then((value) {
    value.fold(
      Log.error,
      (r) => Log.success(r, path: 'main'),
    );
  }); */

  EasyLoading.instance
    ..userInteractions = false
    ..dismissOnTap = false;
  /*  const storage = FlutterSecureStorage();
  await storage.write(key: 'access_token', value: 'sadas'); */
  await GetIt.instance<UserRepository>().getMyUserProfile().then((value) {
    value.fold(
      (l) {
        Log.error(l);
        GetIt.instance<UserRepository>().user = null;
      },
      (r) {
        Log.success(r.runtimeType);
        GetIt.instance<UserRepository>().user = r;
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
          routerConfig: route.config(
            navigatorObservers: () => [
              AutoRouteObserver(),
              MyObserver(),
            ],
          ),
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
              seedColor: const Color(AppColors.primaryColor),
            ),
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
