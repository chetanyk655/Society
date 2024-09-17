import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//This creates dashboard menu
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(context) {
    const username = "Virat Kohli";
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/dashboard.png'), fit: BoxFit.fill),
      ),
      width: double.infinity,
      height: double.infinity,
      child: Expanded(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: 200,
                    child: Text(
                      "Logged Account",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: 205,
                    child: Text(
                      "Welcome back $username !!!",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    width: 180,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          // Text color
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          elevation: 8, // Elevation for shadow
                          shadowColor: Colors.black, // Shadow color
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          "Bill Payments",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 190,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          // Text color
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          elevation: 8, // Elevation for shadow
                          shadowColor: Colors.black, // Shadow color
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          "Facility Booking",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 190,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          // Text color
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          elevation: 8, // Elevation for shadow
                          shadowColor: Colors.black, // Shadow color
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          "Polls & Survey",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 190,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          // Text color
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          elevation: 8, // Elevation for shadow
                          shadowColor: Colors.black, // Shadow color
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          "Notice Board",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 190,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          // Text color
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          elevation: 8, // Elevation for shadow
                          shadowColor: Colors.black, // Shadow color
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          "Emergency Contacts",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 133,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          // Text color
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          elevation: 8, // Elevation for shadow
                          shadowColor: Colors.black, // Shadow color
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          "Security",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          // Text color
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          elevation: 8, // Elevation for shadow
                          shadowColor: Colors.black, // Shadow color
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          "Market Place",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          // Text color
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          elevation: 8, // Elevation for shadow
                          shadowColor: Colors.black, // Shadow color
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          "Complaints",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          // Text color
                          padding: const EdgeInsets.symmetric(vertical: 23),
                          elevation: 8, // Elevation for shadow
                          shadowColor: Colors.black, // Shadow color
                          backgroundColor: Colors.white,
                        ),
                        child: Text(
                          "Craftsman Contacts",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}