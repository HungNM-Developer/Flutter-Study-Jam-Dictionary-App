import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';

class TextFieldInput extends StatefulWidget {
  TextFieldInput({
    Key? key,
    required this.forgotPassword,
    // required this.email,
    // required this.password,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  // String email;
  // String password;
  final String forgotPassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  // form key
  //final _formKey = GlobalKey<FormState>();

  // editing controller
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  // firebase
  //final _auth = FirebaseAuth.instance;

  // bool showSpinner = false;
  bool isPasswordVisible = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.borderLineColor),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 15.0,
                offset: const Offset(0, 6.0),
              ),
            ],
          ),
          child:
              //   TextFormField(
              //     autofocus: false,
              //     controller: widget.emailController,
              //     keyboardType: TextInputType.emailAddress,
              //     validator: (value) {
              //       if (value!.isEmpty) {
              //         return ("Please Enter Your Email");
              //       }
              //       // reg expression for email validation
              //       if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              //           .hasMatch(value)) {
              //         return ("Please Enter a valid email");
              //       }
              //       return null;
              //     },
              //     onSaved: (value) {
              //       widget.emailController.text = value!;
              //     },
              //     textInputAction: TextInputAction.next,
              //     decoration: InputDecoration(
              //       prefixIcon: Icon(Icons.mail),
              //       contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              //       hintText: "Email",
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //     ),
              //   ),
              // ),
              TextFormField(
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.isEmpty) {
                return ("Please Enter Your Email");
              }
              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                  .hasMatch(value)) {
                return ("Please Enter a valid email");
              }
              return null;
            },
            onSaved: (value) {
              widget.emailController.text = value!;
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 27.w, vertical: 26.h),
              hintText: 'Enter your email',
              hintStyle: TextStyle(
                color: AppColors.hintTextColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Image.asset('assets/images/user.png'),
              suffixIcon: widget.emailController.text.isEmpty
                  ? Container(width: 0)
                  : IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        widget.emailController.clear();
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
          child:
              // TextFormField(
              //   autofocus: false,
              //   controller: widget.passwordController,
              //   obscureText: true,
              //   validator: (value) {
              //     RegExp regex = new RegExp(r'^.{6,}$');
              //     if (value!.isEmpty) {
              //       return ("Password is required for login");
              //     }
              //     if (!regex.hasMatch(value)) {
              //       return ("Enter Valid Password(Min. 6 Character)");
              //     }
              //   },
              //   onSaved: (value) {
              //     widget.passwordController.text = value!;
              //   },
              //   textInputAction: TextInputAction.done,
              //   decoration: InputDecoration(
              //     prefixIcon: Icon(Icons.vpn_key),
              //     contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              //     hintText: "Password",
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              // ),
              TextFormField(
            //autofocus: true,
            controller: widget.passwordController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            validator: (value) {
              RegExp regex = new RegExp(r'^.{6,}$');
              if (value!.isEmpty) {
                return ("Password is required for login");
              }
              if (!regex.hasMatch(value)) {
                return ("Enter Valid Password(Min. 6 Character)");
              }
            },
            onSaved: (value) {
              widget.passwordController.text = value!;
            },
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
