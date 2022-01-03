import 'package:flutter/material.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key, required this.textButton}) : super(key: key);

  final String textButton;

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Container(
        height: 60,
        width: mediaQuery.width,
        decoration: BoxDecoration(
          color: AppColors.primaryBuleColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            textButton,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
