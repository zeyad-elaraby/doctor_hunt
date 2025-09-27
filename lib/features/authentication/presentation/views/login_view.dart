import 'package:doctor_hunt/core/components/custom_button.dart';
import 'package:doctor_hunt/core/components/custom_text_form_field.dart';
import 'package:doctor_hunt/core/helper/route_manager.dart/routes.dart';
import 'package:doctor_hunt/core/services/validation.dart';
import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:doctor_hunt/core/utils/app_images.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/utils/app_text_styles.dart';
import 'package:doctor_hunt/features/authentication/presentation/widgets/social_login_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesMainBackGround),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              top: 100.h,
              end: 20.h,
              start: 20.w,
              bottom: 46.h,
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(AppStrings.loginTitle, style: AppTextStyles.medium24),
                  SizedBox(height: 8.h),
                  Text(
                    AppStrings.loginDescreption,
                    style: AppTextStyles.regular14.copyWith(
                      color: AppColors.color677294,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 78.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SocialLoginItem(
                        title: AppStrings.google,
                        imagePath: Assets.imagesGoogleIcon,
                        onTap: () {},
                      ),
                      SocialLoginItem(
                        title: AppStrings.facebook,
                        imagePath: Assets.imagesFacebookIcon,
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 37.h),
                  CustomTextField(
                    controller: emailController,
                    hintText: AppStrings.email,
                    validator: validateEmail,
                  ),
                  SizedBox(height: 18.h),
                  CustomTextField(
                    controller: passwordController,
                    hintText: AppStrings.password,
                    validator: validatePassword,
                  ),
                  SizedBox(height: 32.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.bottomNavView,
                            (route) => false,
                          );
                        }
                      },
                      title: AppStrings.login,
                    ),
                  ),
                  SizedBox(height: 19.h),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      AppStrings.forgotPassword,
                      style: AppTextStyles.regular14.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 123.h),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.signUpView);
                    },
                    child: Text(
                      AppStrings.dontHaveAnAccount,
                      style: AppTextStyles.regular14.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
