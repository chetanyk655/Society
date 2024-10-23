import 'dart:convert';
import 'package:first_app/admin/admin_drawer.dart';
import 'package:first_app/admin/member_registration.dart';
import 'package:first_app/admin/member_show.dart';
import 'package:first_app/selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_app/services/api.dart';

class AdminDashboard extends StatefulWidget {
  final String response;

  const AdminDashboard({super.key, required this.response});

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  late Future<List<Map<String, dynamic>>> _futureUsers;

  @override
  void initState() {
    super.initState();
    _futureUsers = fetchUsers(widget.response);
  }

  Future<List<Map<String, dynamic>>> fetchUsers(String response) async {
    Map<String, dynamic> parsedJson = jsonDecode(response);
    List<Map<String, dynamic>> items = [];

    if (parsedJson['status_code'] == 200) {
      for (var user in parsedJson['response']) {
        items.add({
          "member_id": user['member_id'].toString(),
          "name": user['name'],
          "house_no": user['house_no'].toString(),
          "email": user['email'],
          "ph_no": user['ph_no'].toString()
        });
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('Admin Dashboard',
              style: TextStyle(color: Colors.white, fontSize: 18)),
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
        drawer: AdminDrawer(),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: _futureUsers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                  child: Text('No members added yet',
                      style: TextStyle(color: Colors.white, fontSize: 18)));
            }

            final items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MemberShow(
                                member_id: items[index]['member_id'],
                                name: items[index]['name'],
                                house_no: items[index]['house_no'],
                                email: items[index]['email'],
                                ph_no: items[index]['ph_no'],
                              )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 0, 0, 0),
                            Color.fromARGB(255, 29, 28, 28),
                            Color.fromARGB(255, 0, 0, 0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Text(
                                  "ID : ${items[index]['member_id']}",
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[index]['name'],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "F/no : ${items[index]['house_no']}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () async {
            final newItem = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MemberRegister()),
            );

            if (newItem != null) {
              setState(() {
                Api()
                    .getMembers()
                    .then((res) => {_futureUsers = fetchUsers(res)});
              });
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
