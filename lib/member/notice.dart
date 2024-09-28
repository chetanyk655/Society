import 'package:flutter/material.dart';
import 'dart:convert';

class NoticeMember extends StatelessWidget {
  NoticeMember({super.key, required this.response});
  String response;
  @override
  Widget build(BuildContext context) {
    print(jsonDecode(response)["response"][0]["contents"]);
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text('Notice',
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
            child: const Center(
                child: Text('NO NOTICE',
                    style: TextStyle(color: Colors.white, fontSize: 24)))));
  }
}
