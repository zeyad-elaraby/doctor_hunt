import 'package:doctor_hunt/core/helper/route_manager.dart/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helper/route_manager.dart/route_generator.dart';

void main() {
  runApp(DoctorHunt());
}

class DoctorHunt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splashView,
        onGenerateRoute: onGenerateRoutes,
      ),
    );
  }
}
