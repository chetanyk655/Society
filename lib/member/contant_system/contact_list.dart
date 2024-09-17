import 'package:first_app/member/contant_system/contactListView.dart';
import 'package:first_app/member/contant_system/modal_overlay.dart';
import 'package:first_app/member/contant_system/structure_for_contacts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactListDisplay extends StatefulWidget{
  const ContactListDisplay({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ContactListDisplayState();
  }
}

class _ContactListDisplayState extends State<ContactListDisplay>{
  List<ContactList> contactList=[
    ContactList(contactName: 'kashyap', contactNumber: 9833150385),
  ];

  void _addExpense(ContactList contact){
    
    setState(() {
      contactList.add(contact);
    });
    
  }

  void _removeContact(ContactList contact){
    final expenseIndex = contactList.indexOf(contact);
    setState(() {
      contactList.remove(contact);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Contact Deleted'),
      action: SnackBarAction(
        label: 'undo',
        onPressed: (){
          setState(() {
            contactList.insert(expenseIndex,contact);
          });
        })
      ),
      );
  }

  void _openAddContactOverlay(){
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) =>  ModalContact(onAddExpense: _addExpense,),
    );
  } 
  @override
  Widget build(BuildContext context) {
    return Column(
      
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              SafeArea(
                left: false,
                top: true,
                bottom: true,
                right: false,
                child: Text(
                        "Contact List",
                        style: GoogleFonts.nunito(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                               ),
                        textAlign: TextAlign.center,
                        ),
              ),
              Expanded(child: ListedView(displayList: contactList),),
              ElevatedButton(onPressed: _openAddContactOverlay, child: const Text('Add new contact')),
              const SizedBox(height:30)              
              
        ],);
      
    
  }
}