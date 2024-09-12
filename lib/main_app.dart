import 'package:first_app/security.dart';
import 'package:flutter/material.dart';
import 'package:first_app/dashboard.dart';
import 'package:first_app/security.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(context) {
    return const MaterialApp(
      home: Scaffold(
        body: Security(),
      ),
    );
  }
}
