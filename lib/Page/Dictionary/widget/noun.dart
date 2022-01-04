import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';
import 'package:flutter_study_jam/page/dictionary/widget/meaning_box.dart';

class Noun extends StatelessWidget {
  const Noun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'noun',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 72.w),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Column(
              children: [
                ...[1, 2].map(
                  (e) => MeaningBox(
                    index: e,
                  ),
                ),
                Container(
                  //color: Colors.cyan,
                  height: 50.h,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Similar',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryBuleColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 66.w),
                        child: Container(
                          width: double.infinity,
                          height: 50.h,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ...['Hello', 'Learning', 'Study', 'Home'].map(
                                (e) => Chip(
                                  side: BorderSide(
                                    color: AppColors.searchBarColor,
                                  ),
                                  backgroundColor: Colors.white,
                                  label: Text(
                                    e,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                              ),

                              // Text('hello'),
                              // Text('hello'),
                              // Text('hello'),
                              // Text('hello'),
                              // Text('hello'),
                              // Text('hello'),
                              // Text('hello'),
                              // Text('hello'),
                              // Text('hello'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
