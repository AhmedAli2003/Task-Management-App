import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/app/theme/app_colors.dart';
import 'package:task_management_app/app/theme/app_style.dart';
import 'package:task_management_app/app/theme/app_values.dart';
import 'package:task_management_app/app/widgets/reusable_text.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppValues.kHeight,
      width: AppValues.kWidth,
      color: AppColors.kBkDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset(
              "assets/images/todo.png",
            ),
          ),
          const SizedBox(height: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableText(
                text: "ToDo with Riverpod",
                style: appStyle(
                    size: 30,
                    color: AppColors.kLight,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  "Welcome!! Do you want to create a task fast and with ease",
                  textAlign: TextAlign.center,
                  style: appStyle(
                    size: 16,
                    color: AppColors.kGreyLight,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
