import 'package:first_app/member/contant_system/structure_for_contacts.dart';
import 'package:flutter/material.dart';

class CardForContact extends StatelessWidget{
  CardForContact({super.key,required this.contactCardList});
  final ContactList contactCardList;
  @override
  Widget build(BuildContext context) {
    return Card(
      child:InkWell(
        onTap: (){
          
        },
        child: SizedBox(
        width: 300,
        height: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5,),
            Text('  ${contactCardList.contactName}',),
            Text('  ${contactCardList.contactNumber.toString()}'),
          ],
        ),
      )
      ),
      
    );
  }
}