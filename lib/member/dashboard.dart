import 'package:first_app/member/contant_system/contact_list.dart';
import 'package:first_app/member/emergency_contacts.dart';
import 'package:first_app/member/feedback.dart';
import 'package:first_app/member/market_place/marketplace_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//This creates dashboard menu
class Dashboard extends StatefulWidget {
  const Dashboard({super.key,});
  
  @override
  State<StatefulWidget> createState() {
    return _DashBoardState();
  }

  
}
class _DashBoardState extends State<Dashboard>{

  @override
  Widget build(context) {
    const username = "Virat Kohli";
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/dashboard.png'), fit: BoxFit.fill),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Row(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
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
                  height: 60,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        // Text color
                        padding: const EdgeInsets.all(10),
                        elevation: 4, // Elevation for shadow
                        shadowColor: Colors.black, // Shadow color
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        "Bill Payments",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        // Text color
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        elevation: 4, // Elevation for shadow
                        shadowColor: Colors.black, // Shadow color
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        "Facility Booking",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        // Text color
                        padding: const EdgeInsets.all(10),
                        elevation: 4, // Elevation for shadow
                        shadowColor: Colors.black, // Shadow color
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        "Polls & Survey",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        // Text color
                        padding: const EdgeInsets.all(10),
                        elevation: 4, // Elevation for shadow
                        shadowColor: Colors.black, // Shadow color
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        "Notice Board",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const EmergencyContacts()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        // Text color
                        padding: const EdgeInsets.all(10),
                        elevation: 4, // Elevation for shadow
                        shadowColor: Colors.black, // Shadow color
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        "Emergency Contacts",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
            const SizedBox(
              width: 0,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 160,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        // Text color
                        padding: const EdgeInsets.all(10),
                        elevation: 4, // Elevation for shadow
                        shadowColor: Colors.black, // Shadow color
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        "Security",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  MarketplaceScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        // Text color
                        padding: const EdgeInsets.all(10),
                        elevation: 4, // Elevation for shadow
                        shadowColor: Colors.black, // Shadow color
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        "Market Place",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  height: 48,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  FeedBackScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        // Text color
                        padding: const EdgeInsets.all(10),
                        elevation: 4, // Elevation for shadow
                        shadowColor: Colors.black, // Shadow color
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        "Complaints and Feedback",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  height: 45,
                ),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ContactListDisplay()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        // Text color
                        padding: const EdgeInsets.all(5),
                        elevation: 4, // Elevation for shadow
                        shadowColor: Colors.black, // Shadow color
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        "Craftsman Contacts",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}