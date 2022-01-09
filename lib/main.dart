import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/routes/router_name.dart';
import 'package:flutter_study_jam/config/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Something Else',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'GoogleSans',
        ),
        initialRoute: Routes.loginPage,
        onGenerateRoute: RouterName.generateRoute,
      ),
      designSize: const Size(414, 896),
    );
  }
}
