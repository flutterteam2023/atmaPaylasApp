import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
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
        return MaterialApp.router(
          routerConfig: route.config(),
          routerDelegate: null,
          debugShowCheckedModeBanner: false,
          title: 'Atma Paylaş',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                scrolledUnderElevation: 0,
              ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,),
            useMaterial3: true,
            
          ),
        );
      },
    );
  }
}

