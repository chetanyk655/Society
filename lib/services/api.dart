import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static const baseUrl = "http://<ip>/api/";
  static send(String name, String city, String state) async {
    var url = Uri.parse("${baseUrl}send");
    try {
      final res = await http
          .post(url, body: {"name": name, "city": city, "state": state});

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failed to get response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
