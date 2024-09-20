import 'package:first_app/member/contant_system/contact_list.dart';
import 'package:first_app/member/emergency_contacts.dart';
import 'package:first_app/member/feedback.dart';
import 'package:first_app/member/market_place/marketplace_screen.dart';
//import 'package:first_app/member/contant_system/structure_for_contacts.dart';
import 'package:flutter/material.dart';

class NewDashboard extends StatelessWidget{
  const NewDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(onPressed: (){
                Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  const ContactListDisplay()),
                          );
              }, child: const Text('contact')),
              ElevatedButton(onPressed: (){
                Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  MarketplaceScreen()),
                          );
              }, child: const Text('market')),
              ElevatedButton(onPressed: (){
                Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EmergencyContacts()),
                          );
              }, child: const Text('emergency')),
              ElevatedButton(onPressed: (){
                Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const FeedBackScreen()),
                          );
              }, child: const Text('complaint')),
            ],
          ),
        ),
      ),
    );
    
  }
}