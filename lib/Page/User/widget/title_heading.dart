import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';
import 'package:flutter_study_jam/config/themes/app_text_styles.dart';

class TitleHeading extends StatelessWidget {
  const TitleHeading({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: AppTextStyles.h1),
        Padding(
          padding: EdgeInsets.only(top: 24.h),
          // padding: const EdgeInsets.only(top: 20),
          child: Text(
            subtitle,
            // 'Sign in with your email and password or continue with social media ',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.hintTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
