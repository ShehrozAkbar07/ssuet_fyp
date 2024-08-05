import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Const/color.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class EventsDetail extends StatefulWidget {
  DocumentSnapshot? event;
  EventsDetail({this.event, super.key});

  @override
  State<EventsDetail> createState() => _EventsDetailState();
}

class _EventsDetailState extends State<EventsDetail> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    var event = widget.event;
    final List<String> imageUrls = List<String>.from(event?['images']);

    return SafeArea(
        child: Scaffold(
      backgroundColor: lightgrey,
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 400.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      // color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: CarouselSlider(
                      items: imageUrls.map((url) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  url,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 400,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.2,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        onPageChanged: (index, reason) {
                          // Add your callback function here if needed
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  // Container(
                  //   height: 400.h,
                  //   width: double.infinity,
                  //   decoration: const BoxDecoration(
                  //       color: black,
                  //       borderRadius: BorderRadius.only(
                  //           bottomLeft: Radius.circular(20),
                  //           bottomRight: Radius.circular(20))),
                  // )
                ],
              ),
              Positioned(
                  top: 40.h,
                  left: 30.w,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: whiteColor,
                    ),
                  )),
            ],
          ),
          Flexible(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    height: 110.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: whiteColor),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                event?['title'],
                                style: TextStyle(
                                  fontSize: 27.sp,
                                  fontWeight: FontWeight.bold,
                                  color: black,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_month,
                                            color: grey,
                                            size: 19,
                                          ),
                                          SizedBox(
                                            width: 9.w,
                                          ),
                                          Text(
                                            event?['date'],
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: grey,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on_outlined,
                                            color: grey,
                                            size: 19,
                                          ),
                                          SizedBox(
                                            width: 9.w,
                                          ),
                                          Text(
                                            "Karachi, PAK",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: grey,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: whiteColor),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "About Events",
                            style: TextStyle(
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Expanded(
                            child: Text(
                              event?['about_event'],
                              style: TextStyle(
                                fontSize: 15.sp,
                                // overflow: TextOverflow.ellipsis,
                                color: grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    height: 300.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: whiteColor),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Events Details",
                            style: TextStyle(
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Event Organizer",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19.sp,
                              color: black,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/images/doctor.PNG'),
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              Text(
                                event?['event_organizer'],
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Event Contact Info",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19.sp,
                              color: black,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "Contact No: ",
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  color: black,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _launchDialer(event?['contact_no']);
                                },
                                child: Text(
                                  event?["contact_no"],
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                      height: 250.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: whiteColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Text(
                              "Event Location",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: InkWell(
                              onTap: () {
                                _launchURL(
                                    "https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(event?['event_location'])}");
                              },
                              child: Container(
                                height: 150.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: whiteColor),
                                child: Image.asset(
                                  'assets/images/map.PNG',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 120.h,
                ),
              ],
            ),
          ))
        ],
      ),
    ));
  }
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchDialer(String phoneNumber) async {
  final Uri dialerUrl = Uri(scheme: 'tel', path: phoneNumber);
  if (await canLaunch(dialerUrl.toString())) {
    await launch(dialerUrl.toString());
  } else {
    throw 'Could not launch $dialerUrl';
  }
}
