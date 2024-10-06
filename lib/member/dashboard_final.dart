import 'package:first_app/admin/facility_booking.dart';
import 'package:first_app/member/Complaint_and_feedback.dart';
import 'package:first_app/member/contant_system/contact_list.dart';
import 'package:first_app/member/contant_system/structure_for_contacts.dart';
import 'package:first_app/member/emergency_contacts.dart';
import 'package:first_app/member/facility_booking_screen.dart';
import 'package:first_app/member/market_place/marketplace_screen.dart';
// import 'package:first_app/member/contant_system/contact_list.dart';
import 'package:first_app/member/notice/notice.dart';
import 'package:first_app/member/payment.dart';
import 'package:first_app/member/security_call.dart';
import 'package:first_app/selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';
import 'dart:convert';
import 'package:first_app/member/SecurityMember.dart';

class DashBoardFinal extends StatelessWidget {
  const DashBoardFinal({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          automaticallyImplyLeading: false,
          title: const Text(
            'Menu Bar',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectionScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.logout)),
          ],
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
          child: GridView(
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            children: [
              InkWell(
                onTap: () {
                  Api().getBill().then((res) => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentMember(
                              bill: res,
                            ),
                          ),
                        )
                      });
                },
                splashColor: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 28, 245, 35)
                                .withOpacity(0.55),
                            const Color.fromARGB(255, 38, 243, 44)
                                .withOpacity(0.9),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                    child: const Text(
                      'Bill Payment',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ),
              InkWell(
                onTap: () {
                  Api().getSecurity().then((res) => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecurityMember(
                              response: res,
                            ),
                          ),
                        )
                      });
                },
                splashColor: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [
                          Colors.amber.withOpacity(0.55),
                          Colors.amber.withOpacity(0.9),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )),
                  child: const Text('Security',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
              InkWell(
                onTap: () {
                  Api().getNotice().then((res) => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NoticeMember(response: res.toString()),
                          ),
                        )
                      });
                },
                splashColor: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.withOpacity(0.55),
                            Colors.blue.withOpacity(0.9),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                    child: const Text('Notice',
                        style: TextStyle(color: Colors.white, fontSize: 18))),
              ),
              InkWell(
                onTap: () {
                  Api().getSingleFacility().then((res) => print(res));
                  Api().getFacilities().then((res) => print(res));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FacilityBookingScreen(),
                      ));
                },
                splashColor: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            Colors.pink.withOpacity(0.55),
                            Colors.pink.withOpacity(0.9),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                    child: const Text(
                      'Facility Booking',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComplaintAndFeedback(),
                    ),
                  );
                },
                splashColor: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple.withOpacity(0.55),
                            Colors.purple.withOpacity(0.9),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                    child: const Text(
                      'Complaint and Feedback',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ),
              InkWell(
                onTap: () {
                  Api().getProducts().then((res) => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MarketplacePage(
                              response: res,
                            ),
                          ),
                        )
                      });
                },
                splashColor: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 2, 241, 225)
                                .withOpacity(0.55),
                            const Color.fromARGB(255, 2, 241, 225)
                                .withOpacity(0.9),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                    child: const Text('Market Place',
                        style: TextStyle(color: Colors.white, fontSize: 18))),
              ),
              InkWell(
                onTap: () {
                  Api().getContacts().then((res) => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ContactListDisplay(parsedJson: jsonDecode(res)),
                          ),
                        )
                      });
                },
                splashColor: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 255, 230, 0)
                                .withOpacity(0.55),
                            const Color.fromARGB(255, 255, 230, 0)
                                .withOpacity(0.9),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                    child: const Text('Contact List',
                        style: TextStyle(color: Colors.white, fontSize: 18))),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EmergencyContact(),
                    ),
                  );
                },
                splashColor: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            Colors.red.withOpacity(0.55),
                            Colors.red.withOpacity(0.9),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )),
                    child: const Text('Emergency Contacts',
                        style: TextStyle(color: Colors.white, fontSize: 18))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
