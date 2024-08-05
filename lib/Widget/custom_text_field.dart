import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Const/color.dart';

class CustomTextFieldd extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final bool? ab;
  final Widget? prefix;
  final Widget? suffix;
  final bool? numbertyppe;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator; // Add validator function

  const CustomTextFieldd({
    Key? key,
    required this.text,
    required this.controller,
    this.suffixIcon,
    this.keyboardType,
    this.prefixIcon,
    required this.ab,
    this.prefix,
    this.suffix,
    required this.numbertyppe,
    this.validator, // Add validator to constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: black),
      obscureText: ab!,
      controller: controller,
      textAlign: TextAlign.left,
      keyboardType: numbertyppe! ? TextInputType.number : keyboardType,
      autofillHints: const [
        AutofillHints.username,
        AutofillHints.password,
        AutofillHints.email,
        AutofillHints.telephoneNumber
      ],
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: black, fontSize: 14),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        filled: true,
        prefixIcon: prefixIcon,
        prefix: Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: prefix,
        ),
        suffix: suffix,
        hintText: text,
        hintStyle: const TextStyle(
            color: black, fontSize: 14, fontWeight: FontWeight.normal),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: secondary, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primary, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secondary, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: validator, // Set the validator function
    );
  }
}
