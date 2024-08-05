import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/AppRoutes/routes.dart';
import 'package:fyp/Const/color.dart';
import 'package:fyp/Widget/custom_buton.dart';
import 'package:get/get.dart';

class AdminBoard extends StatefulWidget {
  const AdminBoard({super.key});

  @override
  State<AdminBoard> createState() => _AdminBoardState();
}

class _AdminBoardState extends State<AdminBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.eventUpload);
                  },
                  child:
                      const Button(button_text: 'Add Events', colors: primary)),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.doctorUpload);
                  },
                  child: const Button(
                      button_text: 'Add Doctors', colors: primary)),
            ],
          ),
        ),
      ),
    ));
  }
}
