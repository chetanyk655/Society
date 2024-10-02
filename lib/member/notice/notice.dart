import 'package:first_app/member/notice/notice_popup.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class NoticeMember extends StatelessWidget {
  NoticeMember({super.key, required this.response});
  String response;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> parsedJson = jsonDecode(response);

    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          title: const Text('Notice',
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
            child: Center(child: NoticeDisplay(notice: parsedJson))));
  }
}

class NoticeDisplay extends StatelessWidget {
  const NoticeDisplay({super.key, required this.notice});
  final Map<String, dynamic> notice;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ListView.builder(
        reverse: true,
        shrinkWrap: true,
        itemCount: notice["response"].length,
        itemBuilder: (ctx, index) => InkWell(
          onTap: () {
            Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NoticePopup(content:notice["response"][index]["contents"].toString() , date: notice["response"][index]["date"].toString()),
                          ),
                        );
          },
          child: Card(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(notice["response"][index]["time"].toString()),
                    const SizedBox(
                      width: 200,
                    ),
                    Text(notice["response"][index]["date"].toString()),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        notice["response"][index]["contents"].toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
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
  }
}
