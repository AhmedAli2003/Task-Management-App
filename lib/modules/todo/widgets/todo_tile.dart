import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_management_app/app/theme/app_colors.dart';
import 'package:task_management_app/app/theme/app_style.dart';
import 'package:task_management_app/app/theme/app_values.dart';
import 'package:task_management_app/app/widgets/height_spacer.dart';
import 'package:task_management_app/app/widgets/reusable_text.dart';
import 'package:task_management_app/app/widgets/width_spacer.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    this.start,
    this.end,
    this.color,
    this.title,
    this.description,
    this.editWidget,
    this.switcher,
    this.delete,
  });

  final String? start;
  final String? end;
  final Color? color;
  final String? title;
  final String? description;
  final Widget? editWidget;
  final Widget? switcher;
  final void Function()? delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            width: AppValues.kWidth,
            decoration: BoxDecoration(
              color: AppColors.kGreyLight,
              borderRadius: BorderRadius.circular(AppValues.kRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 80,
                  width: 5,
                  decoration: BoxDecoration(
                    color: color ?? AppColors.kRed,
                    borderRadius: BorderRadius.circular(AppValues.kRadius),
                  ),
                ),
                const WidthSpacer(15),
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: SizedBox(
                    width: AppValues.kWidth * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: title ?? "Title",
                          style: appStyle(
                            size: 18,
                            color: AppColors.kLight,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const HeightSpacer(3),
                        ReusableText(
                          text: description ?? "",
                          style: appStyle(
                            size: 12,
                            color: AppColors.kLight,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const HeightSpacer(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: AppValues.kWidth * 0.3,
                              height: 25.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.kBkDark,
                                border: Border.all(
                                  width: 0.3,
                                  color: AppColors.kGreyBk,
                                ),
                                borderRadius: BorderRadius.circular(AppValues.kRadius),
                              ),
                              child: ReusableText(
                                text: "$start | $end",
                                style: appStyle(
                                  size: 12,
                                  color: AppColors.kLight,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            const WidthSpacer(20),
                            Row(
                              children: [
                                SizedBox(child: editWidget),
                                const WidthSpacer(20),
                                GestureDetector(
                                  onTap: delete,
                                  child: const Icon(MaterialCommunityIcons.delete_circle),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                switcher ?? const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
