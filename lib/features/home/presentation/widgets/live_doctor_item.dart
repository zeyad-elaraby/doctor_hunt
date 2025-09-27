import 'package:doctor_hunt/core/helper/route_manager.dart/routes.dart';
import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:doctor_hunt/core/utils/app_images.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveDoctorItem extends StatelessWidget {
  const LiveDoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutes.liveView),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.r),
        child: Stack(
          children: [
            Image.asset(
              Assets.imagesLiveDoctor,
              fit: BoxFit.cover,
              width: 116.48.w,
              height: 168.h,
            ),
            Container(
              width: 116.48.w,
              height: 168.h,
              decoration: BoxDecoration(
                color: AppColors.blackColor.withValues(alpha: 0.20),
                // borderRadius: BorderRadius.circular(6.r),
              ),
            ),
            Positioned(
              top: 11.h,
              right: 11.w,
              child: Container(
                alignment: Alignment.center,
                width: 40.32,
                height: 17.92,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF9002F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 5.60,
                      height: 5.60,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(),
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      AppStrings.live,
                      style: AppTextStyles.medium7.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 0,
              child: Icon(
                Icons.play_circle_outline_rounded,
                color: Colors.white,
                size: 30.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
