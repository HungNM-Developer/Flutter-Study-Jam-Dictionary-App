import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';
import 'package:flutter_study_jam/page/user/widget/auth_button.dart';
import 'package:flutter_study_jam/page/user/widget/social_auth_button.dart';
import 'package:flutter_study_jam/page/user/widget/textfield_input.dart';
import 'package:flutter_study_jam/page/user/widget/title_heading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;
  String? errorMessage;

  Future<void> signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then(
              (value) => {
                Fluttertoast.showToast(msg: "Account created successfully"),
                Navigator.pushReplacementNamed(context, "DictionaryPage"),
              },
            )
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
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
                    title: 'Register Account',
                    subtitle:
                        'Complete your details or continue \nwith social media',
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: TextFieldInput(
                      forgotPassword: '',
                      // email: email.toString(),
                      // password: password.toString(),
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                  ),
                  SizedBox(
                    // height: mediaQuery.width * 0.1,
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    // padding: EdgeInsets.only(
                    //   left: mediaQuery.width * 0.05,
                    //   right: mediaQuery.width * 0.05,
                    // ),
                    child: AuthButton(
                      textButton: 'Sign up',
                      authentication: signUp(
                        emailController.text,
                        passwordController.text,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 85.h,
                    // height: mediaQuery.width * 0.16,
                  ),
                  const SocialAuthButton(),
                  SizedBox(
                    // height: mediaQuery.width * 0.05,
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Had an account?',
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
                            "LoginPage",
                          );
                        },
                        child: Text(
                          'Sign in',
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
