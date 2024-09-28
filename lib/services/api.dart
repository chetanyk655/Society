import 'dart:ffi';

import 'package:first_app/society_details.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:first_app/member/current_signed.dart';

class Api {
  static const baseUrl = "https://0225-103-51-138-51.ngrok-free.app/api";
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
    final res = await http.post(
      url,
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json', // Specify that you're sending JSON
      },
    );

    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future registration(body) async {
    var url = Uri.parse("$baseUrl/registration");
    final res = await http.post(
      url,
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json', // Specify that you're sending JSON
      },
    );
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future storeNotice(body) async {
    var url = Uri.parse("$baseUrl/store-notice");
    final res = await http.post(url, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json', // Specify that you're sending JSON
    });
    if (res.statusCode == 200) {
      return res;
    }
  }

  Future getNotice() async {
    var url = Uri.parse("$baseUrl/get-notice");
    final res = await http.get(url);
    if (res.statusCode == 200) {
      return res.body.toString();
    } else {
      return null;
    }
  }

  Future storeComplaintAndFeedback(body) async {
    var url = Uri.parse("$baseUrl/${body['ticket']}");
    final res = await http.post(url, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json', // Specify that you're sending JSON
    });
    if (res.statusCode == 200) {
      return res;
    }
  }

  Future storeBill(body) async {
    var url = Uri.parse("$baseUrl/bills");
    final res = await http.post(url, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json', // Specify that you're sending JSON
    });
    if (res.statusCode == 200) {
      return res.body;
    }
  }

  Future getBill() async {
    try {
      final url =
          Uri.parse('$baseUrl/bills?email=${CurrentSigned.signedEmail}');

      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });

      if (res.statusCode == 404) {
        return jsonDecode(res.body.toString()); // Parse the 404 response body
      }

      if (res.statusCode == 200) {
        return jsonDecode(
            res.body.toString()); // Parse and return the successful response
      }

      // If the status code is something else, handle it
      throw Exception('Failed to load bills: ${res.statusCode}');
    } catch (e) {
      print('Error fetching bills: $e');
      return null; // Return null or handle error properly
    }
  }

  Future<void> uploadImage(String base64Image) async {
    final response = await http.post(
      Uri.parse('http://your-backend-url/upload'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({'image': base64Image}),
    );

    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Failed to upload image');
    }
  }
}
