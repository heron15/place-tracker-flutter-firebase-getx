import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360ict_flutter_task/utils/app_colors.dart';

class ValueAndPercentageWidgets extends StatelessWidget {
  final String placeValue;
  final String placeValuePercentage;
  final String placeValueUnit;

  const ValueAndPercentageWidgets({
    super.key,
    required this.placeValue,
    required this.placeValuePercentage,
    required this.placeValueUnit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          placeValue,
          style: TextStyle(
            fontSize: 48.sp,
            fontWeight: FontWeight.w300,
            color: AppColors.primary,
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.white,
                    size: 17.sp,
                  ),
                  Text(
                    placeValuePercentage,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              placeValueUnit,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                color: AppColors.primary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
