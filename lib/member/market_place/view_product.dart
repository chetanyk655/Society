import 'package:flutter/material.dart';
import 'dart:io';

class ViewProductPage extends StatelessWidget {
  final File image;
  final String name;
  final String price;

  ViewProductPage(
      {required this.image, required this.name, required this.price});

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
                child: Image.file(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Display item information with larger text
            Text(
              name,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Price: \$${price}',
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}