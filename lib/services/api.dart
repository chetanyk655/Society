import 'dart:ffi';

import 'package:first_app/society_details.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static const baseUrl = "http://192.168.1.7:5000/api";
  send(String name, String city, String state) async {
    var url = Uri.parse("${baseUrl}/send");
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

  getDetails() async {
    var url = Uri.parse("${baseUrl}getdetails");
    final res = await http.get(url);
    try {
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print(data);
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  updateDetails(i, body) async {
    var url = Uri.parse("$baseUrl/updateDetails");
    print(body);
    final res = await http.put(url, body: body);
    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print("failed to update data");
    }
  }

  // ignore: non_constant_identifier_names
  Future checklogin(body) async {
    var url = Uri.parse("$baseUrl/checklogin");
    final res = await http.post(url, body: body);

    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future registration({email, username, password}) async {
    var url = Uri.parse("$baseUrl/registration");
    print(username);
    final res = await http.post(url,
        body: {"username": username, "password": password, "email": email});
    if (res.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}