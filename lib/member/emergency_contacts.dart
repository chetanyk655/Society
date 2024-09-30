import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class EmergencyContact extends StatefulWidget {
  const EmergencyContact({super.key});
  @override
  State<StatefulWidget> createState() {
    return _EmergencyContact();
  }
}

class _EmergencyContact extends State<EmergencyContact> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    var status = await Permission.phone.request();
    if (status.isGranted) {
      final Uri phoneUrl = Uri(scheme: 'tel', path: phoneNumber);
      try {
        if (await canLaunch(phoneUrl.toString())) {
          await launch(phoneUrl.toString());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Could not launch call")),
          );
        }
      } catch (e) {
        print("Error launching URL: $e"); // Log the error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Phone call permission denied")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text('Emergency Contacts',
              style: TextStyle(color: Colors.white, fontSize: 18)),
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
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          _makePhoneCall('108');
                        },
                        icon: const Icon(
                          Icons.emergency_outlined,
                          color: Colors.white,
                        ),
                        iconSize: 40,
                      ),
                      const Text('Ambulance',
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          _makePhoneCall('100');
                        },
                        icon: const Icon(
                          Icons.shield_rounded,
                          color: Colors.white,
                        ),
                        iconSize: 40,
                      ),
                      const Text('Police',
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          _makePhoneCall('101');
                        },
                        icon: const Icon(
                          Icons.fire_truck_outlined,
                          color: Colors.white,
                        ),
                        iconSize: 40,
                      ),
                      const Text('Fire Brigade',
                      style: TextStyle(color: Colors.white, fontSize: 24)),
                    ],
                  ),
                ],
              ),
            )));
  }
}
