import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';
import 'package:flutter_study_jam/page/dictionary/widget/content_search.dart';
import 'package:flutter_study_jam/page/dictionary/widget/drawer_widget.dart';
import 'package:flutter_study_jam/page/dictionary/widget/keyword_search.dart';
import 'package:flutter_study_jam/page/dictionary/widget/search_input.dart';

class DictionaryPage extends StatefulWidget {
  DictionaryPage({Key? key}) : super(key: key);

  @override
  _DictionaryPageState createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: AppColors.primaryBuleColor,
        title: Text(
          'Dictionary',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // AppBar(
      //   title: Center(
      //     child: Text(
      //       'Dictionary',
      //       style: TextStyle(color: Colors.black),
      //     ),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: Builder(
      //     builder: (context) => IconButton(
      //       icon: Icon(
      //         Icons.menu,
      //         color: AppColors.primaryBuleColor,
      //       ),
      //       onPressed: () {
      //         Scaffold.of(context).openDrawer();
      //       },
      //     ),
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 28.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.w),
                child: SearchInput(),
              ),
              SizedBox(
                height: 28.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child:
                    KeywordSearch(keyWordSearch: 'Hello', phonetic: '/Heˈloʊ/'),
              ),
              SizedBox(
                height: 38.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: ContentSearch(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
