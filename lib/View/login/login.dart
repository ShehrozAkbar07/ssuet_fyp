import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/AppRoutes/routes.dart';
import 'package:fyp/Const/color.dart';
import 'package:fyp/Const/const.dart';
import 'package:fyp/Utils/utils.dart';
import 'package:fyp/View/navigation_bar/navigation_bar.dart';
import 'package:fyp/Widget/custom_buton.dart';
import 'package:fyp/Widget/custom_text_field.dart';
import 'package:fyp/auth/auth.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool obsecure1 = false;
  bool obsecure2 = false;
  Auth googleauth = Auth();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login() {
    if (kDebugMode) {
      email.text = email.text;
      pass.text = pass.text;
    }
    _auth
        .signInWithEmailAndPassword(
            email: email.text.toString(), password: pass.text.toString())
        .then((value) {
      Utils().toastMessag("Sign In Sucessfully");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const NavigationBarr()));
    }).onError((error, stackTrace) {
      Utils().toastMessag(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                login();
              }
              // Get.toNamed(AppRoutes.navbar);
            },
            child: const Button(
              colors: primary,
              button_text: 'Sign In',
            ),
          ),
        ),
        // backgroundColor: primary,
        body: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Appbarr(
            //   iconCross: false,
            //   text: 'Register',
            // ),
            Flexible(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 130.h,
                              ),
                              Text(
                                "Welcome Back!",
                                style: TextStyle(
                                  fontSize: 31.sp,
                                  fontWeight: FontWeight.bold,
                                  color: primary,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Loging Existing Account",
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  color: grey,
                                ),
                              ),
                              SizedBox(
                                height: 70.h,
                              ),
                              CustomTextFieldd(
                                numbertyppe: false,
                                ab: false,
                                controller: email,
                                text: 'Email',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter email';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              CustomTextFieldd(
                                numbertyppe: false,
                                ab: obsecure1,
                                controller: pass,
                                text: 'Password',
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        obsecure1 = !obsecure1;
                                      });
                                    },
                                    child: obsecure1
                                        ? const Icon(
                                            Icons.visibility_off_outlined,
                                            color: black,
                                          )
                                        : const Icon(
                                            Icons.visibility_outlined,
                                            color: black,
                                          )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter password';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 35.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Doesn't have an account?",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: grey,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.register);
                                    },
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: secondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () async {
                                    await googleauth.handleSignIn(context);
                                  },
                                  child: Container(
                                    height: 50.h,
                                    width: 230.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        border: Border.all(
                                            width: 2, color: primary)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Row(
                                        children: [
                                          const CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            radius: 15,
                                            backgroundImage: AssetImage(
                                                'assets/images/google.png'),
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Text(
                                            "Continue with Google",
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: grey,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]))))
          ]),
        ),
      ),
    );
  }
}

Widget SocialButton(image) {
  return Container(
    height: 55.h,
    width: 160.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: Colors.grey, width: 1)),
    child: Center(
      child: Container(
        height: 25.h,
        width: 50.w,
        child: Image.asset(image),
      ),
    ),
  );
}
