import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class NoticePopup extends StatelessWidget {
  const NoticePopup(
      {super.key,
      required this.content,
      required this.date,
      required this.attachment});

  final String content;
  final String date;
  final Map<String, dynamic> attachment;
  // JSON attachment in byte form

  Future<void> _downloadFile(
      BuildContext context, String directorySelected) async {
    try {
      List<dynamic> dynamicList;
      List<int> fileBytes;
      String fileName;
      String fileExtension;
      final directory;
      final filePath;
      final file;
      if (attachment['file_data'] != null) {
        dynamicList = attachment['file_data'];
        fileBytes = List<int>.from(dynamicList);
        fileName = attachment['file_name'];
        fileExtension = fileName.split('.').last;
        directory = Directory(directorySelected);
        filePath = '${directory.path}/$fileName';
        file = File(filePath);

        await file.writeAsBytes(fileBytes);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Download Complete: $fileName')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download Failed: $e')),
      );
    }
  }

  Future<void> _pickDownloadDirectory(BuildContext context) async {
    String? result = await FilePicker.platform.getDirectoryPath();

    if (result != null) {
      // You can now use this path to save the file
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Selected path: $result')));
      _downloadFile(context, result);
    } else {
      // User canceled the picker
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No directory selected')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text('Details',
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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                Text(date,
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
                const SizedBox(height: 30),
                Text(content,
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
                const SizedBox(height: 20),
                attachment['file_data'] != null
                    ? ElevatedButton(
                        onPressed: () => _pickDownloadDirectory(context),
                        child: const Text('Download Attachment'),
                      )
                    : const Text(
                        "No Attachment Available",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
