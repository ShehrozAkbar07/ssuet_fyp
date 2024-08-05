import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Const/color.dart';
import 'package:fyp/View/all_doctors/all_doctors.dart';
import 'package:fyp/View/all_doctors/doctor_detail_screen.dart';
import 'package:fyp/Widget/custom_buton.dart';

class DoctorTile extends StatefulWidget {
  final Doctor doctor;
  const DoctorTile({super.key, required this.doctor});

  @override
  State<DoctorTile> createState() => _DoctorTileState();
}

class _DoctorTileState extends State<DoctorTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        height: 160.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.grey[200]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  Container(
                    height: 80.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[800]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.doctor.name,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: primary,
                          ),
                        ),
                        Text(
                          "Autism Therapist",
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: black,
                          ),
                        ),
                        Text(
                          widget.doctor.education,
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 220.w,
                    child: Row(
                      children: [
                        Text(
                          "${widget.doctor.fee}PKR",
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: black,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 20.h,
                          width: 2.w,
                          color: black,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Exp. ${widget.doctor.experience}",
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 37.h,
                      width: 110.w,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoctorDetailScreen(
                                        doctor: widget.doctor,
                                      )));
                        },
                        child: const Button(
                            button_text: 'See Details', colors: primary),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
