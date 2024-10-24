import 'package:first_app/member/contant_system/contactListView.dart';
import 'package:first_app/member/contant_system/modal_overlay.dart';
import 'package:first_app/member/contant_system/structure_for_contacts.dart';
import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';
import 'package:first_app/member/current_signed.dart';

class ContactListDisplay extends StatefulWidget {
  ContactListDisplay({super.key, required this.parsedJson});
  Map<String, dynamic> parsedJson = {};
  @override
  State<StatefulWidget> createState() {
    return _ContactListDisplayState(parsedJson: parsedJson);
  }
}

class _ContactListDisplayState extends State<ContactListDisplay> {
  _ContactListDisplayState({required this.parsedJson});

  Map<String, dynamic> parsedJson = {};

  List<ContactList> contactList = [];

  void _addExpense(ContactList contact) {
    setState(() {
      contactList.add(contact);
      parsedJson['response'] = {};
    });
  }

  void _removeContact(ContactList contact) {
    final expenseIndex = contactList.indexOf(contact);
    setState(() {
      contactList.remove(contact);
      Navigator.pop(context);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: const Duration(seconds: 3),
          content: const Text('Contact Deleted'),
          action: SnackBarAction(
              label: 'undo',
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  Api().saveContact({
                    "name": contact.contactName,
                    "ph": contact.contactNumber.toString(),
                    "uploader": CurrentSigned.signedEmail,
                  });
                  contactList.insert(expenseIndex, contact);
                });
              })),
    );
  }

  void _openAddContactOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      context: context,
      builder: (ctx) => ModalContact(
        onAddExpense: _addExpense,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < parsedJson['response'].length; i++) {
      contactList.add(ContactList(
          contactName: parsedJson['response'][i]['con_name'],
          contactNumber: int.parse(parsedJson['response'][i]['con_no'])));
    }

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Contact List',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 29, 28, 28),
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 29, 28, 28)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: ListedView(
                  displayList: contactList,
                  onRemove: _removeContact,
                ),
              ),
              ElevatedButton(
                onPressed: _openAddContactOverlay,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 135, 124, 25)),
                child: const Text(
                  'Add new contact',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 30)
            ],
          ),
        ));
  }
}
