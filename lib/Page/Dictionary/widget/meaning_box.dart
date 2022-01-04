import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';

class MeaningBox extends StatelessWidget {
  const MeaningBox({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            index.toString() + '. ',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Flexible(
            child: Column(
              children: [
                Text(
                  "an institution for educating children. ",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "'an institution for educating children. '",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.hintTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
