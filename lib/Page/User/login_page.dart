import 'package:flutter/material.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';
import 'package:flutter_study_jam/config/themes/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    FocusNode focusNode = FocusNode(); //focus keyboard

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 60,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  child: Column(
                    children: [
                      Text('Welcome back', style: AppTextStyles.h1),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Sign in with your email and password or continue with social media ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.hintTextColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 90),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
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
                          focusNode: focusNode,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(
                              color: AppColors.hintTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            prefixIcon: Image.asset('assets/images/user.png'),
                            suffixIcon: emailController.text.isEmpty
                                ? Container(width: 0)
                                : IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      emailController.clear();
                                    },
                                  ),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
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
                          //controller: emailController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(
                              color: AppColors.hintTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            prefixIcon: Image.asset('assets/images/lock.png'),
                            suffixIcon: isPasswordVisible
                                ? InkWell(
                                    child: Image.asset(
                                        'assets/images/eye-off.png'),
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
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          obscureText: isPasswordVisible,
                        ),
                      ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Forgot password',
                          style: TextStyle(
                            color: AppColors.hintTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      InkWell(
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
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
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
                          SizedBox(width: 30),
                          Container(
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
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: TextStyle(
                              color: AppColors.hintTextColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              color: AppColors.primaryBuleColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      // TextField(
                      //   controller: emailController,
                      //   keyboardType: TextInputType.emailAddress,
                      //   textInputAction: TextInputAction.done,
                      //   decoration: InputDecoration(
                      //     hintText: 'name@example.com',
                      //     labelText: 'Enter your email',
                      //     border: OutlineInputBorder(),
                      //     prefixIcon: Image.asset('assets/images/user.png'),
                      //     suffixIcon: emailController.text.isEmpty
                      //         ? Container(width: 0)
                      //         : IconButton(
                      //             icon: Icon(Icons.close),
                      //             onPressed: () {
                      //               emailController.clear();
                      //             },
                      //           ),
                      //   ),
                      // ),
                      // SizedBox(height: 30),
                      // TextField(
                      //   keyboardType: TextInputType.emailAddress,
                      //   textInputAction: TextInputAction.done,
                      //   decoration: InputDecoration(
                      //     hintText: 'Your Password...',
                      //     labelText: 'Enter your password',
                      //     border: OutlineInputBorder(),
                      //     prefixIcon: Image.asset('assets/images/lock.png'),
                      //     suffixIcon: isPasswordVisible
                      //         ? InkWell(
                      //             child: Image.asset('assets/images/eye-off.png'),
                      //             onTap: () {
                      //               setState(() {
                      //                 isPasswordVisible = !isPasswordVisible;
                      //               });
                      //             },
                      //           )
                      //         : InkWell(
                      //             child: Image.asset('assets/images/eye.png'),
                      //             onTap: () {
                      //               setState(() {
                      //                 isPasswordVisible = !isPasswordVisible;
                      //               });
                      //             },
                      //           ),
                      //   ),
                      //   obscureText: isPasswordVisible,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
