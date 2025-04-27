import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:m360ict_flutter_task/core/route/app_route.dart';
import 'package:m360ict_flutter_task/presentations/screens/auth/login/controller/login_screen_controller.dart';
import 'package:m360ict_flutter_task/presentations/widgets/custom_text_form_field.dart';
import 'package:m360ict_flutter_task/presentations/widgets/powered_by_text.dart';
import 'package:m360ict_flutter_task/presentations/widgets/rich_text_two.dart';
import 'package:m360ict_flutter_task/presentations/widgets/social_login_icon_widget.dart';
import 'package:m360ict_flutter_task/presentations/widgets/toast.dart';
import 'package:m360ict_flutter_task/utils/app_colors.dart';
import 'package:m360ict_flutter_task/utils/app_strings.dart';
import 'package:m360ict_flutter_task/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginScreenController _loginScreenController = Get.find<LoginScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                _buildHeader(),
                SizedBox(height: 60.h),
                _formPart(),
                SizedBox(height: 10.h),
                _buildRememberMeAndForgotPassword(),
                SizedBox(height: 20.h),
                _buildSignInButton(),
                SizedBox(height: 25.h),
                _buildOrSignInWith(),
                SizedBox(height: 25.h),
                _buildSocialSignInButtons(),
                SizedBox(height: 40.h),
                _buildDontHaveAccount(),
                SizedBox(height: 50.h),
                PoweredByText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///------Form Part Widget------///
  Widget _formPart() {
    return Form(
      key: _loginScreenController.formKey,
      child: Column(
        children: [
          _buildEmailField(),
          SizedBox(height: 10.h),
          _buildPasswordField(),
        ],
      ),
    );
  }

  ///------Header Text Widget------///
  Widget _buildHeader() {
    return RichTextTwo(
      firstText: "${AppStrings.signIn}\n",
      secondText: AppStrings.letsSaveEnvironmentTogether,
      firstTextColor: AppColors.primaryText,
      secondTextColor: AppColors.primaryText,
      firstTextSize: 30.sp,
      secondTextSize: 14.sp,
      height: 1.7,
      textAlign: TextAlign.left,
      firstTextFontWeight: FontWeight.w500,
      secondTextFontWeight: FontWeight.w400,
    );
  }

  ///------Email Field Widget------///
  Widget _buildEmailField() {
    return CustomTextFormField(
      labelText: AppStrings.email,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      textEditingController: _loginScreenController.emailController,
      textInputType: TextInputType.emailAddress,
      hintText: AppStrings.emailHintText,
      validator: (value) {
        return Constants.validateEmail(value);
      },
    );
  }

  ///------Password Field Widget------///
  Widget _buildPasswordField() {
    return CustomTextFormField(
      labelText: AppStrings.password,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      textEditingController: _loginScreenController.passwordController,
      textInputType: TextInputType.visiblePassword,
      hintText: AppStrings.passwordHintText,
      obscureText: !_loginScreenController.isPasswordVisible,
      showSuffixIcon: true,
      suffixIconPasswordType: true,
      validator: (value) {
        return Constants.validatePassword(value);
      },
    );
  }

  ///------Remember Me and Forgot Password Widget------///
  Widget _buildRememberMeAndForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GetBuilder<LoginScreenController>(
              builder: (controller) {
                return Checkbox(
                  value: controller.isRememberMe,
                  onChanged: (value) => controller.toggleRememberMe(),
                  activeColor: AppColors.primary,
                  side: BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                );
              },
            ),
            Text(
              AppStrings.rememberMe,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryText,
              ),
            ),
          ],
        ),
        GetBuilder<LoginScreenController>(
          builder: (controller) {
            return TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                AppStrings.forgottenPassword,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  ///------Sign In Button Widget------///
  Widget _buildSignInButton() {
    return SizedBox(
      width: double.infinity,
      height: 42.h,
      child: GetBuilder<LoginScreenController>(builder: (controller) {
        return ElevatedButton(
          onPressed: controller.isLoading
              ? null
              : () async {
                  if (controller.formKey.currentState!.validate()) {
                    final bool success = await controller.login();

                    if (success) {
                      Get.offAllNamed(AppRoute.homeScreen);
                    } else {
                      toastShow(
                        text: "Invalid email or password",
                        color: AppColors.red,
                      );
                    }
                  }
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.r),
            ),
            elevation: 0,
          ),
          child: controller.isLoading
              ? SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.white,
                  ),
                )
              : Text(
                  AppStrings.signIn,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
        );
      }),
    );
  }

  ///------Or Sign In With Widget------///
  Widget _buildOrSignInWith() {
    return Center(
      child: Text(
        AppStrings.orSignInWith,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryText,
        ),
      ),
    );
  }

  ///------Social Sign In Buttons Widget------///
  Widget _buildSocialSignInButtons() {
    return SocialLoginIconWidget(
      onGoogleTap: () {},
      onFacebookTap: () {},
      onMicrosoftTap: () {},
      onAppleTap: () {},
    );
  }

  ///------Dont Have Account Widget------///
  Widget _buildDontHaveAccount() {
    return Center(
      child: RichTextTwo(
        firstText: AppStrings.dontHaveAnAccount,
        secondText: AppStrings.signUp,
        firstTextColor: AppColors.secondaryText,
        secondTextColor: AppColors.primary,
        firstTextSize: 12.sp,
        secondTextSize: 14.sp,
        textAlign: TextAlign.center,
        firstTextFontWeight: FontWeight.w400,
        secondTextFontWeight: FontWeight.w700,
        onTap: () => Get.toNamed(AppRoute.signupScreen),
      ),
    );
  }
}
