import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';
import 'package:flutter_study_jam/config/themes/app_text_styles.dart';

class KeywordSearch extends StatelessWidget {
  const KeywordSearch(
      {Key? key, required this.keyWordSearch, required this.phonetic})
      : super(key: key);
  final String keyWordSearch;
  final String phonetic;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 55.sp,
            height: 55.sp,
            //padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.borderLineColor,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/volume-2.png',
              //height: 45,
            ),
          ),
        ),
        SizedBox(width: 20.w),
        Column(
          children: [
            Text(
              keyWordSearch,
              style: AppTextStyles.h1,
            ),
            SizedBox(height: 8.h),
            Text(
              phonetic,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryBuleColor,
              ),
            )
          ],
        ),
      ],
    );
  }
}
