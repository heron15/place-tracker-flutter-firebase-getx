import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:m360ict_flutter_task/presentations/screens/details/controller/details_screen_controller.dart';
import 'package:m360ict_flutter_task/presentations/widgets/gradiant_value_show_container_widgets.dart';
import 'package:m360ict_flutter_task/presentations/widgets/slight_overlapping_image.dart';
import 'package:m360ict_flutter_task/presentations/widgets/value_and_percentage_widgets.dart';
import 'package:m360ict_flutter_task/utils/app_assets.dart';
import 'package:m360ict_flutter_task/utils/app_colors.dart';
import 'package:m360ict_flutter_task/utils/app_strings.dart';

class DetailsScreen extends StatefulWidget {
  final String placeName;
  final String placeTag;
  final String placeValue;
  final String placeValuePercentage;
  const DetailsScreen({
    super.key,
    required this.placeName,
    required this.placeTag,
    required this.placeValue,
    required this.placeValuePercentage,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final List<FlSpot> spots = [
    const FlSpot(0, 2),
    const FlSpot(1, 3.5),
    const FlSpot(2, 5.2),
    const FlSpot(3, 4),
    const FlSpot(4, 4.5),
    const FlSpot(5, 5),
    const FlSpot(6, 1.8),
  ];

  final List<String> monthLabels = [
    'Oct\n24',
    'Nov\n24',
    'Dec\n24',
    'Jan\n25',
    'Feb\n25',
    'Mar\n25',
    'Apr\n25',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  _detailsScreenAppBar(),
                  SizedBox(height: 20.h),
                  _unitAndColorPallet(),
                  SizedBox(height: 20.h),
                  _seeAllText(),
                  SizedBox(height: 20.h),
                  _chartPart(),
                  SizedBox(height: 10.h),
                  _personCard(),
                  SizedBox(height: 10.h),
                  Card(
                    color: AppColors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                AppStrings.persons,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                ),
                              ),
                              Image.asset(
                                AppAssets.leave,
                                width: 55.w,
                                height: 55.h,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                          GradiantValueShowContainerWidgets(
                            title: '',
                            value: "43",
                            subTitle: '',
                            isTitleShow: false,
                            isSubTitleShow: false,
                            valueFontSize: 80,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///------Person card------///
  Widget _personCard() {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.persons,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryText,
                  ),
                ),
                SizedBox(height: 10.h),
                GetBuilder<DetailsScreenController>(
                  builder: (controller) {
                    return SlightOverlappingImage(
                      imageUrls: controller.imageUrls02,
                      height: 40.h,
                      totalWidth: 120.w,
                      totalImageCount: 4,
                    );
                  },
                ),
              ],
            ),
            GradiantValueShowContainerWidgets(
              title: AppStrings.persons,
              value: "5",
              subTitle: "2 of them requires action",
            ),
          ],
        ),
      ),
    );
  }

  ///------Chart part------///
  Widget _chartPart() {
    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) => FlLine(
              color: Colors.greenAccent.withOpacity(0.5),
              strokeWidth: 1,
            ),
            getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.grey.withOpacity(0.2),
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 36.h,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text('Oct\n24', textAlign: TextAlign.center);
                    case 1:
                      return const Text('Nov\n24', textAlign: TextAlign.center);
                    case 2:
                      return const Text('Dec\n24', textAlign: TextAlign.center);
                    case 3:
                      return const Text('Jan\n25', textAlign: TextAlign.center);
                    case 4:
                      return const Text('Feb\n25', textAlign: TextAlign.center);
                    case 5:
                      return const Text('Mar\n25', textAlign: TextAlign.center);
                    case 6:
                      return const Text('Apr\n25', textAlign: TextAlign.center);
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 8,
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 2),
                FlSpot(1, 4),
                FlSpot(2, 6),
                FlSpot(3, 5),
                FlSpot(4, 5.2),
                FlSpot(5, 5.5),
                FlSpot(6, 3),
              ],
              isCurved: true,
              color: Colors.greenAccent,
              barWidth: 2,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                  radius: 4,
                  color: Colors.white,
                  strokeWidth: 2,
                  strokeColor: Colors.greenAccent,
                ),
              ),
              belowBarData: BarAreaData(
                show: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///------See all text------///
  Widget _seeAllText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "History",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryText.withAlpha(150),
          ),
        ),
        Row(
          children: [
            Text(
              "See all",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryText,
              ),
            ),
            SizedBox(width: 4.w),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.secondaryText,
              size: 10.sp,
            ),
          ],
        ),
      ],
    );
  }

  ///------Unit and color pallet------///
  Widget _unitAndColorPallet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ValueAndPercentageWidgets(
          placeValue: widget.placeValue,
          placeValuePercentage: widget.placeValuePercentage,
          placeValueUnit: "ppm",
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_drop_down,
              color: Colors.greenAccent,
              size: 35.sp,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildColorBox(Colors.blueAccent),
                _buildColorBox(Colors.redAccent),
                _buildColorBox(Colors.greenAccent),
                _buildColorBox(Colors.yellowAccent),
                _buildColorBox(Colors.orangeAccent),
              ],
            ),
          ],
        ),
      ],
    );
  }

  ///------Color box------///
  Widget _buildColorBox(Color color) {
    return Container(
      width: 24.w,
      height: 7.h,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      color: color,
    );
  }

  ///------Details screen app bar------///
  Widget _detailsScreenAppBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.secondaryText,
            size: 20.w,
          ),
        ),
        SizedBox(width: 10.w),
        Image.asset(
          AppAssets.homeIcon,
          width: 28.w,
          height: 28.h,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 10.w),
        Text(
          widget.placeName,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w300,
            color: AppColors.primaryText,
          ),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 2.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            widget.placeTag,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
