import 'package:doctor_hunt/core/components/custom_button.dart';
import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:doctor_hunt/core/utils/app_images.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindDoctorsCard extends StatefulWidget {
  const FindDoctorsCard({super.key});

  @override
  State<FindDoctorsCard> createState() => _FindDoctorsCardState();
}

bool isFavorite = false;

class _FindDoctorsCardState extends State<FindDoctorsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: 18.h,
        bottom: 14.h,
        start: 20.w,
        end: 17.w,
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 20,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Image.asset(
                  Assets.imagesLiveDeoctor2,
                  width: 92.w,
                  height: 87.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Dr. Shruti Kedia", style: AppTextStyles.medium18),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: isFavorite
                              ? Icon(Icons.favorite_border, size: 20.r)
                              : Icon(
                                  Icons.favorite,
                                  color: AppColors.colorFD7F43,
                                  size: 20.r,
                                ),
                        ),
                      ],
                    ),
                    Text(
                      "Tooths Dentist",
                      style: AppTextStyles.regular13.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      "7 Years experience",
                      style: AppTextStyles.light12.copyWith(
                        color: AppColors.color677294,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 12.r,
                              color: AppColors.color0EBE7E,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "87%",
                              style: AppTextStyles.light11.copyWith(
                                color: AppColors.color0EBE7E,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 17.w),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 12.r,
                              color: AppColors.color0EBE7E,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              "69 Patient Stories",
                              style: AppTextStyles.light11.copyWith(
                                color: AppColors.color0EBE7E,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.nextAvailable,
                    style: AppTextStyles.medium13.copyWith(
                      color: AppColors.color0EBE7E,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "12:00 AM tomorrow",
                    style: AppTextStyles.medium13.copyWith(
                      color: AppColors.color677294,
                    ),
                  ),
                ],
              ),
              CustomElevatedButton(
                width: 100.w,
                height: 34.h,
                onPressed: () {},
                title: AppStrings.bookNow,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
