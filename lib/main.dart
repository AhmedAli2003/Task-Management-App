import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_app/app/theme/app_colors.dart';
import 'package:task_management_app/modules/todo/pages/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 825),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Task Management App',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.kBkDark,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kBkDark),
            useMaterial3: true,
          ),
          themeMode: ThemeMode.dark,
          home: const HomePage(),
        );
      },
    );
  }
}
