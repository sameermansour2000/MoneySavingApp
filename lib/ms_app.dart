import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ms/modules/auth/login.dart';

import 'binding/ms_binding.dart';

class MSApp extends StatelessWidget {
  const MSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:   Size(390, 844),
      minTextAdapt: true,

      // splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      child: GetMaterialApp(
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        theme: ThemeData(

        ),
        initialBinding: MSBinding(),
        debugShowCheckedModeBanner: false,
        title: 'MS money saving',
        // You can use the library anywhere in the app even in theme

        home: Login(),
      ),
    );
  }
}
