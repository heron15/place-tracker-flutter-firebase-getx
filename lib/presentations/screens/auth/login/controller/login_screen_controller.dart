import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m360ict_flutter_task/presentations/widgets/toast.dart';
import 'package:m360ict_flutter_task/utils/app_colors.dart';
import 'package:m360ict_flutter_task/utils/auth_controller.dart';

class LoginScreenController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isRememberMe = false;
  bool isLoading = false;

  final AuthController _authController = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
    loadSavedCredentials();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void toggleRememberMe() {
    isRememberMe = !isRememberMe;
    update();
  }

  ///------Load saved credentials------///
  Future<void> loadSavedCredentials() async {
    try {
      final credentials = await _authController.loadSavedCredentials();
      if (credentials['email']!.isNotEmpty && credentials['password']!.isNotEmpty) {
        emailController.text = credentials['email']!;
        passwordController.text = credentials['password']!;
        isRememberMe = true;
        update();
      }
    } catch (e) {
      toastShow(text: "Error loading saved credentials", color: AppColors.red);
    }
  }

  ///------Login------///
  Future<bool> login() async {
    try {
      isLoading = true;
      update();

      final result = await _authController.loginUser(
        email: emailController.text,
        password: passwordController.text,
        rememberMe: isRememberMe,
      );

      isLoading = false;
      update();
      return result;
    } catch (e) {
      isLoading = false;
      update();
      return false;
    }
  }
}
