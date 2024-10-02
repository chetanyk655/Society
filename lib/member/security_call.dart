import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class SecurityApp extends StatelessWidget {
  const SecurityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SecurityPage(),
    );
  }
}

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  _SecurityPageState createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  File? _image;
  final picker = ImagePicker();
  final TextEditingController _reasonController = TextEditingController();
  String? selectedMember;
  List<String> members = ['Flat 101', 'Flat 102', 'Flat 103', 'Flat 104'];

  Map<String, String> memberPhoneNumbers = {
    'Flat 101': '8767333534',
    'Flat 102': '9876543210',
    'Flat 103': '1122334455',
    'Flat 104': '5566778899',
  };

  Future<void> _takePicture() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No image selected")),
          );
        }
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Camera permission denied")),
      );
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    var status = await Permission.phone.request();
    if (status.isGranted) {
      final Uri phoneUrl = Uri(scheme: 'tel', path: phoneNumber);
      try {
        if (await canLaunch(phoneUrl.toString())) {
          await launch(phoneUrl.toString());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Could not launch call")),
          );
        }
      } catch (e) {
        print("Error launching URL: $e"); // Log the error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Phone call permission denied")),
      );
    }
  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SECURITY", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: _takePicture,
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey[800],
                  child: _image == null
                      ? const Center(
                          child: Text(
                            'CAMERA OPTION',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        )
                      : Image.file(_image!, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 100),

            TextField(
              controller: _reasonController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: "Reason for Visit",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 50),

            DropdownButtonFormField<String>(
              dropdownColor: Colors.grey[800],
              value: selectedMember,
              items: members.map((String member) {
                return DropdownMenuItem<String>(
                  value: member,
                  child: Text(member, style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMember = value;
                });
              },
              decoration: const InputDecoration(
                labelText: "Select Society Member",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 50),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (selectedMember != null) {
                    String? phoneNumber = memberPhoneNumbers[selectedMember];
                    if (phoneNumber != null) {
                      _makePhoneCall(phoneNumber);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Phone number not available")),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please select a member")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'SEND CALL',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
