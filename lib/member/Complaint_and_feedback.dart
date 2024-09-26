import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';

class ComplaintAndFeedback extends StatelessWidget {
  ComplaintAndFeedback({super.key});
  final TextEditingController _message = TextEditingController();
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
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
                const SizedBox(height: 80),
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
        ));
  }
}
