import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m360ict_flutter_task/utils/auth_controller.dart';

class SignupScreenController extends GetxController {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isLoading = false;

  String? phoneNumberError;
  final AuthController _authController = Get.find<AuthController>();

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    update();
  }

  void validatePhoneNumber(String value) {
    if (value.isEmpty) {
      phoneNumberError = "Please enter your phone number";
    } else if (!value.startsWith('1')) {
      phoneNumberError = "Phone number must start with 1";
    } else if (value.length != 10) {
      phoneNumberError = "Please enter a valid 10-digit number";
    } else {
      phoneNumberError = null;
    }
    update();
  }

  bool validateForm() {
    if (formKey.currentState?.validate() ?? false) {
      validatePhoneNumber(phoneNumberController.text);
      return phoneNumberError == null;
    }
    return false;
  }

  Future<bool> checkIfUserExists(String email) async {
    return await _authController.checkIfUserExists(email);
  }

  ///------Sign up------///
  Future<bool> signUp() async {
    try {
      isLoading = true;
      update();

      final result = await _authController.registerUser(
        name: nameController.text,
        email: emailController.text,
        phoneNumber: '+880${phoneNumberController.text}',
        password: passwordController.text,
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

  void clearAllFields() {
    nameController.clear();
    phoneNumberController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
