import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:m360ict_flutter_task/core/themes/app_theme.dart';

import 'core/dependency/dependency.dart';
import 'core/route/app_route.dart';
import 'utils/app_colors.dart';

class M360ICTaskApp extends StatefulWidget {
  const M360ICTaskApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<M360ICTaskApp> createState() => _M360ICTaskAppState();
}

class _M360ICTaskAppState extends State<M360ICTaskApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, child) {
        return GetMaterialApp(
          navigatorKey: M360ICTaskApp.navigatorKey,
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 300),
          initialRoute: AppRoute.splashScreen,
          getPages: AppRoute.route,
          initialBinding: Dependency(),
          theme: getAppTheme(),
        );
      },
    );
  }
}
