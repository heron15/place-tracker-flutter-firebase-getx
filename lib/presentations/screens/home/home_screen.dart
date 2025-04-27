import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m360ict_flutter_task/core/route/app_route.dart';
import 'package:m360ict_flutter_task/presentations/screens/home/controller/home_screen_controller.dart';
import 'package:m360ict_flutter_task/presentations/screens/home/inner_widgets/my_place_item.dart';
import 'package:m360ict_flutter_task/presentations/widgets/rich_text_two.dart';
import 'package:m360ict_flutter_task/utils/app_assets.dart';
import 'package:m360ict_flutter_task/utils/app_colors.dart';
import 'package:m360ict_flutter_task/utils/app_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: _bodyPart(),
      floatingActionButton: _floatingAddButton(),
    );
  }

  ///------Floating Add Button------///
  Widget _floatingAddButton() {
    return GetBuilder<HomeScreenController>(builder: (controller) {
      return FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => controller.logout(),
        tooltip: 'Logout',
        child: Icon(
          Icons.logout,
          color: AppColors.white,
        ),
      );
    });
  }

  ///------Body Part------///
  Widget _bodyPart() {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topContainer(),
            SizedBox(height: 25.h),
            _myPlacesText(),
            SizedBox(height: 15.h),
            _myPlacesList(),
          ],
        ),
      ),
    );
  }

  ///------My Places List------///
  Widget _myPlacesList() {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return Column(
          children: [
            MyPlaceItem(
              placeName: "Home",
              placeTag: "Good",
              placeValue: "652",
              placeValuePercentage: "13%",
              placeImages: controller.imageUrl01,
              totalWidth: 100.w,
              totalImageCount: 2,
              onTap: () {
                Get.toNamed(
                  AppRoute.detailsScreen,
                  parameters: {
                    "placeName": "Home",
                    "placeTag": "Good",
                    "placeValue": "652",
                    "placeValuePercentage": "13%",
                  },
                );
              },
            ),
            SizedBox(height: 15.h),
            MyPlaceItem(
              placeName: "Office",
              placeTag: "Healthy",
              placeValue: "447",
              placeValuePercentage: "37%",
              placeImages: controller.imageUrls02,
              totalWidth: 130.w,
              totalImageCount: 47,
              onTap: () {
                Get.toNamed(
                  AppRoute.detailsScreen,
                  parameters: {
                    "placeName": "Office",
                    "placeTag": "Healthy",
                    "placeValue": "447",
                    "placeValuePercentage": "37%",
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }

  ///------My Places Text------///
  Widget _myPlacesText() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Text(
        "My Places",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
          color: AppColors.primaryText,
        ),
      ),
    );
  }

  ///------Top Container------///
  Widget _topContainer() {
    return Stack(
      children: [
        _containerShape01(),
        _containerShape02(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topContainerNameAndImagePart(),
            _topContainerSubText(),
          ],
        ),
      ],
    );
  }

  ///------Top Container Sub Text------///
  Widget _topContainerSubText() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "You are in a ",
              style: TextStyle(
                color: AppColors.secondaryText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            TextSpan(
              text: "healthy ",
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextSpan(
              text: "environment",
              style: TextStyle(
                color: AppColors.secondaryText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///------Top Container Name and Image Part------///
  Widget _topContainerNameAndImagePart() {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h, bottom: 15.h),
      child: Row(
        children: [
          RichTextTwo(
            firstText: "${AppStrings.goodMorning}\n",
            secondText: AppStrings.nameHintText,
            firstTextColor: AppColors.secondaryText,
            secondTextColor: AppColors.primaryText,
            firstTextSize: 16.sp,
            secondTextSize: 24.sp,
            textAlign: TextAlign.left,
            firstTextFontWeight: FontWeight.w300,
            secondTextFontWeight: FontWeight.w500,
          ),
          Spacer(),
          Image.asset(
            AppAssets.personAvatar,
            width: 80.w,
            height: 80.h,
            fit: BoxFit.fitWidth,
          )
        ],
      ),
    );
  }

  ///------Container Shape 02------///
  Widget _containerShape02() {
    return Positioned(
      top: 0,
      right: 0,
      child: SvgPicture.asset(
        AppAssets.vectorShape,
        width: 120.w,
        height: 170.h,
        fit: BoxFit.fill,
      ),
    );
  }

  ///------Container Shape 01------///
  Widget _containerShape01() {
    return SvgPicture.asset(
      AppAssets.rectangleShape,
      width: double.maxFinite,
      height: 170.h,
      fit: BoxFit.fill,
    );
  }
}
