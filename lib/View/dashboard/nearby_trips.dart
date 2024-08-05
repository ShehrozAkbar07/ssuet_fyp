import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearByTripe extends StatefulWidget {
  const NearByTripe({Key? key}) : super(key: key);

  @override
  State<NearByTripe> createState() => _NearByTripeState();
}

class _NearByTripeState extends State<NearByTripe> {
  int? selected;

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
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: ab.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Container(
            height: 130.h,
            width: 164.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: const Color.fromARGB(255, 243, 243, 243),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 190.h,
                      width: 164.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                        image: DecorationImage(
                          image: AssetImage(ab[index]['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Text(
                        ab[index]['event_title'],
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Text(
                        ab[index]['location_detail'],
                        style: TextStyle(
                            fontSize: 15.sp, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 10.h,
                  right: 16.w,
                  child: Container(
                    color: Colors.grey.withOpacity(0.1),
                    height: 17.h,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Text(
                          ab[index]['city'],
                          style:
                              TextStyle(fontSize: 10.sp, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 55.h,
                  right: 12.w,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                      child: Icon(
                        selected != null && selected == index
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: selected != null && selected == index
                            ? Colors.red
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
