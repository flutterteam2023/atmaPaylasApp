import 'package:atma_paylas_app/features/Authentication/presentation/pages/login_view.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'View|Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          initial: true,
         
          
        ),
        
      ];
}