import 'package:first_app/admin/admin_payment.dart';
import 'package:flutter/material.dart';

class MemberShow extends StatelessWidget {
  final String member_id;
  final String name;
  final String email;
  final String ph_no;
  final String house_no;
  MemberShow(
      {required this.member_id,
      required this.name,
      required this.email,
      required this.ph_no,
      required this.house_no});

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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Text(
                  "Member ID : ${member_id}",
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Display item information with larger text
            Container(
              width: double.infinity,
              child: Text(
                "Name : $name",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: Text(
                "F/No :$house_no",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: Text(
                "Email : $email",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: Text(
                "Ph : +91$ph_no",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 200,
              child: OutlinedButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AdminPayment(email: email)))
                      },
                  child: const Text("Send Bill")),
            ),
          ],
        ),
      ),
    );
  }
}
