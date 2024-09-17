import 'package:flutter/material.dart';

class ModalContact extends StatefulWidget{
  ModalContact({super.key});
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
      ],
    );
  }
}