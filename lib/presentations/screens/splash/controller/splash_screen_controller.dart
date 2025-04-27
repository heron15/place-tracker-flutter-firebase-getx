import 'package:get/get.dart';
import 'package:m360ict_flutter_task/core/route/app_route.dart';
import 'package:m360ict_flutter_task/utils/auth_controller.dart';

class SplashScreenController extends GetxController {
  final AuthController _authController = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    final isLoggedIn = await _authController.isUserLoggedIn();

    if (isLoggedIn) {
      Get.offAllNamed(AppRoute.homeScreen);
    } else {
      Get.offAllNamed(AppRoute.loginScreen);
    }
  }
}
