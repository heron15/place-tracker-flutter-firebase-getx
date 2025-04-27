import 'package:get/get.dart';
import 'package:m360ict_flutter_task/presentations/screens/auth/login/login_screen.dart';
import 'package:m360ict_flutter_task/presentations/screens/auth/signup/signup_screen.dart';
import 'package:m360ict_flutter_task/presentations/screens/details/details_screen.dart';
import 'package:m360ict_flutter_task/presentations/screens/home/home_screen.dart';
import 'package:m360ict_flutter_task/presentations/screens/splash/splash_screen.dart';

class AppRoute {
  static const String splashScreen = "/splash_screen";
  static const String loginScreen = "/login_screen";
  static const String signupScreen = "/signup_screen";
  static const String homeScreen = "/home_screen";
  static const String detailsScreen = "/details_screen";

  static List<GetPage> route = [
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: signupScreen, page: () => const SignupScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(
      name: detailsScreen,
      page: () => DetailsScreen(
        placeName: Get.parameters["placeName"] ?? "",
        placeTag: Get.parameters["placeTag"] ?? "",
        placeValue: Get.parameters["placeValue"] ?? "",
        placeValuePercentage: Get.parameters["placeValuePercentage"] ?? "",
      ),
    ),
  ];
}
