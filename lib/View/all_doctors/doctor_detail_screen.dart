import 'package:flutter/material.dart';
import 'package:fyp/View/all_doctors/all_doctors.dart';

class DoctorDetailScreen extends StatelessWidget {
  final Doctor doctor;
  const DoctorDetailScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Text(doctor.name),
            Text(doctor.about),
            Text(doctor.contact),
            Text(doctor.education),
            Text(doctor.experience),
            Text(doctor.contact),
          ],
        ),
      ),
    );
  }
}
