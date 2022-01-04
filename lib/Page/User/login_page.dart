import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';
import 'package:flutter_study_jam/page/user/widget/auth_button.dart';
import 'package:flutter_study_jam/page/user/widget/social_auth_button.dart';
import 'package:flutter_study_jam/page/user/widget/textfield_input.dart';
import 'package:flutter_study_jam/page/user/widget/title_heading.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    FocusNode focusNode = FocusNode(); //focus keyboard

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 84.h),
            // padding: EdgeInsets.only(
            //   top: mediaQuery.width * 0.15,
            //   bottom: mediaQuery.width * 0.12,
            // ),
            child: Column(
              children: [
                TitleHeading(
                  title: 'Welcome back',
                  subtitle:
                      'Sign in with your email and password \nor continue with social media',
                ),
                SizedBox(
                  height: 100.h,
                  // height: mediaQuery.width * 0.23,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  // padding: EdgeInsets.only(
                  //   left: mediaQuery.width * 0.05,
                  //   right: mediaQuery.width * 0.05,
                  // ),
                  child: const TextFieldInput(
                    forgotPassword: 'Forgot password',
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
                  child: const AuthButton(
                    textButton: 'Sign in',
                  ),
                ),
                SizedBox(
                  // height: mediaQuery.width * 0.16,
                  height: 85.h,
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
                        Navigator.pushNamed(context, "RegisterPage");
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
    );
  }
}
