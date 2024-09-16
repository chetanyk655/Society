/*import 'package:flutter/material.dart';
 class StartScreen extends StatefulWidget{
  const StartScreen({super.key});
   @override
  State<StartScreen> createState() {
     return _StartScreenState();
   }
 }

 class _StartScreenState extends State<StartScreen>{
   String temp = 'hello';
   void login(){
     setState(() {
      temp='bye';
   });
 }
  void login1(){
     setState(() {
       temp='meow';
     });
   }
   void login2(){
     setState(() {
       temp='hello';
     });
   }
   @override
   Widget build(context){
     Widget Deceider = Home(login,login1);
     if(temp=='bye'){
       Deceider=MemberLogin(login2);
     }
     else if(temp=='meow'){
       Deceider= AdminHome(login2);
     }
     else{
       Deceider = Home(login,login1);
     }
     return  Scaffold(
         body: Container(
           decoration: const BoxDecoration(
             gradient: LinearGradient(colors: [
               Color.fromARGB(255, 5, 17, 85),
               Color.fromARGB(255, 5, 17, 85),
               ], begin: Alignment.topLeft, end: Alignment.bottomLeft),
           ),
           child:Deceider,
         ),
       );
   }
 }*/