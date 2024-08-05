import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Utils/utils.dart';
import 'package:fyp/View/navigation_bar/navigation_bar.dart';
import 'package:fyp/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> handleSignIn(context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await _auth.signInWithCredential(credential).then((value) {
          User? user = auth.currentUser;
          Usermodel usermodel = Usermodel();

          // usermodel.username = googleUser.displayName;
          usermodel.email = googleUser.email;
          usermodel.uid = _auth.currentUser!.uid;
          firebaseFirestore
              .collection("users")
              .doc(user?.uid)
              .set(usermodel.toMap())
              .then((value) {
            Utils().toastMessag("Sign In Sucessfully");
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavigationBarr()));
          });
          // print(usermodel.username);
        }).onError((error, stackTrace) {
          Utils().toastMessag(error.toString());
        });

        // writing all the values

        // print('Signed in successfully.');
        // await Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const NavigationBarr()));
      } else {
        print('Sign-in canceled by the user.');
      }
    } catch (e) {
      print('Error occurred while signing in: $e');
    }
  }

  Future<void> handleSignOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      print('Signed out successfully.');
    } catch (e) {
      print('Error occurred while signing out: $e');
    }
  }
}
