import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:m360ict_flutter_task/utils/app_colors.dart';

class SlightOverlappingImage extends StatelessWidget {
  final List<String> imageUrls;
  final double height;
  final double totalWidth;
  final double singleImageWidth;
  final double imageRadius;
  final int totalImageCount;
  const SlightOverlappingImage({
    super.key,
    required this.imageUrls,
    required this.height,
    required this.totalWidth,
    this.singleImageWidth = 20,
    this.imageRadius = 22,
    required this.totalImageCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: totalWidth,
      height: height,
      child: Stack(
        alignment: Alignment.centerRight,
        children: List.generate(imageUrls.length + 1, (index) {
          if (index < imageUrls.length) {
            return Positioned(
              right: (imageUrls.length - index) * singleImageWidth.w,
              child: CircleAvatar(
                radius: imageRadius,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: imageRadius - 2,
                  child: CachedNetworkImage(
                    imageUrl: imageUrls[index],
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      radius: imageRadius - 2,
                      backgroundImage: imageProvider,
                    ),
                    placeholder: (context, url) => LoadingAnimationWidget.hexagonDots(
                      color: AppColors.primary,
                      size: 20.sp,
                    ),
                    errorWidget: (context, error, stackTrace) => const Icon(Icons.person),
                  ),
                ),
              ),
            );
          } else {
            return Positioned(
              right: 0,
              child: CircleAvatar(
                radius: imageRadius,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: imageRadius - 2,
                  backgroundColor: Colors.grey,
                  child: Text(
                    '+$totalImageCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
