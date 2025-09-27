import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
class StarRating extends StatelessWidget {
  const StarRating({super.key, required this.rating});
final int rating;
  @override
  Widget build(BuildContext context) {
    return  Row(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(5, (index) {
      return Icon(
        Icons.star,
        size: 15,
        color: index < rating ? AppColors.colorF6D060 : AppColors.colorE2E5EA,
      );
    }),
  );;
  }
}