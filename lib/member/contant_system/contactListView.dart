//import 'package:first_app/member/contant_system/contact_card.dart';
import 'package:first_app/member/contant_system/structure_for_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import  'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class ListedView extends StatelessWidget{
  _makingPhoneCall(String number) async {
  var url = Uri.parse("tel:$number");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

 const  ListedView({super.key,required this.displayList,required this.onRemove});

 
  final void Function(ContactList expense) onRemove;

  final List<ContactList> displayList;
  @override
  Widget build(BuildContext context) {
    return 
       ListView.builder(
        
        itemCount: displayList.length,
        itemBuilder: (ctx,index){
          return Column(
            children: [
              Card(
        color: const Color.fromARGB(255, 135, 124, 25),        
        child:InkWell(
          onDoubleTap: ()async{
             var url = Uri.parse("tel:76354726r");
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
          },
          onLongPress: (){
            showDialog(context: context, builder: (ctx)=>
              AlertDialog(
                title: const Text('Do you want to delete this contact'),
                
                actions: [
                  TextButton(
                    onPressed: (){
                    Navigator.pop(ctx);
                  },
                  style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 135, 124, 25)
                      ),
                  child: const Text('cancel', style: TextStyle(color: Colors.white, fontSize: 16))),
                  TextButton(onPressed: (){onRemove(displayList[index]);},style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 135, 124, 25)
                      ), child: const Text('Delete', style: TextStyle(color: Colors.white, fontSize: 16)))
                ],
              )
           );
          },
          
          child:  SizedBox(
          
          width: 300,
          height: 70,
          child: Row(
            children: [
              const SizedBox(width: 3,),
               ProfilePicture(
                random: false,
                  name: '${displayList[index].contactName}',
                  radius: 25,
                  fontsize: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const SizedBox(height: 5,),
                  Text('  ${displayList[index].contactName}',style:const TextStyle(color: Colors.white, fontSize: 16),),
                  Text('  ${displayList[index].contactNumber.toString()}',style:const TextStyle(color: Colors.white, fontSize: 16),),
                ],
              ),
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