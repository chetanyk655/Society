import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';

class BillStatus extends StatelessWidget {
  BillStatus({super.key, required this.response});
  String response;
  Map<String, dynamic> parsedJson = {};
  List<Map<String, dynamic>> items = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    parsedJson = jsonDecode(response);
    for (int i = 0; i < parsedJson['response'].length; i++) {
      items.add({
        "bill_id": parsedJson['response'][i]['bill_id'].toString(),
        "amount": parsedJson['response'][i]['amount'].toString(),
        "email": parsedJson['response'][i]['m_email'],
        "pay_status": parsedJson['response'][i]['pay_status']
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Bills',
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
      body: items.isEmpty
          ? const Center(
              child: Text('No Bills added yet',
                  style: TextStyle(color: Colors.white, fontSize: 18)))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ID : ${items[index]['bill_id']}",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Amount :  ₹${items[index]['amount']}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'email : ${items[index]['email']}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'pay_status : ${items[index]['pay_status']}',
                      style: TextStyle(
                        fontSize: 16,
                        color: items[index]['pay_status'] == 'Unpaid'
                            ? const Color.fromARGB(255, 207, 5, 5)
                            : const Color.fromARGB(255, 73, 255, 22),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                );
              }),
    );
  }
}
