import 'package:first_app/admin/bill_status.dart';
import 'package:flutter/material.dart';

class AdminPaymentControl extends StatelessWidget {
  AdminPaymentControl({super.key, required this.response});
  String response;
  final _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final amount = _amountController.text;

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text('Admin Maintenance Control',
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
        body: Container(
            width: double.infinity,
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
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BillStatus(response: response)))
                          },
                      child: const Text("Bill Status"))
                ],
              ),
            )));
  }
}
