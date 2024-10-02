import 'package:first_app/member/contant_system/contactListView.dart';
import 'package:first_app/member/contant_system/modal_overlay.dart';
import 'package:first_app/member/contant_system/structure_for_contacts.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class ContactListDisplay extends StatefulWidget {
  const ContactListDisplay({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContactListDisplayState();
  }
}

class _ContactListDisplayState extends State<ContactListDisplay> {
  List<ContactList> contactList = [];

  void _addExpense(ContactList contact) {
    setState(() {
      contactList.add(contact);
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
