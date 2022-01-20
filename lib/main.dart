import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/routes/router_name.dart';
import 'package:flutter_study_jam/config/routes/routes.dart';

// Import the generated file
import 'firebase_options.dart';

void main() async {
  /**
   * FlutterFire CLI automatically generates a file named firebase_options.dart
   * which contains the FirebaseOptions class for iOS, Android and Web.
   * See: https://firebase.flutter.dev/docs/overview
   */
  WidgetsFlutterBinding.ensureInitialized();

  // // Initialize Firebase based on current platform
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        initialRoute: Routes.dictionaryPage,
        onGenerateRoute: RouterName.generateRoute,
      ),
      designSize: const Size(414, 896),
    );
  }
}
