import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:m360ict_flutter_task/core/route/app_route.dart';
import 'package:m360ict_flutter_task/presentations/screens/auth/signup/controller/signup_screen_controller.dart';
import 'package:m360ict_flutter_task/presentations/widgets/custom_text_form_field.dart';
import 'package:m360ict_flutter_task/presentations/widgets/powered_by_text.dart';
import 'package:m360ict_flutter_task/presentations/widgets/rich_text_two.dart';
import 'package:m360ict_flutter_task/presentations/widgets/social_login_icon_widget.dart';
import 'package:m360ict_flutter_task/presentations/widgets/success_dialog.dart';
import 'package:m360ict_flutter_task/presentations/widgets/toast.dart';
import 'package:m360ict_flutter_task/utils/app_colors.dart';
import 'package:m360ict_flutter_task/utils/app_strings.dart';
import 'package:m360ict_flutter_task/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m360ict_flutter_task/utils/app_assets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupScreenController _signupScreenState = Get.find<SignupScreenController>();
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
                SizedBox(height: 20.h),
                _buildSignUpButton(),
                SizedBox(height: 25.h),
                _buildOrSignUpWith(),
                SizedBox(height: 25.h),
                _buildSocialSignUpButtons(),
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
      key: _signupScreenState.formKey,
      child: Column(
        children: [
          _buildNameField(),
          SizedBox(height: 10.h),
          _buildPhoneNumberField(),
          SizedBox(height: 10.h),
          _buildEmailField(),
          SizedBox(height: 10.h),
          _buildPasswordField(),
          SizedBox(height: 10.h),
          _buildConfirmPasswordField(),
        ],
      ),
    );
  }

  ///------Name Field Widget------///
  Widget _buildNameField() {
    return CustomTextFormField(
      labelText: AppStrings.name,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      textEditingController: _signupScreenState.nameController,
      textInputType: TextInputType.name,
      hintText: AppStrings.nameHintText,
      validator: (value) {
        return Constants.validatorIsEmpty(value, "Please enter your name");
      },
    );
  }

  ///------Phone Number Field Widget------///
  Widget _buildPhoneNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.phoneNumber,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryText,
          ),
        ),
        SizedBox(height: 8.h),
        GetBuilder<SignupScreenController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: controller.phoneNumberError != null ? AppColors.deepRed : AppColors.border,
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 24.w,
                            height: 16.h,
                            child: SvgPicture.asset(
                              AppAssets.bdFlag,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "+880",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryText,
                            ),
                          ),
                          SizedBox(width: 8.w),
                        ],
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: controller.phoneNumberController,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryText,
                          ),
                          decoration: InputDecoration(
                            hintText: "17XXXXXXX",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: AppColors.grey,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                            errorStyle: const TextStyle(height: 0, color: Colors.transparent),
                          ),
                          onChanged: (value) {
                            if (value.length > 10) {
                              controller.phoneNumberController.text = value.substring(0, 10);
                              controller.phoneNumberController.selection = TextSelection.fromPosition(
                                TextPosition(offset: 10),
                              );
                            }
                            controller.validatePhoneNumber(value);
                          },
                          validator: (_) => null, // We'll handle validation in the controller
                        ),
                      ),
                    ],
                  ),
                ),
                if (controller.phoneNumberError != null)
                  Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: Text(
                      controller.phoneNumberError!,
                      style: TextStyle(
                        color: AppColors.deepRed,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  ///------Confirm Password Field Widget------///
  Widget _buildConfirmPasswordField() {
    return CustomTextFormField(
      labelText: AppStrings.confirmPassword,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      textEditingController: _signupScreenState.confirmPasswordController,
      textInputType: TextInputType.visiblePassword,
      hintText: AppStrings.passwordHintText,
      obscureText: !_signupScreenState.isConfirmPasswordVisible,
      showSuffixIcon: true,
      suffixIconPasswordType: true,
      suffixOtherIconOnTap: _signupScreenState.toggleConfirmPasswordVisibility,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please confirm your password";
        }
        if (value != _signupScreenState.passwordController.text) {
          return "Passwords do not match";
        }
        return null;
      },
    );
  }

  ///------Header Text Widget------///
  Widget _buildHeader() {
    return RichTextTwo(
      firstText: "${AppStrings.signUp}\n",
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
      textEditingController: _signupScreenState.emailController,
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
      textEditingController: _signupScreenState.passwordController,
      textInputType: TextInputType.visiblePassword,
      hintText: AppStrings.passwordHintText,
      obscureText: !_signupScreenState.isPasswordVisible,
      showSuffixIcon: true,
      suffixIconPasswordType: true,
      suffixOtherIconOnTap: _signupScreenState.togglePasswordVisibility,
      validator: (value) {
        return Constants.validatePassword(value);
      },
    );
  }

  ///------Sign Up Button Widget------///
  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      height: 42.h,
      child: GetBuilder<SignupScreenController>(builder: (controller) {
        return ElevatedButton(
          onPressed: controller.isLoading
              ? null
              : () async {
                  controller.validatePhoneNumber(controller.phoneNumberController.text);

                  if (controller.validateForm()) {
                    if (controller.passwordController.text == controller.confirmPasswordController.text) {
                      final bool success = await controller.signUp();

                      if (success) {
                        if (mounted) {
                          showSuccessDialog(
                            context: context,
                            title: "Success!",
                            message: "Your account has been created successfully",
                            buttonText: "OK",
                            onPressed: () {
                              controller.clearAllFields();
                              Get.offAllNamed(AppRoute.loginScreen);
                            },
                          );
                        }
                      } else {
                        toastShow(
                          text: "Account creation failed. Email might already be in use.",
                          color: AppColors.red,
                        );
                      }
                    } else {
                      toastShow(
                        text: "Passwords do not match",
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
                  AppStrings.signUp,
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

  ///------Or Sign Up With Widget------///
  Widget _buildOrSignUpWith() {
    return Center(
      child: Text(
        AppStrings.orSignUpWith,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryText,
        ),
      ),
    );
  }

  ///------Social Sign Up Buttons Widget------///
  Widget _buildSocialSignUpButtons() {
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
        firstText: AppStrings.alreadyHaveAnAccount,
        secondText: AppStrings.signIn,
        firstTextColor: AppColors.secondaryText,
        secondTextColor: AppColors.primary,
        firstTextSize: 12.sp,
        secondTextSize: 14.sp,
        textAlign: TextAlign.center,
        firstTextFontWeight: FontWeight.w400,
        secondTextFontWeight: FontWeight.w700,
        onTap: () => Get.offAllNamed(AppRoute.loginScreen),
      ),
    );
  }
}
