import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp/AppRoutes/routes.dart';
import 'package:fyp/Const/color.dart';
import 'package:fyp/Const/const.dart';
import 'package:fyp/Utils/utils.dart';
import 'package:fyp/Widget/custom_buton.dart';
import 'package:fyp/Widget/custom_text_field.dart';
import 'package:fyp/model/user_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();

  TextEditingController mobile = TextEditingController();
  TextEditingController cnfrmpass = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool obsecure1 = false;
  bool obsecure2 = false;

  bool isValidEmail(String email) {
    return EmailValidator.validate(email);
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
                if (!isValidEmail(email.text.trim())) {
                  Fluttertoast.showToast(
                      msg: 'Please enter a valid email address');
                  return;
                }
                _auth
                    .createUserWithEmailAndPassword(
                        email: email.text.toString().trim(),
                        password: pass.text.toString().trim())
                    .then((value) {
                  postDetailToFirestore();
                }).onError((error, stackTrace) {
                  Utils().toastMessag(error.toString());
                });
              }
              // if (_formKey.currentState!.validate()) {
              //   Get.toNamed(AppRoutes.login);
              // }
            },
            child: const Button(
              colors: primary,
              button_text: 'Sign Up',
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
                                height: 100.h,
                              ),
                              Text(
                                "Let’s Get You Onboard!",
                                style: TextStyle(
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.bold,
                                  color: primary,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Sign up you fresh account in few mins",
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
                                controller: firstname,
                                text: 'Full Name',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter full name';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 19.h,
                              ),
                              CustomTextFieldd(
                                numbertyppe: false,
                                ab: false,
                                controller: lastname,
                                text: 'Last Name',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter last name';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 19.h,
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
                                height: 19.h,
                              ),
                              CustomTextFieldd(
                                numbertyppe: false,
                                ab: false,
                                controller: mobile,
                                text: 'Enter Mobile Number',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter mobile number';
                                  }
                                },
                              ),
                              SizedBox(
                                height: 19.h,
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
                                height: 19.h,
                              ),
                              CustomTextFieldd(
                                numbertyppe: false,
                                ab: obsecure2,
                                controller: cnfrmpass,
                                text: 'Re-type password',
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        obsecure2 = !obsecure2;
                                      });
                                    },
                                    child: obsecure2
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
                                height: 30.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: grey,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.login);
                                    },
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: secondary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ]))))
          ]),
        ),
      ),
    );
  }

  postDetailToFirestore() async {
    //calling our firestore
    //calling our usermodel
    //sedning these values
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = auth.currentUser;

    Usermodel usermodel = Usermodel();

    // writing all the values
    usermodel.email = email.text;
    usermodel.firstName = firstname.text;
    usermodel.lastName = lastname.text;
    usermodel.uid = user!.uid;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(usermodel.toMap());

    Fluttertoast.showToast(msg: 'Account created Successfully ');
    await Get.toNamed(AppRoutes.navbar);
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
