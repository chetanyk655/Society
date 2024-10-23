import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';

class PaymentMember extends StatefulWidget {
  const PaymentMember({super.key, required this.bill});
  final String bill;

  @override
  State<StatefulWidget> createState() {
    return _PaymentMember(amount: bill);
  }
}

class _PaymentMember extends State<PaymentMember> {
  _PaymentMember({required this.amount});
  String amount;
  int status = 0;
  Map<String, dynamic> parsedJson = {};
  String cashToDisplayed = "No Bills on due!!";
  void _payment() {
    Api().storeMaintenance({
      "bid": parsedJson['response'][0]['b_id'].toString(),
      "email": parsedJson['response'][0]['m_email'],
      "amount": parsedJson['response'][0]['bill_amount'].toString()
    });
    Api().updateBillStatus({
      "bid": parsedJson['response'][0]['b_id'].toString(),
    });
    Api().deleteBill({"email": parsedJson['response'][0]['m_email']});
    setState(() {
      cashToDisplayed = 'No Bills on due!!';
      parsedJson['status_code'] = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (status == 0) {
      parsedJson = jsonDecode(amount);
    }
    status = parsedJson['status_code'];

    if (status == 200) {
      cashToDisplayed = parsedJson['response'][0]["bill_amount"].toString();
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text('Maintaince Bill',
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
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 28, 245, 35)
                                .withOpacity(0.55),
                            const Color.fromARGB(255, 38, 243, 44)
                                .withOpacity(0.9),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          '  Amount Due:',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                            child: Text(
                          '₹ $cashToDisplayed',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 35),
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 58, 233, 64)),
                      onPressed: cashToDisplayed == "No Bills on due!!"
                          ? () {}
                          : _payment,
                      child: const Text(
                        'Pay',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
