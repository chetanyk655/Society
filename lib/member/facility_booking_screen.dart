
import 'package:flutter/material.dart';


import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class FacilityBookingScreen extends StatefulWidget {
  const FacilityBookingScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _FacilityBookingScreen();
  }
}

class _FacilityBookingScreen extends State<FacilityBookingScreen> {
  DateTime? _selectedDate;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 40, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
      
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        title: const Text(
          'Facility Booking',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
                  Color.fromARGB(255, 29, 28, 28),
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 29, 28, 28)
                ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  const TextField(
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.multiline,
                    
                    decoration: InputDecoration(
                    
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        hintText: 'Event Name',
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Expanded(
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'No date selected'
                            : formatter.format(_selectedDate!),
                        style: const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Transform.scale(
                        scale: 1.2,
                        child: IconButton(
                          color: Colors.white,
                          onPressed: _presentDatePicker,
                          icon: const Icon(
                            Icons.calendar_month,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const SizedBox(
                        width: 150,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              hintText: 'Enter the timings',
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Column(
                    children: [
                      const TextField(
                        maxLines: 10,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        decoration: InputDecoration(
                          hintText: 'Enter your reason here...',
                          hintStyle: TextStyle(color: Colors.white, fontSize: 18),
                          fillColor: Color.fromARGB(255, 0, 0, 0),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: 140,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                          ),
                          onPressed: () {},
                          child: const Text('Submit',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255),fontSize: 20),),
                        ),
                      )
                    ],
                  )
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
