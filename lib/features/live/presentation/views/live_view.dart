import 'package:doctor_hunt/core/components/custom_back_button.dart';
import 'package:doctor_hunt/core/components/custom_text_form_field.dart';
import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:doctor_hunt/core/utils/app_images.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/utils/app_text_styles.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/live_doctor_item.dart';
import 'package:doctor_hunt/features/live/presentation/widgets/live_comment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveView extends StatelessWidget {
  const LiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(Assets.imagesLiveDeoctor2, fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.transparentColor,
                      AppColors.transparentColor,
                      AppColors.blackColor,
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 9.h,
                      start: 20.w,
                      end: 20.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomBackButton(),
                        CircleAvatar(
                          radius: 20.r,
                          backgroundImage: AssetImage(Assets.imagesLiveDoctor),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: ListView.builder(
                            reverse: true,
                            itemBuilder: (context, index) => LiveCommentItem(),
                            itemCount: 10,
                          ),
                        ),
                        SizedBox(height: 35.h),
                        CustomTextField(
                          borderRadius: 27.r,
                          hintText: AppStrings.addComment,
                          prefixIcon: Container(
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              color: AppColors.color0EBE7E,
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(27.r),
                            ),
                            child: Icon(
                              Icons.message_rounded,
                              color: AppColors.whiteColor,
                              size: 20.r,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.emoji_emotions_outlined,
                            color: AppColors.color677294,
                            size: 20.r,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
