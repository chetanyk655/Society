import 'package:first_app/member/contant_system/structure_for_contacts.dart';
import 'package:flutter/material.dart';

class ModalContact extends StatefulWidget{
  const ModalContact({super.key,required this.onAddExpense});

  final void Function(ContactList contact) onAddExpense;
  @override
  State<StatefulWidget> createState() {
   
    return _ModalContactState();
  }
}

class _ModalContactState extends State<ModalContact>{
  final _nameController =TextEditingController();
  final _numberController =TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  void _submitExpenseData(){
    final enteredAmount= int.tryParse(_numberController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount<=0||enteredAmount.toString().length<10;
    if(_nameController.text.trim().isEmpty || amountIsInvalid ){
      showDialog(context: context, builder: (ctx)=>
        AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please make sure the entered number is correct'),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(ctx);
            }, child: const Text('okay'))
          ],
        )
      );
      return;
    }
    widget.onAddExpense(ContactList(contactName: _nameController.text, contactNumber: enteredAmount));
    Navigator.pop(context);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          maxLength: 30,
          decoration: const InputDecoration(
            label: Text('Enter Contact Name')
          ),
        ),
        TextField(
          controller: _numberController,
          maxLength: 10,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            prefix: Text('+91 '),
            label: Text('Enter Phone Number')
          ),
        ),
        const SizedBox(height: 10,),
        Row(children: [
          ElevatedButton(onPressed: _submitExpenseData, child: const Text('SAVE')),
          ElevatedButton(onPressed: (){Navigator.pop(context);}, child: const Text('CANCEL')),
        ],)
      ],
    );
  }
}