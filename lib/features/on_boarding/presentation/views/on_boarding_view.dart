import 'package:doctor_hunt/core/helper/route_manager.dart/routes.dart';
import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:doctor_hunt/core/utils/app_images.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/utils/app_text_styles.dart';
import 'package:doctor_hunt/core/components/custom_button.dart';
import 'package:doctor_hunt/features/on_boarding/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingView extends StatefulWidget {
  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesOnBoardingBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return _buildOnboardingPage(onboardingData[index]);
                },
              ),
            ),
            SizedBox(height: 52.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: CustomElevatedButton(
                onPressed: () {
                  if (_currentPage == onboardingData.length - 1) {
                    Navigator.pushNamed(context, AppRoutes.loginView);
                  } else {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                title: AppStrings.getStarted,
              ),
            ),
            SizedBox(height: 14.w),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.loginView);
              },
              child: Text(
                AppStrings.skip,
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.color677294,
                ),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(OnboardingData data) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 60.h, bottom: 65.h),
          child: Image.asset(
            data.imagePath,
            height: 300.h,
            width: 300.w,
            fit: BoxFit.contain,
          ),
        ),
        Text(data.title, style: AppTextStyles.medium28),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            data.description,
            style: AppTextStyles.regular14.copyWith(
              color: AppColors.color677294,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
