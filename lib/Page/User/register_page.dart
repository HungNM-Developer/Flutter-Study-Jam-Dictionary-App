import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';
import 'package:flutter_study_jam/page/user/widget/auth_button.dart';
import 'package:flutter_study_jam/page/user/widget/social_auth_button.dart';
import 'package:flutter_study_jam/page/user/widget/textfield_input.dart';
import 'package:flutter_study_jam/page/user/widget/title_heading.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 102.h),
            // padding: EdgeInsets.only(
            //   top: mediaQuery.width * 0.15,
            //   bottom: mediaQuery.width * 0.12,
            // ),
            child: Column(
              children: [
                const TitleHeading(
                  title: 'Register Account',
                  subtitle:
                      'Complete your details or continue \nwith social media',
                ),
                SizedBox(
                  height: 135.h,
                  // height: mediaQuery.width * 0.23,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.w),
                  // padding: EdgeInsets.only(
                  //   left: mediaQuery.width * 0.05,
                  //   right: mediaQuery.width * 0.05,
                  // ),
                  child: const TextFieldInput(
                    forgotPassword: '',
                  ),
                ),
                SizedBox(
                  // height: mediaQuery.width * 0.1,
                  height: 36.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.w),
                  // padding: EdgeInsets.only(
                  //   left: mediaQuery.width * 0.05,
                  //   right: mediaQuery.width * 0.05,
                  // ),
                  child: const AuthButton(
                    textButton: 'Sign up',
                  ),
                ),
                SizedBox(
                  height: 87.h,
                  // height: mediaQuery.width * 0.16,
                ),
                const SocialAuthButton(),
                SizedBox(
                  // height: mediaQuery.width * 0.05,
                  height: 17.h,
                ),
                Column(
                  children: [
                    Text(
                      'By continuning your confirm that your agree',
                      style: TextStyle(
                        color: AppColors.hintTextColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'with our',
                          style: TextStyle(
                            color: AppColors.hintTextColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: mediaQuery.width * 0.012,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Term and Condition',
                            style: TextStyle(
                              color: AppColors.primaryBuleColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
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
