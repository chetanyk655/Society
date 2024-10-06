import 'dart:convert';

import 'package:first_app/member/market_place/add_product.dart';
import 'package:first_app/member/market_place/view_product.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart';
import 'package:first_app/member/securityView.dart';

class SecurityMember extends StatefulWidget {
  SecurityMember({super.key, required this.response});
  String response;
  @override
  _SecurityMemberState createState() =>
      _SecurityMemberState(response: response);
}

class _SecurityMemberState extends State<SecurityMember> {
  _SecurityMemberState({required this.response});
  String response;
  Map<String, dynamic> parsedJson = {};
  List<Map<String, dynamic>> items = [];

  @override
  Widget build(BuildContext context) {
    parsedJson = jsonDecode(response);
    print(parsedJson);
    if (parsedJson['status_code'] == 200) {
      for (int i = 0; i < parsedJson['total_queries']; i++) {
        items.add({
          "image":
              base64Decode(parsedJson['response'][i]['image'].split(',').last),
          "reason": parsedJson['response'][i]['reason'],
        });
      }
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Security',
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
      body: items.isEmpty
          ? const Center(
              child: Text('No Secuirty Queries Available now',
                  style: TextStyle(color: Colors.white, fontSize: 18)))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to the detailed view when the item is clicked
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecurityView(
                              image: items[index]['image'],
                              reason: items[index]['reason']),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 0, 0, 0),
                            Color.fromARGB(255, 29, 28, 28),
                            Color.fromARGB(255, 0, 0, 0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            // Display a small image
                            Container(
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.memory(
                                  items[index]['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Display item information
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[index]['reason'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          final newItem = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductPage()),
          );

          if (newItem != null) {
            setState(() {
              items.add(newItem);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
