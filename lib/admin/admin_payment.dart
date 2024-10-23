import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';

// ignore: must_be_immutable
class AdminPayment extends StatelessWidget {
  AdminPayment({super.key, required this.email});
  final _amountController = TextEditingController();
  String email;
  @override
  Widget build(BuildContext context) {
    final amount = _amountController.text;

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text('Maintainence Section',
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
        body: Container(
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
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    controller: _amountController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        prefix: Text('₹ ',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        label: Text('Enter Amount',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16))),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (amount.isNotEmpty) {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                    backgroundColor:
                                        const Color.fromARGB(255, 38, 38, 38),
                                    title: const Text(
                                      'Amount is not entered',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    actions: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.black),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Okay',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ));
                        } else {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                    backgroundColor:
                                        const Color.fromARGB(255, 38, 38, 38),
                                    title: Text(
                                      'Confirm Amount ₹${_amountController.text}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    actions: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.black),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'cancel',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor: Colors.black),
                                        onPressed: () {
                                          if (email != "") {
                                            Api().storeBill({
                                              "amount": _amountController.text,
                                              "m_email": email,
                                              "name": null.toString(),
                                              "type": null.toString(),
                                              "file_data": null.toString()
                                            });
                                            Api()
                                                .getadminBill(email)
                                                .then((res) => {
                                                      Api().storeMaintenance({
                                                        "amount":
                                                            _amountController
                                                                .text,
                                                        "email": email,
                                                        "bid": jsonDecode(res)[
                                                                    'response']
                                                                [0]['b_id']
                                                            .toString(),
                                                        "pay_status": 'Unpaid'
                                                      })
                                                    });

                                            Navigator.pop(context);
                                          }
                                        },
                                        child: const Text(
                                          'confirm',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          overlayColor: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255)),
                      child: const Text('SEND',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16))),
                ],
              ),
            )));
  }
}
