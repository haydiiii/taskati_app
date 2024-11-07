import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati_app/core/utils/app_colors.dart';
import 'package:taskati_app/features/add_task/views/add_task_view.dart';
import 'package:taskati_app/features/profile/presentation/views/profile_view.dart';
import 'package:taskati_app/features/splash/views/splash_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(1080, 2220),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
                inputDecorationTheme: InputDecorationTheme(
                  contentPadding: EdgeInsets.all(10.r),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.red,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.red,
                    ),
                  ),
                ),
                dividerTheme: DividerThemeData(
                    color: AppColors.primary, indent: 20, endIndent: 20)),
            debugShowCheckedModeBanner: false,
            home: AddTaskView(),
          );
        });
  }
}
