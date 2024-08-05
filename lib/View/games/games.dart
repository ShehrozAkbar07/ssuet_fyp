import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Const/color.dart';
import 'package:fyp/Const/const.dart';
import 'package:url_launcher/url_launcher.dart';

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 80.h,
          ),
          Text(
            "Autism Awareness Games!",
            style: TextStyle(
              fontSize: 31.sp,
              fontWeight: FontWeight.bold,
              color: secondary,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Enjoy Your Game!!",
            style: TextStyle(
              fontSize: 17.sp,
              color: grey,
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              gameContainer(
                  'https://www.friv.com/z/games/bobtherobber/game.html',
                  Colors.green),
              gameContainer('https://www.friv.com/z/games/mazegame/game.html',
                  Colors.yellow)
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              gameContainer(
                  'https://www.friv.com/z/games/seesawbalance/game.html',
                  Colors.purple),
              gameContainer(
                  'https://www.friv.com/z/games/highwaybikesimulator/game.html',
                  Colors.red)
            ],
          )
        ]),
      ),
    );
  }
}

Future<void> _launchURL(String webUrl) async {
  if (await canLaunch(webUrl)) {
    await launch(webUrl);
  } else {
    throw 'Could not launch $webUrl';
  }
}

// _launchURL(String weburl) async {
//   const url = 'https://www.friv.com/z/games/bobtherobber/game.html';
//   if (await canLaunchUrl(Uri.parse(url))) {
//     await launchUrl(Uri.parse(url));
//   } else {
//     throw 'Could not launch $url';
//   }
// }

Widget gameContainer(String url, Color color) {
  return InkWell(
    onTap: () {
      _launchURL(url);
    },
    child: Container(
      height: 200.h,
      width: 150.w,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(14)),
    ),
  );
}
