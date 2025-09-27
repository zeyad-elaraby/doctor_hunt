import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:doctor_hunt/core/utils/app_images.dart';
import 'package:doctor_hunt/core/utils/app_strings.dart';
import 'package:doctor_hunt/core/utils/app_text_styles.dart';
import 'package:doctor_hunt/features/home/presentation/controller/home_cubit.dart';
import 'package:doctor_hunt/features/home/presentation/controller/home_state.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomNavView extends StatefulWidget {
  int? currentIndex;

  BottomNavView({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView>
    with TickerProviderStateMixin {
  DateTime? lastPressedTime;

  late List<AnimationController> _animationControllers;
  late List<Animation<double>> _scaleAnimations;
  late List<Animation<double>> _rippleAnimations;
  late List<Animation<double>> _glowAnimations;

  @override
  void initState() {
    super.initState();

    _animationControllers = List.generate(
      5,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
      ),
    );

    _scaleAnimations = _animationControllers.map((controller) {
      return Tween<double>(
        begin: 1.0,
        end: 1.4,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));
    }).toList();

    _rippleAnimations = _animationControllers.map((controller) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    }).toList();

    _glowAnimations = _animationControllers.map((controller) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    }).toList();

    if (widget.currentIndex != null) {
      _animationControllers[widget.currentIndex!].forward();
    } else {
      _animationControllers[0].forward();
    }
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handleTabChange(int newIndex, int oldIndex) {
    HapticFeedback.lightImpact();
    _animationControllers[oldIndex].reverse();
    _animationControllers[newIndex].forward();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          // if (cubit.currentIndex == 1 && token == '') {
          //   Future.delayed(Duration.zero, () {
          //     navigateAndRemove(context, UserTypeScreen());
          //   });
          // }
          // if (cubit.currentIndex == 2 && token == '') {
          //   Future.delayed(Duration.zero, () {
          //     navigateAndRemove(context, UserTypeScreen());
          //   });
          // }
          // if (cubit.currentIndex == 3 && token == '') {
          //   Future.delayed(Duration.zero, () {
          //     navigateAndRemove(context, UserTypeScreen());
          //   });
          // }
          if (widget.currentIndex != null) {
            if (widget.currentIndex != cubit.currentIndex) {
              _handleTabChange(widget.currentIndex!, cubit.currentIndex);
            }
            cubit.currentIndex = widget.currentIndex!;
            widget.currentIndex = null;
          }

          return WillPopScope(
            onWillPop: () async {
              final now = DateTime.now();
              bool willPop;
              if (lastPressedTime == null ||
                  now.difference(lastPressedTime!) >
                      const Duration(seconds: 2)) {
                lastPressedTime = now;
                Fluttertoast.showToast(
                  msg: 'Press back again to exit',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
                willPop = false;
              } else {
                willPop = true;
              }
              return willPop;
            },
            child: Scaffold(
              extendBody: true,
              body: AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position:
                          Tween<Offset>(
                            begin: const Offset(0.0, 0.1),
                            end: Offset.zero,
                          ).animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeOutQuint,
                            ),
                          ),
                      child: ScaleTransition(
                        scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOutCubic,
                          ),
                        ),
                        child: child,
                      ),
                    ),
                  );
                },
                child: Container(
                  key: ValueKey<int>(cubit.currentIndex),
                  child: cubit.screen[cubit.currentIndex],
                ),
              ),
              bottomNavigationBar: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutExpo,
                tween: Tween<double>(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, 10 * (1.0 - value)),
                    child: Opacity(opacity: value, child: child),
                  );
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: AppColors.whiteColor,
                          width: 0.1.w,
                        ),
                      ),
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.r),
                        topRight: Radius.circular(32.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.whiteColor,
                          offset: Offset(0, 15),
                          spreadRadius: 0,
                          blurRadius: 90,
                        ),
                      ],
                    ),
                    child: StylishBottomBar(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                      ),
                      elevation: 150,
                      backgroundColor: AppColors.whiteColor,
                      currentIndex: cubit.currentIndex,
                      items: [
                        buildAnimatedBottomBarItem(
                          index: 0,
                          cubit: cubit,
                          imagePath: Assets.imagesHomeBottomNavUnselected,
                          title: "home",
                        ),

                        buildAnimatedBottomBarItem(
                          index: 1,
                          cubit: cubit,
                          imagePath: Assets.imagesFavoriteBottomNavUnselected,
                          title: "favorite",
                        ),

                        buildAnimatedBottomBarItem(
                          index: 2,
                          cubit: cubit,
                          imagePath:
                              Assets.imagesReservationsBottomNavUnselected,
                          title: "reservations",
                        ),

                        buildAnimatedBottomBarItem(
                          index: 3,
                          cubit: cubit,
                          imagePath: Assets.imagesChatBottomNavUnselected,
                          title: "chat",
                        ),
                      ],
                      onTap: (index) {
                        if (index != cubit.currentIndex) {
                          _handleTabChange(index, cubit.currentIndex);
                          cubit.changeBottom(index);
                        }
                      },
                      option: AnimatedBarOptions(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        iconSize: 12.r,
                        iconStyle: IconStyle.Default,
                        opacity: 0.3,
                        barAnimation: BarAnimation.fade,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  BottomBarItem buildAnimatedBottomBarItem({
    required int index,
    required HomeCubit cubit,
    required String imagePath,
    required String title,
  }) {
    bool isSelected = index == cubit.currentIndex;
    return BottomBarItem(
      selectedColor: AppColors.primaryColor,
      unSelectedColor: AppColors.color858EA9,
      backgroundColor: AppColors.whiteColor,
      icon: AnimatedBuilder(
        animation: _scaleAnimations[index],
        builder: (context, child) {
          return Column(
            children: [
              if (isSelected)
                Container(
                  width: 17.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(16.r),
                      bottomStart: Radius.circular(16.r),
                    ),
                  ),
                ),
              if (isSelected)
                AnimatedBuilder(
                  animation: _rippleAnimations[index],
                  builder: (context, _) {
                    return Transform.scale(
                      scale: 0.8 + (_rippleAnimations[index].value * 0.6),
                      child: Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor.withOpacity(
                            0.15 * (1 - _rippleAnimations[index].value),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              // Main icon with bounce animation
              Transform.scale(
                scale: isSelected ? _scaleAnimations[index].value : 1.0,
                child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 300),
                  tween: Tween<double>(begin: 0.0, end: isSelected ? 1.0 : 0.0),
                  builder: (context, value, _) {
                    return Transform.translate(
                      offset: Offset(0, isSelected ? -4.0 * value : 0),
                      child: SvgPicture.asset(
                        imagePath,

                        color: Color.lerp(
                          AppColors.color858EA9,
                          AppColors.primaryColor,
                          isSelected ? value : 0,
                        ),
                        height: 18.h,
                        width: 18.w,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      title: AnimatedBuilder(
        animation: _scaleAnimations[index],
        builder: (context, child) {
          return Padding(
            padding: EdgeInsetsDirectional.only(top: 2.h, bottom: 2.h),
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutCubic,
              tween: Tween<double>(begin: 0.0, end: isSelected ? 1.0 : 0.0),
              builder: (context, value, _) {
                return Transform.translate(
                  offset: Offset(0, isSelected ? -2.0 * value : 0),
                  child: Text(title, style: AppTextStyles.regular12),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
