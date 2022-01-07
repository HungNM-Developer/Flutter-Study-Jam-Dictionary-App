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
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: AppColors.primaryBuleColor,
        title: Text(
          'Dictionary',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: mediaQuery.height,
          width: mediaQuery.width,
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
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 34.w),
                          child: const ContentSearch(
                            attribute: "noun",
                            example:
                                "'an institution for educating children. '",
                            explanation:
                                "an institution for educating children. ",
                          ),
                        );
                      }),
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
