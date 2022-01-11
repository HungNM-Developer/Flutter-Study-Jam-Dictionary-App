import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';
import 'package:flutter_study_jam/page/dictionary/dictionary_page.dart';
import 'package:flutter_study_jam/page/user/widget/auth_button.dart';
import 'package:flutter_study_jam/page/user/widget/social_auth_button.dart';
import 'package:flutter_study_jam/page/user/widget/textfield_input.dart';
import 'package:flutter_study_jam/page/user/widget/title_heading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "package:flutter_study_jam/Services/firebase_auth.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //String? email, password;
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? errorMessage;

  // login function
  Future<void> signIn(String email, String password) async {
    //Navigator.pushNamed(context, 'DictionaryPage');
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      try {
        await FirebaseAuthService.signInWithEmailAndPassword(email, password)
            .then(
          (value) => {
            Fluttertoast.showToast(msg: "Login Successful"),
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(
            //     builder: (context) => DictionaryPage(),
            //   ),
            // ),
            Navigator.pushReplacementNamed(context, 'DictionaryPage'),
          },
        );
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    //FocusNode focusNode = FocusNode(); //focus keyboard

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 84.h),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const TitleHeading(
                    title: 'Welcome back',
                    subtitle:
                        'Sign in with your email and password \nor continue with social media',
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: TextFieldInput(
                      forgotPassword: 'Forgot password',
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: AuthButton(
                      textButton: 'Sign in',
                      authentication: signIn(
                        emailController.text,
                        passwordController.text,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 85.h,
                  ),
                  const SocialAuthButton(),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: TextStyle(
                          color: AppColors.hintTextColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: mediaQuery.width * 0.012,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            "RegisterPage",
                          );
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: AppColors.primaryBuleColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
