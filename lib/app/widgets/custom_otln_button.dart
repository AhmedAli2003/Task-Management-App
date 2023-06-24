import 'package:flutter/material.dart';
import 'package:task_management_app/app/theme/app_style.dart';
import 'package:task_management_app/app/widgets/reusable_text.dart';

class CustomOtlnButton extends StatelessWidget {
  const CustomOtlnButton({
    super.key,
    this.onTap,
    this.color,
    required this.width,
    required this.height,
    required this.textColor,
    required this.text,
  });

  final double width;
  final double height;
  final Color? color;
  final Color textColor;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(width: 1, color: textColor),
        ),
        child: Center(
          child: ReusableText(
            text: text,
            style: appStyle(
              size: 18,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
