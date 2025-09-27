import 'package:doctor_hunt/core/components/custom_button.dart';
import 'package:doctor_hunt/core/components/custom_text_form_field.dart';
import 'package:doctor_hunt/core/components/star_rating.dart';
import 'package:doctor_hunt/core/helper/route_manager.dart/routes.dart';
import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:doctor_hunt/core/utils/app_images.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/utils/app_text_styles.dart';
import 'package:doctor_hunt/features/home/models/category_model.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/category_card.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/featured_doctor_card.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/live_doctor_item.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/popular_doctors_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesMainBackGround),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 156.h,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(-0.00, 0.05),
                          end: Alignment(0.93, 1.10),
                          colors: [
                            const Color(0xFF0EBE7E),
                            const Color(0xFF07D9AD),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 7.h,
                      left: 20.w,
                      right: 20.w,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 11.h),
                              Text(
                                AppStrings.hiMessage,
                                style: AppTextStyles.light20.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Text(
                                AppStrings.findYourDoctor,
                                style: AppTextStyles.bold25.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                          Image.asset(Assets.imagesClientImage),
                        ],
                      ),
                    ),
                    Positioned(
                      // top: 97.h,
                      bottom: -20.h,
                      left: 20.w,
                      right: 20.w,
                      child: CustomTextField(
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search_rounded,
                            color: AppColors.color677294,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.clear),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 20.w,
                    top: 26.h,
                    bottom: 20.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.liveDoctor,
                        style: AppTextStyles.medium18,
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        height: 170.h,
                        width: double.infinity,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => LiveDoctorItem(),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 14.52.w),
                          itemCount: 10,
                        ),
                      ),
                      SizedBox(height: 47.h),
                      SizedBox(
                        height: 90.h,
                        width: double.infinity,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              CategoryCard(categoryModel: categories[index]
                              ,
                              onTap: () => Navigator.pushNamed(context, AppRoutes.findDoctorsView),
                              ),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 12.w),
                          itemCount: categories.length,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 20.w,
                          vertical: 20.h,
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                AppStrings.seeAll,
                                style: AppTextStyles.light12.copyWith(
                                  color: AppColors.color677294,
                                ),
                              ),
                              SizedBox(width: 1.5.w),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12.sp,
                                color: AppColors.color677294,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 264.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => PopularDoctorsCard(),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 15.w),
                          itemCount: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                          top: 31.h,
                          bottom: 22.h,
                          start: 19.w,
                          end: 20.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.featureDoctor,
                              style: AppTextStyles.medium18,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Text(
                                    AppStrings.seeAll,
                                    style: AppTextStyles.light12.copyWith(
                                      color: AppColors.color677294,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12.sp,
                                    color: AppColors.color677294,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 130.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => FeaturedDoctorCard(),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 15.w),
                          itemCount: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
