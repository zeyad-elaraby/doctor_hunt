import 'package:doctor_hunt/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, required this.isChecked, this.onChanged});
 final bool isChecked;
 final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16.h,
      width: 16.w,
      child: Checkbox(
        splashRadius: 0,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(35.r),
          side: BorderSide(color: AppColors.color677294.withOpacity(0.5)),
        ),
        value: isChecked,
        onChanged:onChanged,
        activeColor: const Color(0xFF0EBE7F),
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith<Color>((
          Set<MaterialState> states,
        ) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.color0EBE7F;
          }
          return AppColors.color677294.withOpacity(0.5);
        }),
      ),
    );
  }
}
