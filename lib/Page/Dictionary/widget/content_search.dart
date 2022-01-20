import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';
import 'package:flutter_study_jam/page/dictionary/model.dart';
import 'package:flutter_study_jam/page/dictionary/widget/meaning_box.dart';

class ContentSearch extends StatefulWidget {
  const ContentSearch({
    Key? key,
    required this.attribute,
    required this.wordDefinitions,
  }) : super(key: key);
  final String attribute;
  final List<Definitions> wordDefinitions;
  @override
  State<ContentSearch> createState() => _ContentSearchState();
}

class _ContentSearchState extends State<ContentSearch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.attribute,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 41.w, bottom: 43.h),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Column(
              children: [
                ...widget.wordDefinitions.asMap().entries.map(
                      (e) => MeaningBox(
                          index: e.key + 1,
                          example: e.value.example ?? "",
                          explanation: e.value.definition ?? ""),
                    ),
                SizedBox(
                  //color: Colors.cyan,
                  width: MediaQuery.of(context).size.width,
                  height: 45.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: Text(
                          'Similar',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryBuleColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.wordDefinitions[0].synonyms!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 15.w),
                              child: Chip(
                                side: BorderSide(
                                  color: AppColors.searchBarColor,
                                ),
                                backgroundColor: Colors.white,
                                label: Text(
                                  widget.wordDefinitions[0].synonyms![index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        //SizedBox(height: 50.h),
      ],
    );
  }
}
