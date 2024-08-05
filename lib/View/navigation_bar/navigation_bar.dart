import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Const/color.dart';
import 'package:fyp/View/dashboard/dashboard.dart';
import 'package:fyp/View/favouraite/favouraite.dart';
import 'package:fyp/View/games/games.dart';
import 'package:fyp/View/settings/settings.dart';

class NavigationBarr extends StatefulWidget {
  const NavigationBarr({super.key});

  @override
  State<NavigationBarr> createState() => _NavigationBarrState();
}

class _NavigationBarrState extends State<NavigationBarr> {
  int currentPage = 0;

  List<Widget> pages = [
    const Dashboard(),
    const Favouraite(),
    const Games(),

    // Center(
    //   child: Text(
    //     'Notification Screen',
    //     style: TextStyle(fontSize: 30.sp),
    //   ),
    // ),
    const Settings()
    // Center(
    //   child: Text(
    //     '2',
    //     style: TextStyle(fontSize: 30.sp),
    //   ),
    // ),
    ,

    // HomeScreen(),
    //   Favouraite(),
    //   SearchScreen(isBackNavigatee: false,),
    //   RatingProcess(),
    //  ProfileDetail(
    //   isBackNavigate: false,
    //  ),
  ];
  // var page = HomeScreen();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[currentPage],
        bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: secondary,
          // key: _bottomNavigationKey,
          // index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 30,
              color: Color(0xffd9d9e2),
            ),
            Icon(
              Icons.favorite_rounded,
              size: 30,
              color: Color(0xffd9d9e2),
            ),
            Icon(Icons.games, size: 30, color: Color(0xffd9d9e2)),
            // Icon(Icons.notifications, size: 30, color: Color(0xffd9d9e2)),
            Icon(Icons.person, size: 30, color: Color(0xffd9d9e2)),
          ],
          onTap: ((index) {
            print(index);
            setState(() {
              currentPage = index;
            });
          }),
          color: Colors.white,
          // buttonBackgroundColor: Color(AppColors.bodyText),

          backgroundColor: Colors.transparent,
          // animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 700),
        ),
      ),
    );
  }
}
