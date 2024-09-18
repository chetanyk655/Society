//import 'package:first_app/member/contant_system/contact_card.dart';
import 'package:first_app/member/contant_system/structure_for_contacts.dart';
import 'package:flutter/material.dart';

class ListedView extends StatelessWidget{
  ListedView({super.key,required this.displayList,required this.onRemove});

  final void Function(ContactList expense) onRemove;

  final List<ContactList> displayList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: displayList.length,
      itemBuilder: (ctx,index){
        return Column(
          children: [
            Card(
      child:InkWell(
        onLongPress: (){
          showDialog(context: context, builder: (ctx)=>
        AlertDialog(
          title: const Text('Do you want to delete this contact'),
          
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(ctx);
            }, child: const Text('cancel')),
            TextButton(onPressed: (){onRemove(displayList[index]);}, child: const Text('Delete'))
          ],
        )
      );
        },
        child: SizedBox(
        width: 300,
        height: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5,),
            Text('  ${displayList[index].contactName}',),
            Text('  ${displayList[index].contactNumber.toString()}'),
          ],
        ),
      )
      ),
      
    )
          ],
        );
      }
      );
  }
}