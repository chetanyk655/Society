import 'dart:convert';
import 'package:flutter/material.dart';
import 'dummy_data_facility.dart'; // Import the file containing dummy data
import 'package:first_app/services/api.dart';

class FacilityBookingScreen extends StatefulWidget {
  FacilityBookingScreen({required this.response});
  String response;
  @override
  _FacilityBookingScreenState createState() =>
      _FacilityBookingScreenState(response: response);
}

class _FacilityBookingScreenState extends State<FacilityBookingScreen> {
  _FacilityBookingScreenState({required this.response});
  String response;
  List<Map<String, dynamic>> facilityList = [];
  Map<String, dynamic> parsedJson = {};

  @override
  void initState() {
    super.initState();
    parsedJson = jsonDecode(response);
    print(parsedJson);

    facilityList = getMultipleDummyData(parsedJson).map((facility) {
      return {'data': facility, 'approved': false}; // Adding approval status
    }).toList();
  }

  // Method to remove the card (on decline)
  void _removeCard(int index) {
    setState(() {
      facilityList.removeAt(index);
    });
  }

  // Method to approve the card (remove buttons only)
  void _approveCard(int index) {
    setState(() {
      facilityList[index]['approved'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FACILITY BOOKING',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 87, 87, 87),
      ),
      body: facilityList.isEmpty
          ? Center(
              child: Text("No more bookings",
                  style: TextStyle(color: const Color.fromARGB(255, 8, 7, 7))))
          : Container(
              color: const Color.fromARGB(
                  255, 255, 255, 255), // Set background color to black
              padding: EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: facilityList.length,
                itemBuilder: (context, index) {
                  return FacilityCard(
                    facility: facilityList[index]['data'],
                    isApproved: facilityList[index]['approved'],
                    onApprove: () {
                      final email = facilityList[index]['data']['email'];
                      final id = facilityList[index]['data']['id'];
                      print("HEelo$id");
                      Api().changeFacilityStatus(email, id, "Approved");
                      _approveCard(index);
                      // Set the card as approved
                    },
                    onDecline: () {
                      final email = facilityList[index]['data']['email'];
                      final id = facilityList[index]['data']['id'];
                      Api().changeFacilityStatus(email, id, "Declined");
                      _removeCard(index); // Remove the card
                    },
                  );
                },
              ),
            ),
    );
  }
}

class FacilityCard extends StatelessWidget {
  final Map<String, dynamic> facility; // Change type to dynamic to include date
  final bool isApproved;
  final VoidCallback onApprove;
  final VoidCallback onDecline;

  FacilityCard({
    required this.facility,
    required this.isApproved,
    required this.onApprove,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 16.0),
      color: const Color.fromARGB(
          255, 255, 255, 255), // Light black color for the card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              facility['title'] ?? 'No Title Available',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:
                    const Color.fromARGB(255, 14, 14, 14), // White text color
              ),
            ),
            SizedBox(height: 8),
            Text(
              facility['email'] ?? 'No Description Available',
              style: TextStyle(
                fontSize: 14,
                color:
                    const Color.fromARGB(179, 114, 92, 92), // Light white color
              ),
            ),
            SizedBox(height: 8),
            Text(
              facility['description'] ?? 'No email Available',
              style: TextStyle(
                fontSize: 14,
                color:
                    const Color.fromARGB(179, 114, 92, 92), // Light white color
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Date: ${facility['date'] ?? 'No Date Available'}', // Display date
              style: TextStyle(
                fontSize: 14,
                color:
                    const Color.fromARGB(179, 57, 10, 243), // Light white color
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Time: ${facility['time'] ?? 'No time Available'}', // Display date
              style: TextStyle(
                fontSize: 14,
                color:
                    const Color.fromARGB(179, 57, 10, 243), // Light white color
              ),
            ),
            SizedBox(height: 16),
            // Only show buttons if the card hasn't been approved or declined
            if (!isApproved)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed:
                        onApprove, // Handle approve action (hide buttons)
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text('Approve'),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: onDecline, // Handle decline action (remove card)
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text('Decline'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
