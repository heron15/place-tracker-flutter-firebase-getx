import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:m360ict_flutter_task/presentations/screens/auth/login/controller/login_screen_controller.dart';
import 'package:m360ict_flutter_task/presentations/screens/auth/signup/controller/signup_screen_controller.dart';
import 'package:m360ict_flutter_task/presentations/screens/details/controller/details_screen_controller.dart';
import 'package:m360ict_flutter_task/presentations/screens/home/controller/home_screen_controller.dart';
import 'package:m360ict_flutter_task/presentations/screens/splash/controller/splash_screen_controller.dart';
import 'package:m360ict_flutter_task/utils/auth_controller.dart';

class Dependency extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Logger(), fenix: true);
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => SplashScreenController(), fenix: true);
    Get.lazyPut(() => LoginScreenController(), fenix: true);
    Get.lazyPut(() => SignupScreenController(), fenix: true);
    Get.lazyPut(() => HomeScreenController(), fenix: true);
    Get.lazyPut(() => DetailsScreenController(), fenix: true);
  }
}
