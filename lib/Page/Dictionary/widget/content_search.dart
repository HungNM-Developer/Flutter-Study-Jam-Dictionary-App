import 'package:flutter/material.dart';
import 'package:flutter_study_jam/page/dictionary/widget/noun.dart';
import 'package:flutter_study_jam/page/dictionary/widget/verb.dart';

class ContentSearch extends StatelessWidget {
  const ContentSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Noun(),
    );
  }
}
