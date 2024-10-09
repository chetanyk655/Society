import 'dart:convert';

import 'package:flutter/material.dart';
import 'dummy_data_complaint.dart'; // Import the file containing dummy data
import 'package:first_app/services/api.dart';

class ComplaintFeedbackStatus extends StatefulWidget {
  ComplaintFeedbackStatus({required this.response});
  Map<String, dynamic> response;
  @override
  _ComplaintFeedbackStatusState createState() =>
      _ComplaintFeedbackStatusState(response: response);
}

class _ComplaintFeedbackStatusState extends State<ComplaintFeedbackStatus> {
  _ComplaintFeedbackStatusState({required this.response});
  Map<String, dynamic> response;
  List<Map<String, dynamic>> facilityList = [];

  @override
  void initState() {
    super.initState();

    facilityList = getMultipleDummyData(response).map((facility) {
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
          'Complaint & Feedbacks',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 87, 87, 87),
      ),
      body: facilityList.isEmpty
          ? Center(
              child: Text("No more Complaints or Feedbacks",
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
                      _approveCard(index);
                      // Set the card as approved
                    },
                    onDecline: () {
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
                  color: facility['title'] == "Complaint"
                      ? const Color.fromARGB(255, 255, 0, 0)
                      : const Color.fromARGB(
                          255, 2, 255, 10) // White text color
                  ),
            ),
            SizedBox(height: 8),
            Text(
              facility['email'] ?? 'No email Available',
              style: TextStyle(
                fontSize: 14,
                color:
                    const Color.fromARGB(179, 114, 92, 92), // Light white color
              ),
            ),
            SizedBox(height: 8),
            Text(
              facility['description'] ?? 'No message Available',
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
            SizedBox(height: 8),
            Text(
              'Status : ${facility['status']}', // Display date
              style: TextStyle(
                fontSize: 14,
                color: facility['status'] == "UNAVAILABLE"
                    ? const Color.fromARGB(179, 201, 1, 246)
                    : facility['status'] == "Acknowledged"
                        ? const Color.fromARGB(255, 0, 255, 8)
                        : const Color.fromARGB(
                            255, 255, 17, 0), // Light white color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
