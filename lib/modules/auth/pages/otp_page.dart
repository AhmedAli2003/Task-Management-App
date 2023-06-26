import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/app/theme/app_colors.dart';
import 'package:task_management_app/app/theme/app_style.dart';
import 'package:task_management_app/app/theme/app_values.dart';
import 'package:task_management_app/app/widgets/height_spacer.dart';
import 'package:pinput/pinput.dart';
import 'package:task_management_app/app/widgets/reusable_text.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeightSpacer(AppValues.kHeight * 0.15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset(
                  "assets/images/todo.png",
                  width: AppValues.kWidth * 0.5,
                ),
              ),
              const HeightSpacer(26),
              ReusableText(
                text: "Enter your otp code",
                style: appStyle(
                  size: 18,
                  color: AppColors.kLight,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const HeightSpacer(26),
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted: (value) {
                  print(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
