import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:doctor_hunt/core/utils/app_images.dart';
import 'package:doctor_hunt/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedDoctorCard extends StatelessWidget {
  const FeaturedDoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: 5.h,
        bottom: 16.h,
        start: 9.w,
        end: 9.w,
      ),
      height: 130.h,
      width: 96.w,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0x14000000),
            blurRadius: 10.r,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(6.r),
      ),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(child: Icon(Icons.favorite_border_outlined, size: 20.r)),
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.colorF6D060, size: 20.r),
                  SizedBox(width: 6.w),
                  Text("4.9", style: AppTextStyles.medium10),
                ],
              ),
            ],
          ),
          SizedBox(height: 8.h),
          CircleAvatar(
            radius: 15.r,
            backgroundImage: AssetImage(Assets.imagesPopularDoctor),
          ),
          SizedBox(height: 10.h),
          Text("Dr. Crick", style: AppTextStyles.medium12),

          Text(
            "\$ 25.00/ hours",
            style: AppTextStyles.light9.copyWith(color: AppColors.color677294),
          ),
        ],
      ),
    );
  }
}
