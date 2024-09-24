import 'package:first_app/chetan/dashboard.dart';
import 'package:first_app/member/new_dashboard.dart';
import 'package:first_app/registration.dart';
import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    // TODO: implement createElement
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          const Center(
            child: Text(
              'Login Account',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Center(
            child: SizedBox(
              width: 375,
              child: TextField(
                  controller: _controller1,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'USERNAME',
                      hintStyle: TextStyle(color: Colors.black))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: 375,
              child: TextField(
                  obscureText: _obscureText, // Hide the input
                  controller: _controller2,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'PASSWORD',
                      hintStyle: TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText; // Toggle visibility
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          )))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              width: 200,
              child: OutlinedButton.icon(
                onPressed: () {
                  Api().checklogin({
                    "username": _controller1.text,
                    "password": _controller2.text
                  }).then((result) => {
                        if (result)
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NewDashboard()))
                        else
                          print("Cant login")
                      });
                },
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
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Registration()));
                },
                child: Text("Don't have account?Sign up here")),
          )
        ],
      ),
    );
  }
}
