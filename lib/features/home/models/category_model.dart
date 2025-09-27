import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:doctor_hunt/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  final String iconPath;
  List<Color> grdientColors;

  CategoryModel({required this.grdientColors, required this.iconPath});
}

List<CategoryModel> categories = [
  CategoryModel(
    grdientColors: [AppColors.color2753F3, AppColors.color765AFC],
    iconPath: Assets.imagesTeethIcon,
  ),
  CategoryModel(
    grdientColors: [AppColors.color0EBE7E, AppColors.color07D9AD],
    iconPath: Assets.imagesHeartIcon,
  ),
  CategoryModel(
    grdientColors: [AppColors.colorFD7F43, AppColors.colorFFCF68],
    iconPath: Assets.imagesOpticsIcon,
  ),
  CategoryModel(
    grdientColors: [AppColors.colorFF484C, AppColors.colorFF6C60],
    iconPath: Assets.imagesGeneralHealthIcon,
  ),
];
