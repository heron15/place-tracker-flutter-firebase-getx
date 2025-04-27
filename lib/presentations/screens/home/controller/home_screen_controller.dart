import 'package:get/get.dart';
import 'package:m360ict_flutter_task/utils/auth_controller.dart';

class HomeScreenController extends GetxController {
  final List<String> imageUrl01 = [
    'https://randomuser.me/api/portraits/men/1.jpg',
    'https://randomuser.me/api/portraits/men/2.jpg',
    'https://randomuser.me/api/portraits/women/3.jpg',
  ];

  final List<String> imageUrls02 = [
    'https://randomuser.me/api/portraits/men/4.jpg',
    'https://randomuser.me/api/portraits/men/5.jpg',
    'https://randomuser.me/api/portraits/women/6.jpg',
    'https://randomuser.me/api/portraits/women/7.jpg',
  ];

  final AuthController _authController = Get.find<AuthController>();

  Future<void> logout() async {
    await _authController.logout();
  }
}
