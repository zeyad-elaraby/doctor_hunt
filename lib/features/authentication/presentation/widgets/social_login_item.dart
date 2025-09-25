import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:doctor_hunt/core/utils/app_images.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginItem extends StatelessWidget {
  const SocialLoginItem({
    super.key,
    required this.title,
    required this.imagePath,
  });
  final String title;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 17.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 15.r,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
     
      child: Row(
        children: [
          SvgPicture.asset(imagePath),
          SizedBox(width: 12.w),
          Text(
            title,
            style: AppTextStyles.light16.copyWith(color: AppColors.color677294),
          ),
        ],
      ),
    );
  }
}
