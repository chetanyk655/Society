import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:first_app/services/api.dart';
import 'package:first_app/member/current_signed.dart';

final formatter = DateFormat.yMd();

class FacilityBookingScreen extends StatefulWidget {
  const FacilityBookingScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _FacilityBookingScreen();
  }
}

class _FacilityBookingScreen extends State<FacilityBookingScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  DateTime? _selectedDate;
  DateTime? pickedDate;
  void _presentDatePicker() async {
    final now = DateTime.now();

    // Set the firstDate to now to allow selection of today and future dates
    final firstDate = now;

    // Set lastDate to a far future date
    final lastDate = DateTime(2100);
    pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: _nameController,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
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
                      SizedBox(
                        width: 150,
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: _timeController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: false),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              hintText: 'Enter the timings(hh,mm)',
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Column(
                    children: [
                      TextField(
                        maxLines: 10,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                        controller: _descController,
                        decoration: const InputDecoration(
                          hintText:
                              'Enter event details and what facility you want.....',
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 18),
                          fillColor: Color.fromARGB(255, 0, 0, 0),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: 140,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor:
                                const Color.fromARGB(255, 255, 0, 0),
                          ),
                          onPressed: () {
                            print(CurrentSigned.signedEmail);
                            Api().uploadFacility({
                              "name": _nameController.text,
                              "date": pickedDate.toString(),
                              "time": _timeController.text,
                              "desc": _descController.text,
                              "user_mail": CurrentSigned.signedEmail
                            });
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 20),
                          ),
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
