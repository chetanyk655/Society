import 'dart:convert';

import 'package:first_app/member/current_signed.dart';
import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';

class PaymentMember extends StatefulWidget {
  const PaymentMember({super.key,required this.money});
  final String money;
  
  @override
  State<StatefulWidget> createState() {
     

    return _PaymentMember(amount: money);
  }
}

class _PaymentMember extends State<PaymentMember> {
  _PaymentMember({required this.amount});
  String amount;
  String cash='10';
  void _payment() {
    Api().deleteBill({
      'email':CurrentSigned.signedEmail
    });
    setState(() {
      cash='0';
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> parsedJson = jsonDecode(amount);
    String cash1 ;
    if(parsedJson['response']['status_code']==200){
      cash1 = parsedJson["response"]![0]["bill_amount"].toString();
    }
    else{
      cash1='0';
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
                          '₹ $cash1',
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
                      onPressed: _payment,
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
