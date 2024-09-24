import 'package:first_app/admin/admin_drawer.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget{
  const AdminDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
          ),
        title: const Text('Admin Controls',style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      drawer: const AdminDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 29, 28, 28),
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 29, 28, 28)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
        ),
      ),
    );
    
  }
}