import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Const/color.dart';

class Button extends StatefulWidget {
  final String button_text;
  final Color colors;
  const Button({super.key, required this.button_text, required this.colors});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13), color: widget.colors),
      child: Center(
        child: Text(
          widget.button_text,
          style: TextStyle(
            fontSize: 17.sp,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
