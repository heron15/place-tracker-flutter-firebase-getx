import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:m360ict_flutter_task/presentations/screens/splash/controller/splash_screen_controller.dart';
import 'package:m360ict_flutter_task/presentations/widgets/powered_by_text.dart';
import 'package:m360ict_flutter_task/utils/app_assets.dart';
import 'package:m360ict_flutter_task/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        builder: (controller) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                _appLogo(),
                Spacer(),
                const PoweredByText(),
                SizedBox(height: 30.h),
              ],
            ),
          );
        },
      ),
    );
  }

  ///------App Logo------///
  Widget _appLogo() {
    return Image.asset(
      AppAssets.appIcon,
      width: 200.w,
      height: 200.h,
      fit: BoxFit.fitWidth,
    );
  }
}
