import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomCashedNetworkImage extends StatelessWidget {
  const CustomCashedNetworkImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.circle = false,
    this.borderRadius = 8,
    this.boxFit = BoxFit.fill,
  });

  final double? width;
  final double? height;
  final double? borderRadius;
  final String? imageUrl;
  final bool? circle;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height == null ? null : height!.h,
      width: width == null ? null : width!.w,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: (circle!) ? BoxShape.circle : BoxShape.rectangle,
          borderRadius:
              (circle!) ? null : BorderRadius.circular(borderRadius!.r),
          image: DecorationImage(
            image: imageProvider,
            fit: boxFit,
          ),
        ),
      ),
      imageUrl: imageUrl ??
          "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Color(0xffF1EFEF),
        highlightColor: Color(0xffF9F8F8),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            shape: (circle!) ? BoxShape.circle : BoxShape.rectangle,
            borderRadius:
                (circle!) ? null : BorderRadius.circular(borderRadius!.r),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
          borderRadius:
              (circle!) ? null : BorderRadius.circular(borderRadius!.r),
          shape: (circle!) ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: ClipRRect(
          borderRadius: (circle!)
              ? BorderRadius.circular(360.r)
              : BorderRadius.circular(borderRadius!.r),
          child: Image.network(
            height: height == null ? null : height!.h,
            width: width == null ? null : width!.w,
            fit: boxFit,
            "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          ),
        ),
      ),
      fit: boxFit,
    );
  }
}
