import 'package:flutter/material.dart';
class NoticePage extends StatelessWidget {
  const NoticePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NOTICE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const TextField(
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'Write your notice here...',
                fillColor: Color.fromARGB(255, 255, 255, 255),
                filled: true,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                // Logic to send the notice
              },
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent, // Button color
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 20),
               
              ),
               child: const Text('SEND'),
            ),
          ],
        ),
      ),
    );
  }
}