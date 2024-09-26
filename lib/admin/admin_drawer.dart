import 'package:first_app/admin/admin_payment.dart';
import 'package:first_app/admin/member_registration.dart';
import 'package:first_app/admin/notice.dart';
import 'package:first_app/member/contant_system/contact_list.dart';
import 'package:flutter/material.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});
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
                  'Maintance Payment',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminPayment()),
                  );
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
                  Icons.message,
                  size: 26,
                  color: Colors.white,
                ),
                title: const Text(
                  'Member Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MemberRegister()),
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
                onTap: () {},
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
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(
                  Icons.security,
                  size: 26,
                  color: Colors.white,
                ),
                title: const Text(
                  'Security',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onTap: () {},
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
                onTap: () {},
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
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactListDisplay()),
                  );
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
                onTap: () {},
              ),
                ],
              ),
            
            
          ]),
        ));
  }
}
