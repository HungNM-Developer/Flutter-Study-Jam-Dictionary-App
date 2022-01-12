import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';
import "package:flutter_study_jam/Services/firebase_auth.dart";

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({Key? key}) : super(key: key);

  void loginWithGoogle(BuildContext context) {
    FirebaseAuthService.signInWithGoogle().then((value) {
      print(value);
      Navigator.pushNamed(context, 'DictionaryPage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            loginWithGoogle(context);
          },
          child: Container(
            width: 55.sp,
            height: 55.sp,
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: AppColors.borderLineColor,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/google.png',
              //height: 35,
            ),
          ),
        ),
        SizedBox(width: 30.w),
        InkWell(
          onTap: () {},
          child: Container(
            width: 55.sp,
            height: 55.sp,
            //padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.borderLineColor,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/phone.png',
              //height: 45,
            ),
          ),
        ),
      ],
    );
  }
}
