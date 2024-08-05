import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EventUpload extends StatefulWidget {
  const EventUpload({super.key});

  @override
  EventUploadState createState() => EventUploadState();
}

class EventUploadState extends State<EventUpload> {
  final _formKey = GlobalKey<FormState>();
  final _aboutEventController = TextEditingController();
  final _contactNoController = TextEditingController();
  final _dateController = TextEditingController();
  final _eventLocationController = TextEditingController();
  final _eventOrganizerController = TextEditingController();
  final _titleController = TextEditingController();
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

      FirebaseFirestore.instance.collection('events').add({
        'about_event': _aboutEventController.text,
        'contact_no': _contactNoController.text,
        'date': _dateController.text,
        'event_location': _eventLocationController.text,
        'event_organizer': _eventOrganizerController.text,
        'images': _imageUrls,
        'title': _titleController.text,
      }).then((value) {
        setState(() {
          _isLoading = false;
          _aboutEventController.clear();
          _contactNoController.clear();
          _dateController.clear();
          _eventLocationController.clear();
          _eventOrganizerController.clear();
          _titleController.clear();
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
        title: const Text('Upload Event Data'),
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
                      controller: _aboutEventController,
                      decoration:
                          const InputDecoration(labelText: 'About Event'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter event details';
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
                      controller: _dateController,
                      decoration: const InputDecoration(labelText: 'Date'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter date';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _eventLocationController,
                      decoration:
                          const InputDecoration(labelText: 'Event Location'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter event location';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _eventOrganizerController,
                      decoration:
                          const InputDecoration(labelText: 'Event Organizer'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter event organizer';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter event title';
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
