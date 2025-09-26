import 'package:doctor_hunt/core/components/custom_button.dart';
import 'package:doctor_hunt/core/components/custom_text_form_field.dart';
import 'package:doctor_hunt/core/helper/route_manager.dart/routes.dart';
import 'package:doctor_hunt/core/services/validation.dart';
import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:doctor_hunt/core/utils/app_images.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/utils/app_text_styles.dart';
import 'package:doctor_hunt/features/authentication/presentation/widgets/custom_check_box.dart';
import 'package:doctor_hunt/features/authentication/presentation/widgets/social_login_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isChecked = false;
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
          physics: BouncingScrollPhysics(),
          padding: EdgeInsetsDirectional.only(
            top: 125.h,
            end: 20.h,
            start: 20.w,
            bottom: 46.h,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(AppStrings.signUpTitle, style: AppTextStyles.medium24),
                SizedBox(height: 8.h),
                Text(
                  AppStrings.signUpDescreption,
                  style: AppTextStyles.regular14.copyWith(
                    color: AppColors.color677294,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 67.h),
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
                SizedBox(height: 34.h),
                CustomTextField(
                  controller: nameController,
                  hintText: AppStrings.name,
                  validator: validateName,
                ),
                SizedBox(height: 18.h),
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
                SizedBox(height: 14.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 0,
                  children: [
                    CustomCheckBox(
                      isChecked: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                    ),
                    SizedBox(width: 11.w),
                    Text(
                      AppStrings.agreeTerms,
                      style: AppTextStyles.regular12.copyWith(
                        color: AppColors.color677294,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 54.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate() && isChecked) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.loginView,
                          (route) => false,
                        );
                      }
                    },
                    title: AppStrings.signUp,
                  ),
                ),
                SizedBox(height: 17.h),
                InkWell(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.loginView,
                    (route) => false,
                  ),
                  child: Text(
                    AppStrings.haveAnAccountLogin,
                    style: AppTextStyles.regular14.copyWith(
                      color: AppColors.color0EBE7F,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
