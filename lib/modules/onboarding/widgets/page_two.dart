import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/app/theme/app_colors.dart';
import 'package:task_management_app/app/theme/app_values.dart';
import 'package:task_management_app/app/widgets/custom_otln_button.dart';
import 'package:task_management_app/app/widgets/height_spacer.dart';
import 'package:task_management_app/modules/auth/pages/login_page.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppValues.kHeight,
      width: AppValues.kWidth,
      color: AppColors.kBkDark,
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/todo2.png"),
          const HeightSpacer(50),
          CustomOtlnButton(
            width: AppValues.kWidth * 09,
            height: AppValues.kHeight * 0.06,
            textColor: AppColors.kLight,
            text: "Login with a phone number",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
