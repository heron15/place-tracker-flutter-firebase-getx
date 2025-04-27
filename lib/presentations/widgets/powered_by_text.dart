import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360ict_flutter_task/presentations/widgets/rich_text_two.dart';
import 'package:m360ict_flutter_task/utils/app_colors.dart';
import 'package:m360ict_flutter_task/utils/app_strings.dart';

class PoweredByText extends StatelessWidget {
  const PoweredByText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichTextTwo(
        firstText: AppStrings.poweredBy,
        secondText: AppStrings.m360ict,
        firstTextColor: AppColors.secondaryText,
        secondTextColor: AppColors.primary,
        firstTextSize: 12.sp,
        secondTextSize: 14.sp,
        firstTextFontWeight: FontWeight.w400,
        secondTextFontWeight: FontWeight.w700,
      ),
    );
  }
}
