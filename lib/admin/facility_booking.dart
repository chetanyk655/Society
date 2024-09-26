import 'package:flutter/material.dart';
class FacilityBookingAdmin extends StatelessWidget {
  const FacilityBookingAdmin({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
          ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text('Facility Booking',style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 29, 28, 28),
                Color.fromARGB(255, 0, 0, 0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            
        ),
      child:const Center(child:  Text('NO BOOKINGS',style: TextStyle(color: Colors.white, fontSize: 24)))
      )
    );
  }
}
