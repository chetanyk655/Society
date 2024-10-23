import 'dart:convert';
import 'package:first_app/admin/Complaint_and_feedbak_admin.dart';
import 'package:first_app/admin/bill_controller.dart';
import 'package:first_app/admin/facility_booking.dart';
import 'package:first_app/admin/marketplace_admin.dart';
import 'package:first_app/admin/notice.dart';
import 'package:first_app/member/contant_system/contact_list.dart';
import 'package:first_app/member/emergency_contacts.dart';
import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';

// ignore: must_be_immutable
class AdminDrawer extends StatelessWidget {
  Map<String, dynamic> parsedJsonComplaint = {};
  Map<String, dynamic> parsedJsonFeedback = {};
  AdminDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: const Color.fromARGB(255, 35, 35, 35),
        child: SingleChildScrollView(
          child: Column(children: [
            const DrawerHeader(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Color.fromARGB(255, 187, 255, 2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.settings_applications,
                    size: 48,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Text(
                    'Controls',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.money,
                    size: 26,
                    color: Colors.white,
                  ),
                  title: const Text(
                    ' Payment Controller',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Api().getBills().then((res) => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AdminPaymentControl(response: res),
                              ))
                        });
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.message,
                    size: 26,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Notice',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NoticePage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.notification_add,
                    size: 26,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Complaint and Feedback',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    Api()
                        .getComplaints()
                        .then((res) => parsedJsonComplaint = jsonDecode(res));
                    Api().getFeedbacks().then((res) => {
                          parsedJsonFeedback = jsonDecode(res),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminComplaintFeedback(
                                          response: {
                                            "complaints": parsedJsonComplaint,
                                            "feedbacks": parsedJsonFeedback
                                          })))
                        });
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.calendar_month,
                    size: 26,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Facility Booking',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Api().getFacilities().then((res) => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FacilityBookingScreen(response: res)))
                        });
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.shopping_bag_outlined,
                    size: 26,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Market Place',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    Api().getProducts().then((res) => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MarketPlacePageAdmin(
                                response: res,
                              ),
                            ),
                          )
                        });
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.contact_mail_sharp,
                    size: 26,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Contact List',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    Api().getContacts().then((res) => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContactListDisplay(
                                  parsedJson: jsonDecode(res)),
                            ),
                          )
                        });
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.emergency,
                    size: 26,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Emergency Contacts',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EmergencyContact(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ]),
        ));
  }
}
