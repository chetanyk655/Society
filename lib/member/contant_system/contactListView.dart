import 'package:first_app/member/contant_system/structure_for_contacts.dart';
import 'package:flutter/material.dart';

class ListedView extends StatelessWidget{
  ListedView({super.key,required this.displayList});
  final List<ContactList> displayList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: displayList.length,
      itemBuilder: (ctx,index){
        return Column(
          children: [
            Text(displayList[index].contactName),
            Text((displayList[index].contactNumber).toString()),
          ],
        );
      }
      );
  }
}