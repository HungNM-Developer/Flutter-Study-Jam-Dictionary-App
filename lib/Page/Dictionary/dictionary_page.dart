import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';
import 'package:flutter_study_jam/page/dictionary/widget/content_search.dart';
import 'package:flutter_study_jam/page/dictionary/widget/drawer_widget.dart';
import 'package:flutter_study_jam/page/dictionary/widget/keyword_search.dart';
import 'package:flutter_study_jam/page/dictionary/widget/search_input.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({Key? key}) : super(key: key);

  @override
  _DictionaryPageState createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  late User loggedinUser;
  User? user = FirebaseAuth.instance.currentUser;
  final _auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    getCurrentUser();
  }

  //using this function you can use the credentials of the user
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  // void logout() {
  //   _auth.signOut();
  //   Navigator.pop(context);
  //   //Navigator.pushNamed(context, "LoginPage");
  // }

  // the logout function
  void logout() async {
    await FirebaseAuth.instance.signOut();
    //Navigator.pop(context);
    Navigator.pushReplacementNamed(context, "LoginPage");
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    DateTime _lastExitTime = DateTime.now();
    return WillPopScope(
      onWillPop: () async {
        if (DateTime.now().difference(_lastExitTime) >= Duration(seconds: 2)) {
          //showing message to user
          final snack = SnackBar(
            content: Text("Press the back button again to exist the app"),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
          _lastExitTime = DateTime.now();
          return false; // disable back press
        } else {
          return true; //  exit the app
        }
      },
      child: Scaffold(
        drawer: DrawerWidget(
          email: user!.email.toString(),
          //logout:,
          //logout: logout,
        ),
        appBar: AppBar(
          backgroundColor: AppColors.primaryBuleColor,
          title: Text(
            //user!.email.toString(),
            'Dictionary',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
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
                  child: const KeywordSearch(
                      keyWordSearch: 'Hello', phonetic: '/Heˈloʊ/'),
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
      ),
    );
  }
}
