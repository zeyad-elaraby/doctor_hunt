import 'package:doctor_hunt/core/components/star_rating.dart';
import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:doctor_hunt/core/utils/app_images.dart';
import 'package:doctor_hunt/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularDoctorsCard extends StatelessWidget {
  const PopularDoctorsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x14000000),
            blurRadius: 10.r,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      width: 180.w,
      height: 264.h,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                fit: BoxFit.cover,
                Assets.imagesPopularDoctor,

                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 28.w,
              vertical: 15.h,
            ),
            child: Column(
              children: [
                Text("zeyad hassan", style: AppTextStyles.medium18),
                Text("Medicine Specialist", style: AppTextStyles.light12),
                StarRating(rating: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
