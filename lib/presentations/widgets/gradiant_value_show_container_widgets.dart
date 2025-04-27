import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360ict_flutter_task/utils/app_colors.dart';

class GradiantValueShowContainerWidgets extends StatelessWidget {
  final String title;
  final String value;
  final String subTitle;
  final bool isTitleShow;
  final bool isSubTitleShow;
  final double valueFontSize;
  const GradiantValueShowContainerWidgets({
    super.key,
    required this.title,
    required this.value,
    required this.subTitle,
    this.isTitleShow = true,
    this.isSubTitleShow = true,
    this.valueFontSize = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 140.w,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(25.r),
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          colors: [
            AppColors.gradientColor01,
            AppColors.gradientColor02,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: isTitleShow,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: valueFontSize.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          Visibility(
            visible: isSubTitleShow,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Text(
                subTitle,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
