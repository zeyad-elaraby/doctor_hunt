import 'package:doctor_hunt/core/components/custom_back_button.dart';
import 'package:doctor_hunt/core/components/custom_button.dart';
import 'package:doctor_hunt/core/components/custom_text_form_field.dart';
import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:doctor_hunt/core/utils/app_images.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/utils/app_text_styles.dart';
import 'package:doctor_hunt/features/find_doctors/presentation/widgets/find_doctors_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindDoctorsView extends StatelessWidget {
  const FindDoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(Assets.imagesMainBackGround),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              top: 9.h,
              start: 20.w,
              end: 20.w,
              bottom: 20.h,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomBackButton(),
                    SizedBox(width: 19.w),
                    Text("Find Doctors", style: AppTextStyles.regular18),
                  ],
                ),
                SizedBox(height: 34.h),
                CustomTextField(
                  borderColor: AppColors.transparentColor,
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
                SizedBox(height: 24.h),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => FindDoctorsCard(),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10.h),
                    itemCount: 10,
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
