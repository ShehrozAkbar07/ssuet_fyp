import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/AppRoutes/routes.dart';
import 'package:fyp/Const/color.dart';
import 'package:fyp/Const/const.dart';
import 'package:fyp/auth/auth.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Auth googleauth = Auth();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 18.h),
        child: InkWell(
          onTap: () async {
            await googleauth.handleSignOut();
            _auth.signOut();
            await Get.toNamed(AppRoutes.login);
          },
          child: settingContainer(
            'Log Out ',
            Icons.logout,
          ),
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40.sp,
                backgroundImage: const AssetImage('assets/images/splash.jpg'),
              ),
              SizedBox(
                width: 29.w,
              ),
              Text(
                "Shehroz Akbar",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        settingContainer(
          'Privacy Policy ',
          Icons.note_alt_outlined,
        ),
        settingContainer(
          'Terms & Services ',
          Icons.note_alt_outlined,
        ),
        settingContainer(
          'Contact Us',
          Icons.contact_emergency_outlined,
        ),
      ]),
    ));
  }
}

Widget settingContainer(String title, IconData icon) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 20.w),
    child: Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Row(
          children: [
            Icon(
              icon,
              color: secondary,
              size: 31.sp,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}
