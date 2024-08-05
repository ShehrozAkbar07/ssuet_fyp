import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Const/color.dart';
import 'package:fyp/Const/const.dart';
import 'package:fyp/View/all_doctors/all_doctors.dart';
import 'package:fyp/View/dashboard/nearby_trips.dart';
import 'package:fyp/View/events_detail/events_detail.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  dynamic selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30.sp,
                  backgroundImage: const AssetImage('assets/images/splash.jpg'),
                ),
                const Center(child: Icon(Icons.notifications_outlined)),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Events",
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: primary,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              width: 360.w,
              height: 190.h,
              child: Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('events')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final events = snapshot.data!.docs;
                      return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: events.length,
                          itemBuilder: (context, index) {
                            final event = events[index];

                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EventsDetail(
                                                event: event,
                                              )));
                                },
                                child: Container(
                                  height: 180.h,
                                  width: 350.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            event['images'][0],
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(14),
                                      color: Colors.yellow),
                                ),
                              ),
                            );
                          });
                    }),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AllDoctors()));
              },
              child: Container(
                height: 180.h,
                width: 350.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color.fromARGB(255, 232, 232, 232)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Find Doctors",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 22.sp,
                              color: black,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            "Consultant a Doctor\nanytime, anywhere.",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: grey,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/doctor.png',
                        height: 150.h,
                        width: 90.w,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
              height: 270.h,
              width: double.infinity,
              child: const NearByTripe(),
            ),
            SizedBox(
              height: 40.h,
            ),
          ]),
        ),
      ),
    );
  }
}
