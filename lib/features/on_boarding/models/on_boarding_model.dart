import 'package:doctor_hunt/core/utils/app_images.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';

class OnboardingData {
  final String title;
  final String description;
  final String imagePath;

  OnboardingData({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

final List<OnboardingData> onboardingData = [
  OnboardingData(
    title: AppStrings.onBoarding1Title,
    description: AppStrings.onBoardingDescription,
    imagePath: Assets.imagesOnBoarding1,
  ),
  OnboardingData(
    title: AppStrings.onBoarding2Title,
    description: AppStrings.onBoardingDescription,
    imagePath: Assets.imagesOnBoarding2,
  ),
  OnboardingData(
    title: AppStrings.onBoarding3Title,
    description: AppStrings.onBoardingDescription,
    imagePath: Assets.imagesOnBoarding3,
  ),
];
