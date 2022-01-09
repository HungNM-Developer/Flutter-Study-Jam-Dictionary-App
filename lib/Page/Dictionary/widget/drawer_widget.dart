import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_study_jam/config/themes/app_colors.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
    required this.email,
    //required this.logout,
  }) : super(key: key);
  //final Function logout;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Image.asset('assets/images/gdsc.png'),
          ),
          Text(
            email,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Divider(
            //height: 3,
            thickness: 0.7,
            color: Colors.black12,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 21.h),
            child: InkWell(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                //Navigator.pop(context);
                Navigator.pushReplacementNamed(context, "LoginPage");

                //logout;
                // _auth.signOut();
                // Navigator.pop(context);
                //Navigator.pushNamed(context, "LoginPage");
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 21.h),
                //height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryBuleColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    'Sign out',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
