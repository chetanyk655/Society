import 'package:first_app/member/contant_system/structure_for_contacts.dart';
import 'package:first_app/member/current_signed.dart';
import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';
//import 'package:first_app/member/current_signed.dart';

class ModalContact extends StatefulWidget {
  const ModalContact({super.key, required this.onAddExpense});

  final void Function(ContactList contact) onAddExpense;
  @override
  State<StatefulWidget> createState() {
    return _ModalContactState();
  }
}

class _ModalContactState extends State<ModalContact> {
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  void _submitExpenseData() {
    final enteredAmount = int.tryParse(_numberController.text);
    final amountIsInvalid = enteredAmount == null ||
        enteredAmount <= 0 ||
        enteredAmount.toString().length < 10;
    if (_nameController.text.trim().isEmpty || amountIsInvalid) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid Input'),
                content: const Text(
                    'Please make sure the entered number is correct'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text('okay'))
                ],
              ));
      return;
    }

    widget.onAddExpense(ContactList(
        contactName: _nameController.text, contactNumber: enteredAmount));
    Api().saveContact({
      "name": _nameController.text,
      "ph": _numberController.text,
      "uploader": CurrentSigned.signedEmail,
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            style: const TextStyle(color: Colors.white, fontSize: 16),
            controller: _nameController,
            maxLength: 30,
            decoration: const InputDecoration(
                label: Text('Enter Contact Name',
                    style: TextStyle(color: Colors.white, fontSize: 16))),
          ),
          TextField(
            style: const TextStyle(color: Colors.white, fontSize: 16),
            controller: _numberController,
            maxLength: 10,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                prefix: Text('+91 ',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                label: Text('Enter Phone Number',
                    style: TextStyle(color: Colors.white, fontSize: 16))),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: _submitExpenseData,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 135, 124, 25)),
                  child: const Text('SAVE',
                      style: TextStyle(color: Colors.white, fontSize: 16))),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 135, 124, 25)),
                  child: const Text('CANCEL',
                      style: TextStyle(color: Colors.white, fontSize: 16))),
            ],
          )
        ],
      ),
    );
  }
}
