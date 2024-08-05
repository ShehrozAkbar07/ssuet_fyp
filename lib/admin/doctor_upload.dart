import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DoctorUpload extends StatefulWidget {
  const DoctorUpload({super.key});

  @override
  DoctorUploadState createState() => DoctorUploadState();
}

class DoctorUploadState extends State<DoctorUpload> {
  final _formKey = GlobalKey<FormState>();
  final _aboutDoctorController = TextEditingController();
  final _contactNoController = TextEditingController();
  final _doctorNameController = TextEditingController();
  final _doctorLocationController = TextEditingController();
  final _experienceController = TextEditingController();
  final _waitingTimeController = TextEditingController();
  final _educationController = TextEditingController();

  final List<String> _imageUrls = [];
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      String imageUrl = await _uploadImage(imageFile);
      setState(() {
        _imageUrls.add(imageUrl);
      });
    }
  }

  Future<String> _uploadImage(File image) async {
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().millisecondsSinceEpoch}');
    UploadTask uploadTask = storageReference.putFile(image);
    await uploadTask;
    return await storageReference.getDownloadURL();
  }

  void _uploadData() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      FirebaseFirestore.instance.collection('doctor').add({
        'education': _educationController.text,
        'about': _aboutDoctorController.text,
        'doctor_name': _doctorNameController.text,
        'experience': _experienceController.text,
        'contact_no': _contactNoController.text,
        'location': _doctorLocationController.text,
        'images': _imageUrls,
        'waiting_time': _waitingTimeController.text,
      }).then((value) {
        setState(() {
          _isLoading = false;
          _aboutDoctorController.clear();
          _contactNoController.clear();
          _doctorLocationController.clear();
          _experienceController.clear();
          _doctorNameController.clear();
          _waitingTimeController.clear();
          _imageUrls.clear();
        });
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data Uploaded Successfully')));
      }).catchError((error) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to upload data: $error')));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Doctor Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _doctorNameController,
                      decoration:
                          const InputDecoration(labelText: 'Doctor Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter doctor name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _aboutDoctorController,
                      decoration:
                          const InputDecoration(labelText: 'About Doctor'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter doctor details';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _contactNoController,
                      decoration:
                          const InputDecoration(labelText: 'Contact No'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter contact number';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _educationController,
                      decoration: const InputDecoration(labelText: 'Education'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter education';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _doctorLocationController,
                      decoration:
                          const InputDecoration(labelText: 'Doctor Location'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter doctor location';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _experienceController,
                      decoration:
                          const InputDecoration(labelText: 'Experience'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter experience';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _waitingTimeController,
                      decoration:
                          const InputDecoration(labelText: 'Waiting Time'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter waiting time';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('Images:'),
                    Column(
                      children: _imageUrls
                          .map((url) => ListTile(
                                title: Text(url),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      _imageUrls.remove(url);
                                    });
                                  },
                                ),
                              ))
                          .toList(),
                    ),
                    TextButton(
                      onPressed: _pickImage,
                      child: const Text('Add Image'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _uploadData,
                      child: const Text('Upload Data'),
                    ),
                    // InkWell(
                    //     onTap: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) =>
                    //                   const NavigationBarr()));
                    //     },
                    //     child: Container(
                    //       color: Colors.grey,
                    //       height: 20,
                    //       width: 20,
                    //     ))
                  ],
                ),
              ),
      ),
    );
  }
}
