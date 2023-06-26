import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_management_app/app/theme/app_colors.dart';
import 'package:task_management_app/app/theme/app_style.dart';
import 'package:task_management_app/app/theme/app_values.dart';
import 'package:task_management_app/app/widgets/custom_text_field.dart';
import 'package:task_management_app/app/widgets/height_spacer.dart';
import 'package:task_management_app/app/widgets/reusable_text.dart';
import 'package:task_management_app/app/widgets/width_spacer.dart';
import 'package:task_management_app/app/widgets/xpansion_tile.dart';
import 'package:task_management_app/modules/todo/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: "Dashboard",
                      style: appStyle(
                        size: 18,
                        color: AppColors.kLight,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: const BoxDecoration(
                        color: AppColors.kLight,
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.add, color: AppColors.kBkDark),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(26),
              CustomTextField(
                hintText: "Search",
                controller: _searchController,
                prefixIcon: Container(
                  padding: const EdgeInsets.all(14),
                  child: GestureDetector(
                    onTap: null,
                    child: const Icon(Icons.search, color: AppColors.kGreyLight),
                  ),
                ),
                suffixIcon: const Icon(FontAwesome.sliders, color: AppColors.kGreyLight),
              ),
              const HeightSpacer(15),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              const HeightSpacer(25),
              Row(
                children: [
                  const Icon(FontAwesome.tasks, size: 20, color: AppColors.kLight),
                  const WidthSpacer(10),
                  ReusableText(
                    text: "Today's Task",
                    style: appStyle(
                      size: 18,
                      color: AppColors.kLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const HeightSpacer(25),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.kLight,
                  borderRadius: BorderRadius.circular(AppValues.kRadius),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    color: AppColors.kGreyLight,
                    borderRadius: BorderRadius.circular(AppValues.kRadius),
                  ),
                  controller: _tabController,
                  labelPadding: EdgeInsets.zero,
                  isScrollable: false,
                  labelColor: AppColors.kBlueLight,
                  labelStyle: appStyle(
                    size: 24,
                    color: AppColors.kBlueLight,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelColor: AppColors.kLight,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: AppValues.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                            text: "Pending",
                            style: appStyle(
                              size: 16,
                              color: AppColors.kBkDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(left: 30.w),
                        width: AppValues.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                            text: "Completed",
                            style: appStyle(
                              size: 16,
                              color: AppColors.kBkDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(20),
              SizedBox(
                height: AppValues.kHeight * 0.3,
                width: AppValues.kWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppValues.kRadius),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Container(
                        color: AppColors.kBkLight,
                        height: AppValues.kHeight * 0.3,
                        child: ListView(
                          children: [
                            TodoTile(
                              start: "03:00",
                              end: "05:00",
                              switcher: Switch(
                                value: true,
                                onChanged: (val) {},
                              ),
                            ),
                            TodoTile(
                              start: "03:00",
                              end: "05:00",
                              switcher: Switch(
                                value: true,
                                onChanged: (val) {},
                              ),
                            ),
                            TodoTile(
                              start: "03:00",
                              end: "05:00",
                              switcher: Switch(
                                value: true,
                                onChanged: (val) {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: AppColors.kBkLight,
                        height: AppValues.kHeight * 0.3,
                      ),
                    ],
                  ),
                ),
              ),
              const HeightSpacer(20),
              const XpansionTile(
                text: "Tomorrow's Task",
                text2: "Tomorrow's tasks are shown here",
                children: [],
              ),
              const HeightSpacer(20),
              XpansionTile(
                text: DateTime.now().add(const Duration(days: 2)).toIso8601String().substring(5, 10),
                text2: "Tomorrow's tasks are shown here",
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
