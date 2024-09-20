import 'package:flutter/material.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
        MaterialApp(
          home: Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back),
                    ),
                  ],
                ),
                const SizedBox(height: 80,),
                const Center(
                  child: Text(
                    'FeedBack Page!!',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  width: 300,
                  height: 200,
                  child: Expanded(
                    child: TextField(
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.multiline,
                      // minLines: 1,
                      maxLines: null,
                      expands: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Type your Feedback',
                          // hintStyle: TextStyle(),
                          filled: true),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () {},
                  
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  child: const Text(
                    'SUBMIT',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        );

  }
}
