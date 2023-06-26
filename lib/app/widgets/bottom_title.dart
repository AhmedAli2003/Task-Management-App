import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_app/app/theme/app_colors.dart';
import 'package:task_management_app/app/theme/app_style.dart';
import 'package:task_management_app/app/theme/app_values.dart';
import 'package:task_management_app/app/widgets/height_spacer.dart';
import 'package:task_management_app/app/widgets/reusable_text.dart';
import 'package:task_management_app/app/widgets/width_spacer.dart';

class BottomTitle extends StatelessWidget {
  const BottomTitle({
    super.key,
    required this.text,
    required this.text2,
    this.color,
  });

  final String text;
  final String text2;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppValues.kWidth,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, child) {
                return Container(
                  height: 80,
                  width: 5,
                  decoration: BoxDecoration(
                    //TODO: ADD DYNAMIC COLORS
                    color: AppColors.kGreen,
                    borderRadius: BorderRadius.circular(AppValues.kRadius),
                  ),
                );
              },
            ),
            const WidthSpacer(15),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: text,
                    style: appStyle(
                      size: 24,
                      color: AppColors.kLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const HeightSpacer(10),
                  ReusableText(
                    text: text2,
                    style: appStyle(
                      size: 12,
                      color: AppColors.kLight,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
