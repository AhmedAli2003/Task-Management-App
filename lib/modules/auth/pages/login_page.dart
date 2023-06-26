import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/app/theme/app_colors.dart';
import 'package:task_management_app/app/theme/app_style.dart';
import 'package:task_management_app/app/theme/app_values.dart';
import 'package:task_management_app/app/widgets/custom_otln_button.dart';
import 'package:task_management_app/app/widgets/custom_text_field.dart';
import 'package:task_management_app/app/widgets/height_spacer.dart';
import 'package:task_management_app/app/widgets/reusable_text.dart';
import 'package:task_management_app/modules/auth/pages/otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _phoneNumberController;

  Country country = Country(
    phoneCode: "1",
    countryCode: "US",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "USA",
    example: "USA",
    displayName: "United States",
    displayNameNoCountryCode: "US",
    e164Key: "",
  );

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Image.asset("assets/images/todo.png", width: 300.w),
                ),
                const HeightSpacer(20),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 16.w),
                  child: ReusableText(
                    text: "Please enter your phone number",
                    style: appStyle(
                      size: 17,
                      color: AppColors.kLight,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const HeightSpacer(20),
                Center(
                  child: CustomTextField(
                    controller: _phoneNumberController,
                    hintText: "Enter phone number",
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            onSelect: (country) => setState(() => this.country = country),
                            countryListTheme: CountryListThemeData(
                              backgroundColor: AppColors.kLight,
                              bottomSheetHeight: AppValues.kHeight * 0.6,
                              borderColor: AppColors.kBkDark,
                              cursorHeight: 25,
                              cursorColor: AppColors.kBkDark,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppValues.kRadius),
                                topRight: Radius.circular(AppValues.kRadius),
                              ),
                              textStyle: appStyle(
                                size: 16,
                                color: AppColors.kBkDark,
                                fontWeight: FontWeight.w500,
                              ),
                              searchTextStyle: appStyle(
                                size: 16,
                                color: AppColors.kBkDark,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                        child: ReusableText(
                          text: "${country.flagEmoji} + ${country.phoneCode}",
                          style: appStyle(
                            size: 18,
                            color: AppColors.kBkDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    hintStyle: appStyle(
                      size: 16,
                      color: AppColors.kGreyDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const HeightSpacer(20),
                CustomOtlnButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const OtpPage(),
                      ),
                    );
                  },
                  width: double.infinity,
                  height: AppValues.kHeight * 0.07,
                  textColor: AppColors.kBkDark,
                  color: AppColors.kLight,
                  text: "Send Code",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
