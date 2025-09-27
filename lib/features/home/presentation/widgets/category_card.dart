import 'package:doctor_hunt/core/utils/app_images.dart';
import 'package:doctor_hunt/features/home/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 90.h,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: 80.w,
              height: 90.h,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.06, 0.07),
                  end: Alignment(0.92, 1.00),
                  colors: categoryModel.grdientColors,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 39.h,
            child: Container(
              width: 80.w,
              height: 80.h,
              decoration: ShapeDecoration(
                color: Colors.white.withValues(alpha: 0.04),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 46.w,
            top: 0,
            child: Container(
              width: 67.w,
              height: 67.h,
              decoration: ShapeDecoration(
                color: Colors.white.withValues(alpha: 0.06),
                shape: OvalBorder(),
              ),
            ),
          ),
          Center(
            child: SvgPicture.asset(
              categoryModel.iconPath,
              height: 37.3.h,
              width: 33.w,
            ),
          ),
        ],
      ),
    );
  }
}
