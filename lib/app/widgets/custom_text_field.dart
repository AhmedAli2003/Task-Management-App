import 'package:flutter/material.dart';
import 'package:task_management_app/app/theme/app_colors.dart';
import 'package:task_management_app/app/theme/app_style.dart';
import 'package:task_management_app/app/theme/app_values.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.hintStyle,
    this.onChanged,
    required this.hintText,
    required this.controller,
  });

  final TextInputType? keyboardType;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppValues.kWidth * 0.9,
      decoration: BoxDecoration(
        color: AppColors.kLight,
        borderRadius: BorderRadius.circular(AppValues.kRadius),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        cursorHeight: 25,
        onChanged: onChanged,
        style: appStyle(
          size: 18,
          color: AppColors.kGreyBk,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintStyle: hintStyle,
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: AppColors.kRed,
              width: 0.5,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0.5,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: AppColors.kRed,
              width: 0.5,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: AppColors.kGreyBk,
              width: 0.5,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: AppColors.kBkDark,
              width: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
