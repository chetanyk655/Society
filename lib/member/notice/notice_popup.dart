import 'package:flutter/material.dart';

class NoticePopup extends StatelessWidget{
  const NoticePopup({super.key,required this.content,required this.date});
  final String content;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text('Details',
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
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Column(
                  
                  children: [
                    Text(date,style: const TextStyle(color: Colors.white, fontSize: 18)),
                    const SizedBox(height: 30,),
                    Text(content,style: const TextStyle(color: Colors.white, fontSize: 18)),
                    
                  ],
                ),
              ),
            ),
             ));
  }
  
}