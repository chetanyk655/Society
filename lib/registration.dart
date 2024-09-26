import 'package:first_app/chetan/dashboard.dart';
//import 'package:first_app/member/new_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';
import 'package:first_app/login_screen.dart';

class Registration extends StatelessWidget {
  Registration({super.key});
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 50,
            ),
          ),
          const Center(
            child: const Text(
              ' SIGN UP',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Center(
            child: SizedBox(
              width: 375,
              child: TextField(
                  controller: _controller1,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'EMAIL ID',
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
                  controller: _controller2,
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
                  controller: _controller3,
                  decoration: const InputDecoration(
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
                onPressed: () {
                  Api()
                      .registration(
                        email: _controller1.text,
                        username: _controller2.text,
                        password: _controller3.text,
                      )
                      .then((result) => {
                            if (result)
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()))
                              }
                            else
                              print("Cant Sign Up")
                          });
                },
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.amber.shade100),
                label: const Text(
                  'SIGN UP',
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
