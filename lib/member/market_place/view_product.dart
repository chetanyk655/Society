import 'dart:typed_data';
import 'package:flutter/material.dart';

class ViewProductPage extends StatelessWidget {
  final Uint8List image;
  final String name;
  final String price;
  final String desc;

  ViewProductPage(
      {required this.image,
      required this.name,
      required this.price,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display larger image
            Container(
              width: double.infinity,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.memory(
                  image as Uint8List,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Display item information with larger text
            Text(
              name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Price: ₹$price',
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 15, 13, 13),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              desc,
              style: const TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 5, 3, 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
