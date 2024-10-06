import 'dart:convert';
import 'dart:ffi';

import 'package:first_app/admin/admin_dashboard.dart';
import 'package:first_app/admin/signin_or_signup.dart';
import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';

bool x = true;

class adminAuth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _adminAuthState();
  }
}

class _adminAuthState extends State<adminAuth> {
  final TextEditingController authKey = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Returning false disables the back button
        return Future.value(x);
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text('Admin Authorization',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            automaticallyImplyLeading: x),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 29, 28, 28),
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 29, 28, 28),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  controller: authKey,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: 'Enter Authorization passkey',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 16)),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {
                        Api().checkAdminAuth({
                          "key": authKey.text,
                        }).then((res) => {
                              if (jsonDecode(res)['canAuth'] == true)
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SigninOrSignup()))
                                }
                            });
                      },
                      child: const Text(
                        'Check',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
