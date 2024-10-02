import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';

class ComplaintAndFeedback extends StatefulWidget {
  ComplaintAndFeedback({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ComplaintAndFeedback();
  }
  
}

class _ComplaintAndFeedback extends State<ComplaintAndFeedback>{
  File? _image;
  final TextEditingController _message = TextEditingController();
  Future<String> encodeImage(File imgFile) async {
    List<int> imageBytes = await imgFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text('Complaint and Feedback',
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 29, 28, 28),
                Color.fromARGB(255, 0, 0, 0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Padding(
            
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: _image == null
                            ? Icon(Icons.camera_alt, size: 50, color: Colors.grey)
                            : Image.file(_image!, fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _message,
                      maxLines: 10,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      decoration: const InputDecoration(
                        hintText: 'Enter your message here...',
                        hintStyle: TextStyle(color: Colors.white, fontSize: 18),
                        fillColor: Color.fromARGB(255, 0, 0, 0),
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Api().storeComplaintAndFeedback(
                            {"message": _message.text, "ticket": 'feedbacks'});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple, // Button color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: const Text(
                        'Send Feedback',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Api().storeComplaintAndFeedback(
                            {"message": _message.text, "ticket": "complaints"});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple, // Button color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: const Text(
                        'Send Complaint',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
    
  }
}

