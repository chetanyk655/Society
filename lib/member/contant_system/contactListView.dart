//import 'package:first_app/member/contant_system/contact_card.dart';
import 'package:first_app/member/contant_system/structure_for_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
//import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:first_app/services/api.dart';

class ListedView extends StatelessWidget {
  ListedView({
    super.key,
    required this.displayList,
    required this.onRemove,
  });

  final void Function(ContactList expense) onRemove;

  final List<ContactList> displayList;

  Future<void> _launchDialer(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: displayList.length,
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              Card(
                color: const Color.fromARGB(255, 135, 124, 25),
                child: InkWell(
                    onTap: () {
                      _launchDialer(
                          displayList[index].contactNumber.toString());
                    },
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                                title: const Text(
                                    'Do you want to delete this contact'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(ctx);
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 135, 124, 25)),
                                      child: const Text('cancel',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16))),
                                  TextButton(
                                      onPressed: () {
                                        String contact = displayList[index]
                                            .contactNumber
                                            .toString();
                                        onRemove(displayList[index]);
                                        Api().deleteContacts(
                                            {"contact": contact});
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 135, 124, 25)),
                                      child: const Text('Delete',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)))
                                ],
                              ));
                    },
                    child: SizedBox(
                      width: 300,
                      height: 70,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 3,
                          ),
                          ProfilePicture(
                            random: false,
                            name: '${displayList[index].contactName}',
                            radius: 25,
                            fontsize: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '  ${displayList[index].contactName}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                '  ${displayList[index].contactNumber.toString()}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              )
            ],
          );
        });
  }
}
