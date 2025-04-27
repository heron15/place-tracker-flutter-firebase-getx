import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:m360ict_flutter_task/utils/app_assets.dart';

class SocialLoginIconWidget extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onFacebookTap;
  final VoidCallback onMicrosoftTap;
  final VoidCallback onAppleTap;
  const SocialLoginIconWidget({
    super.key,
    required this.onGoogleTap,
    required this.onFacebookTap,
    required this.onMicrosoftTap,
    required this.onAppleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          icon: AppAssets.google,
          onTap: onGoogleTap,
        ),
        _buildSocialButton(
          icon: AppAssets.facebook,
          onTap: onFacebookTap,
        ),
        _buildSocialButton(
          icon: AppAssets.microsoft,
          onTap: onMicrosoftTap,
        ),
        _buildSocialButton(
          icon: AppAssets.apple,
          onTap: onAppleTap,
        ),
      ],
    );
  }

  Widget _buildSocialButton({required String icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        icon,
        width: 26.w,
        height: 26.h,
      ),
    );
  }
}
