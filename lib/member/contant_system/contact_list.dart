import 'package:first_app/member/contant_system/contactListView.dart';
import 'package:first_app/member/contant_system/structure_for_contacts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactListDisplay extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ContactListDisplayState();
  }
}

class _ContactListDisplayState extends State<ContactListDisplay>{
  List<ContactList> contactList=[
    ContactList(contactName: 'kashyap', contactNumber: 9833150385),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                Expanded(child: ListedView(displayList: contactList)),
          ],),
        ),
      ),
    );
  }
}