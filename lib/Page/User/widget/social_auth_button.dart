import 'package:flutter/material.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 55,
            height: 55,
            padding: EdgeInsets.all(12),
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
        SizedBox(width: 40),
        InkWell(
          onTap: () {},
          child: Container(
            width: 55,
            height: 55,
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
