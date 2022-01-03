import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';

class TextFieldInput extends StatefulWidget {
  const TextFieldInput({Key? key, required this.forgotPassword})
      : super(key: key);

  final String forgotPassword;

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  final emailController = TextEditingController();
  String password = '';
  bool isPasswordVisible = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          // padding: EdgeInsets.all(mediaQuery.width * 0.02),
          //padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 23.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.borderLineColor),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 15.0,
                offset: Offset(0, 6.0),
              ),
            ],
          ),
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: InputBorder.none,
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(8.r),
              //   borderSide: BorderSide(color: Colors.transparent, width: 0),
              // ),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(8.r),
              //   borderSide: BorderSide(color: Colors.transparent, width: 0),
              // ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 27.w, vertical: 26.h),
              hintText: 'Enter your email',
              hintStyle: TextStyle(
                color: AppColors.hintTextColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Image.asset('assets/images/user.png'),
              suffixIcon: emailController.text.isEmpty
                  ? Container(width: 0)
                  : IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        emailController.clear();
                      },
                    ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Container(
          //padding: EdgeInsets.all(8.0),
          //padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 23.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.borderLineColor),
            boxShadow: [
              const BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 15.0,
                offset: Offset(0, 6.0),
              ),
            ],
          ),
          child: TextField(
            //controller: emailController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 27.w, vertical: 26.h),
              hintText: 'Enter your password',
              hintStyle: TextStyle(
                color: AppColors.hintTextColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Image.asset('assets/images/lock.png'),
              suffixIcon: isPasswordVisible
                  ? InkWell(
                      child: Image.asset('assets/images/eye-off.png'),
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    )
                  : InkWell(
                      child: Image.asset('assets/images/eye.png'),
                      onTap: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
            obscureText: isPasswordVisible,
          ),
        ),
        SizedBox(height: 18.h),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            widget.forgotPassword,
            style: TextStyle(
              color: AppColors.hintTextColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
