import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EmergencyContacts extends StatefulWidget {
  const EmergencyContacts({super.key});

  @override
  State<EmergencyContacts> createState() {
    return _EmergencyContactState();
  }
}

class _EmergencyContactState extends State<EmergencyContacts> {
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: 
           Center(
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                padding: const EdgeInsets.only(right: 310),
                alignment: Alignment.center,
                child: IconButton(
                  alignment: Alignment.centerLeft,
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/images/left-arrow-back-svgrepo-com.svg', // Path to your SVG asset
                    width: 25.0, // Set the width of the SVG icon
                    height: 25.0,
                    // Set the height of the SVG icon
                  ),
                  iconSize: 25.0,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "EMERGENCY CONTACTS",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(bottom: 25)),
                        const Icon(
                          Icons.local_police_sharp,
                          size: 50,
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 25)),
                        const Icon(
                          Icons.fire_truck,
                          size: 50,
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 25)),
                        SvgPicture.asset(
                          'assets/ambulance-svgrepo-com.svg',
                          width: 25,
                          height: 25,
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 25)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 115, vertical: 10),
                        ),
                        child: const Text(
                          style: TextStyle(
                            fontSize: 26,
                          ),
                          "POLICE",
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 55, bottom: 55),
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 10),
                          ),
                          child: const Text(
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              "FIRE TRUCK"),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 95, vertical: 10),
                        ),
                        child: const Text(
                          "AMBULANCE",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ]),
          ),
        ),
      
    );
  }
}
