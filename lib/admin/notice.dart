import 'dart:io';
import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';
import 'package:file_picker/file_picker.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _NoticePageState();
  }
}

class _NoticePageState extends State<NoticePage> {
  final TextEditingController _notice = TextEditingController();
  late File _file = File(""); // To hold the selected file

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'txt'], // Limit to PDF and text files
    );

    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
      });
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _pickFile,
                  child: Text('Pick File (PDF/Text)'),
                ),
                SizedBox(height: 5),
                _file != null
                    ? Text('File: ${_file!.path.split('/').last}')
                    : Text('No file selected'),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_file != Null) {
                      Api().storeNotice({"contents": _notice.text}, _file).then(
                          (res) => {
                                //here you get all result from server
                                //please notify send request as successful as a modal pop up
                              });
                    } else {
                      Api().storeNotice({"contents": _notice.text}, null).then(
                          (res) => {
                                //here you get all result from server
                                //please notify send request as successful as a modal pop up
                              });
                    }
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
