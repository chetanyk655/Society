import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              size: 50,
            ),
          ),
          const Text(
            'Login Account',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          const SizedBox(
            height: 150,
          ),
          const Center(
            child: SizedBox(
              width: 375,
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'USERNAME',
                      hintStyle: TextStyle(color: Colors.black))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: SizedBox(
              width: 375,
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'PASSWORD',
                      hintStyle: TextStyle(color: Colors.black))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: 200,
              child: OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.amber.shade100),
                label: const Text(
                  'LOG IN',
                  style: TextStyle(fontSize: 15),
                ),
                icon: const Icon(Icons.arrow_circle_right_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
