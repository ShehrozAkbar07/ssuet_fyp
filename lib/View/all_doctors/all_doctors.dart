import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp/Const/color.dart';
import 'package:fyp/View/all_doctors/all_doctor_container.dart';

class AllDoctors extends StatefulWidget {
  const AllDoctors({super.key});

  @override
  State<AllDoctors> createState() => _AllDoctorsState();
}

class _AllDoctorsState extends State<AllDoctors> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "All Doctors",
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: primary,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('doctor').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text('Error loading data'));
              }

              final doctors = snapshot.data!.docs.map((doc) {
                return Doctor.fromMap(
                    doc.data() as Map<String, dynamic>, doc.id);
              }).toList();

              return ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return DoctorTile(doctor: doctor);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class Doctor {
  final String id;
  final String name;
  final String specialization;
  final String education;
  final String fee;
  final String experience;
  final String contact;
  final String about;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.education,
    required this.fee,
    required this.experience,
    required this.contact,
    required this.about,
  });

  factory Doctor.fromMap(Map<String, dynamic> data, String documentId) {
    return Doctor(
      id: documentId,
      name: data['doctor_name'] ?? '',
      specialization: data['specialization'] ?? '',
      education: data['education'] ?? '',
      fee: data['fee'] ?? '',
      experience: data['experience'] ?? '',
      about: data['about'] ?? '',
      contact: data['contact'] ?? '',
    );
  }
}
