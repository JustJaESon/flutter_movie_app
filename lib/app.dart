import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/components/presentation/pages/main_dashboard_page.dart';
import 'package:flutter_movie_app/core/resources/app_theme/app_theme.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (_, child) => MaterialApp(
              theme: getApplicationTheme(),
              debugShowCheckedModeBanner: false,
              home: const MainDashboardPage(),
            ));
  }
}
