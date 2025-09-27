// import 'package:doctor_hunt/core/components/custom_chached_netword_image.dart';
// import 'package:doctor_hunt/core/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// class BottomBarItem extends StatelessWidget {
//   final String icon;
//   bool isSelected = true;
//   final bool? isProfileNav;
//   final VoidCallback onPress;
//   final String label;

//   BottomBarItem({
//     Key? key,
//     required this.icon,
//     required this.isSelected,
//     required this.onPress,
//     required this.label,
//     this.isProfileNav = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsetsDirectional.symmetric(horizontal: 7.w),
//       child: InkWell(
//         radius: 0,
//         onTap: onPress,
//         highlightColor: AppColors.whiteColor,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             if (isSelected)
//               Container(
//                 width: 37.w,
//                 height: 4.h,
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryColor,
//                   borderRadius: BorderRadiusDirectional.only(
//                     bottomEnd: Radius.circular(8.r),
//                     bottomStart: Radius.circular(8.r),
//                   ),
//                 ),
//               ),
//             SizedBox(height: isSelected ? 14.h : 18.h),
//             if (!isProfileNav!)
//               SvgPicture.asset(icon, height: 24.h, width: 24.w),
//             if (isProfileNav!)
//               CustomCashedNetworkImage(
//                 width: 25.w,
//                 height: 25.h,
//                 imageUrl:
//                     'https://img.freepik.com/free-photo/confident-handsome-guy-posing-against-white-wall_176420-32936.jpg?uid=R65749795&ga=GA1.1.1189525653.1699708520&semt=ais_hybrid',
//                 borderRadius: 4,
//               ),
//             SizedBox(height: 7.h),
//             Text(
//               label,
//               style: Theme.of(context).textTheme.labelSmall!
//                   .apply(
//                     fontSizeFactor: 1.sp,
//                     color: isSelected
//                         ? AppColors.primaryColor
//                         : AppColors.color677294,
//                   )
//                   .copyWith(
//                     fontSize: 12.sp,
//                     fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
