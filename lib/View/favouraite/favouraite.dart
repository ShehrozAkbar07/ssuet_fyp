import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Const/color.dart';
import 'package:fyp/Const/const.dart';
import 'package:fyp/View/dashboard/nearby_trips.dart';

class Favouraite extends StatefulWidget {
  const Favouraite({super.key});

  @override
  State<Favouraite> createState() => _FavouraiteState();
}

class _FavouraiteState extends State<Favouraite> {
  List<Map<String, dynamic>> ab = [
    {
      'image': 'assets/images/splash.jpg',
      'location_detail': 'Rotatory Club Gulistan -e- Juhaur',
      'city': "karachi",
      'event_title': 'Autism Awarness',
    },
    {
      'image': 'assets/images/splash.jpg',
      'location_detail': 'Rotatory Club Gulistan -e- Juhaur',
      'city': "karachi",
      'event_title': 'Autism Awarness',
    },
    {
      'image': 'assets/images/splash.jpg',
      'location_detail': 'Rotatory Club Gulistan -e- Juhaur',
      'city': "karachi",
      'event_title': 'Autism Awarness',
    },
    {
      'image': 'assets/images/splash.jpg',
      'location_detail': 'Rotatory Club Gulistan -e- Juhaur',
      'city': "karachi",
      'event_title': 'Autism Awarness',
    },
    {
      'image': 'assets/images/splash.jpg',
      'location_detail': 'Rotatory Club Gulistan -e- Juhaur',
      'city': "karachi",
      'event_title': 'Autism Awarness',
    },
    {
      'image': 'assets/images/splash.jpg',
      'location_detail': 'Rotatory Club Gulistan -e- Juhaur',
      'city': "karachi",
      'event_title': 'Autism Awarness',
    },
    {
      'image': 'assets/images/splash.jpg',
      'location_detail': 'Rotatory Club Gulistan -e- Juhaur',
      'city': "karachi",
      'event_title': 'Autism Awarness',
    },
    {
      'image': 'assets/images/splash.jpg',
      'location_detail': 'Rotatory Club Gulistan -e- Juhaur',
      'city': "karachi",
      'event_title': 'Autism Awarness',
    },
    {
      'image': 'assets/images/splash.jpg',
      'location_detail': 'Rotatory Club Gulistan -e- Juhaur',
      'city': "karachi",
      'event_title': 'Autism Awarness',
    },
  ];
  dynamic selected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        SizedBox(
          height: 30.h,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              "Favouraite Upcoming Events & Sessions",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        Expanded(
            child: ListView.builder(
                itemCount: ab.length,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
                    child: Container(
                      height: 80.h,
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
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 25.sp,
                              backgroundImage:
                                  const AssetImage('assets/images/splash.jpg'),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 10.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ab[index]['event_title'],
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    ab[index]['location_detail'],
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.favorite, color: Colors.red),
                          ],
                        ),
                      ),
                    ),
                  );
                })))
      ]),
    ));
  }
}
