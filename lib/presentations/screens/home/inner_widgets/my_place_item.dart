import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360ict_flutter_task/presentations/widgets/slight_overlapping_image.dart';
import 'package:m360ict_flutter_task/presentations/widgets/value_and_percentage_widgets.dart';
import 'package:m360ict_flutter_task/utils/app_colors.dart';

class MyPlaceItem extends StatelessWidget {
  final String placeName;
  final String placeTag;
  final String placeValue;
  final String placeValuePercentage;
  final List<String> placeImages;
  final int totalImageCount;
  final double totalWidth;
  final VoidCallback onTap;

  const MyPlaceItem({
    super.key,
    required this.placeName,
    required this.placeTag,
    required this.placeValue,
    required this.placeValuePercentage,
    required this.placeImages,
    required this.totalImageCount,
    required this.totalWidth,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        color: AppColors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    placeName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryText,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      placeTag,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueAndPercentageWidgets(
                    placeValue: placeValue,
                    placeValuePercentage: placeValuePercentage,
                    placeValueUnit: "ppm",
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SlightOverlappingImage(
                        imageUrls: placeImages,
                        height: 40.h,
                        totalWidth: totalWidth,
                        totalImageCount: totalImageCount,
                      ),
                      Row(
                        children: [
                          Text(
                            "View Details",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                          Icon(
                            Icons.play_arrow,
                            color: AppColors.primary,
                            size: 15.sp,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
