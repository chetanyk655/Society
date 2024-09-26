import 'package:flutter/material.dart';

class PaymentMember extends StatefulWidget{

  
  PaymentMember({super.key});
  @override
  State<StatefulWidget> createState() {
    return _PaymentMember();
  }
}

class _PaymentMember extends State<PaymentMember>{
  int amountDue=1000;
  void _payment(){
    setState(() {
      amountDue=0;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
          ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text('Maintaince Bill',style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 29, 28, 28),
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 29, 28, 28),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            
        ),
      child:Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
                  
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 28, 245, 35).withOpacity(0.55),
                      const Color.fromARGB(255, 38, 243, 44).withOpacity(0.9),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                )
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  const Text('  Amount Due:',style: TextStyle(color: Colors.white, fontSize: 24),),
                  const SizedBox(height: 20,),
                  Center(child: Text('₹ $amountDue',style: const TextStyle(color: Colors.white, fontSize: 35),)),
                  
                ],
              ),
            ),
            const SizedBox(height: 200,),
            SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 58, 233, 64)
                  ),
                    onPressed: _payment,
                    child: const Text('Pay',style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                ),
            
          ],
          
        ),
        
      )
      )
    );
  }
}

//const Center(child:  Text('NO NOTICE',style: TextStyle(color: Colors.white, fontSize: 24)))