import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/Page/Dictionary/services/api_service.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';

class SearchInput extends StatefulWidget {
  SearchInput({Key? key}) : super(key: key);

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.searchBarColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.borderLineColor),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 15.0,
            offset: Offset(0, 6.0),
          ),
        ],
      ),
      child: TextField(
        controller: searchController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.send,
        onEditingComplete: () {
          ApiService.getword(searchController.text);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 27.w, vertical: 26.h),
          hintText: 'Search here',
          hintStyle: TextStyle(
            color: AppColors.hintTextColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Image.asset('assets/images/search.png'),
          suffixIcon: searchController.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    searchController.clear();
                  },
                ),
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
