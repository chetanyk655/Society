import 'dart:io';

import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NoticePageState();
  }
}

class _NoticePageState extends State<NoticePage> {
  File? _file;
  final TextEditingController _notice = TextEditingController();

  Future<void> _pickFile() async {
    // Request storage permission
    if (await Permission.storage.request().isGranted) {
      // Permission granted, allow picking files
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'txt'],
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          _file = File(result.files.single.path!);
        });
      } else {
        print('No file selected');
      }
    } else {
      // Permission is denied or permanently denied
      if (await Permission.storage.isPermanentlyDenied) {
        openAppSettings(); // Open app settings if permission is permanently denied
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text('NOTICE',
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 177, 171, 171),
                Color.fromARGB(255, 0, 0, 0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                TextField(
                  maxLines: 10,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  controller: _notice,
                  decoration: const InputDecoration(
                    hintText: 'Enter your notice here...',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 18),
                    fillColor: Color.fromARGB(255, 0, 0, 0),
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _pickFile,
                  child: Text('Pick File (PDF/Text)'),
                ),
                SizedBox(height: 5),
                _file != null
                    ? Text('File: ${_file!.path.split('/').last}')
                    : Text('No file selected'),
                SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Upload File'),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Api()
                        .storeNotice({"contents": _notice.text}).then((res) => {
                              //here you get all result from server
                              //please notify send request as successful as a modal pop up
                            });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text(
                    'SEND',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
