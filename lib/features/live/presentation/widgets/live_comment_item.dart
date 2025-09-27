import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:doctor_hunt/core/utils/app_images.dart';
import 'package:doctor_hunt/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveCommentItem extends StatelessWidget {
  const LiveCommentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundImage: AssetImage(Assets.imagesClientImage),
        ),
        SizedBox(width: 6.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              " Everhart Tween",
              style: AppTextStyles.medium18.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              "Thanks for shareing doctor",
              style: AppTextStyles.light14.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
