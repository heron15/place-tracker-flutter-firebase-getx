import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:m360ict_flutter_task/utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.textInputType,
    required this.hintText,
    this.showSuffixIcon = false,
    this.validator,
    this.onChanged,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.obscureText = false,
    this.maxLine = 1,
    this.enabled = true,
    this.floatingLabelBehavior = FloatingLabelBehavior.never,
    this.labelText,
    this.suffixIconPasswordType = false,
    this.suffixOtherIcon = Icons.calendar_month,
    this.suffixOtherIconOnTap,
    this.suffixProgressIndicatorShow = false,
    this.inputFieldTextColor = AppColors.primaryText,
    this.readOnly = false,
    this.borderRadius = 15.0,
    this.border = 2,
    this.focusNode,
  });

  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String hintText;
  final bool showSuffixIcon;
  final String? Function(String? value)? validator;
  final String? Function(String? value)? onChanged;
  final double topPadding;
  final double bottomPadding;
  final bool obscureText;
  final int maxLine;
  final bool enabled;
  final FloatingLabelBehavior floatingLabelBehavior;
  final String? labelText;
  final bool suffixIconPasswordType;
  final IconData suffixOtherIcon;
  final VoidCallback? suffixOtherIconOnTap;
  final bool suffixProgressIndicatorShow;
  final Color inputFieldTextColor;
  final bool readOnly;
  final double borderRadius;
  final double border;
  final FocusNode? focusNode;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = false;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.topPadding, bottom: widget.bottomPadding),
      child: TextFormField(
        onTapOutside: (value) {
          FocusScope.of(context).unfocus();
        },
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
        controller: widget.textEditingController,
        keyboardType: widget.textInputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: AppColors.primary,
        obscureText: _obscureText,
        maxLines: widget.maxLine,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        style: TextStyle(
          fontSize: 16.sp,
          color: widget.inputFieldTextColor,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          errorMaxLines: 2,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: AppColors.grey,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.border,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.border,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.red,
            ),
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.border,
            ),
          ),
          suffixIcon: Visibility(
            visible: widget.showSuffixIcon,
            child: widget.suffixProgressIndicatorShow
                ? Container(
                    width: 20.0.w,
                    height: 30.0.h,
                    margin: EdgeInsets.only(right: 10.w),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: LoadingAnimationWidget.threeArchedCircle(
                        color: AppColors.primary,
                        size: 20.sp,
                      ),
                    ),
                  )
                : IconButton(
                    onPressed: widget.suffixIconPasswordType
                        ? () {
                            setState(
                              () {
                                _obscureText = !_obscureText;
                              },
                            );
                          }
                        : widget.suffixOtherIconOnTap,
                    icon: Icon(
                      widget.suffixIconPasswordType
                          ? _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off
                          : widget.suffixOtherIcon,
                      color: AppColors.grey,
                      size: 22.sp,
                    ),
                  ),
          ),
          floatingLabelBehavior: widget.floatingLabelBehavior,
          labelText: widget.labelText,
          labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.primaryText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
