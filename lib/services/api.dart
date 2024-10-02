import 'dart:ffi';

import 'package:first_app/society_details.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:first_app/member/current_signed.dart';
import 'package:image_picker/image_picker.dart';

class Api {
  static const baseUrl = "http://192.168.1.4:2000/api";
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
      return res.body;
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

  Future storeMaintenance(body) async {
    var url = Uri.parse("$baseUrl/bills/maintenance");
    final res = await http.post(url, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json', // Specify that you're sending JSON
    });
    if (res.statusCode == 200) {
      return res.body;
    }
  }

  Future updateBillStatus(body) async {
    var url = Uri.parse("$baseUrl/bills/paydone");
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

  Future deleteBill(body) async {
    var url = Uri.parse("$baseUrl/bills");
    final res = await http.delete(url, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json', // Specify that you're sending JSON
    });
    if (res.statusCode == 200) {
      return res.body;
    }
  }

  // Update the uploadproduct method in api.dart
  Future<void> uploadproduct(Map<String, String> body, XFile image) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'http://192.168.1.4:2000/api/marketplace'), // Update with your server URL
    );

    // Add the image file to the request
    request.files.add(
      await http.MultipartFile.fromPath('image', image.path),
    );

    // Add other fields from the body map
    request.fields['p_name'] = body['name']!; // Product name
    request.fields['price'] = body['price']!; // Price
    request.fields['descp'] = body['desc']!; // Description
    request.fields['filename'] = body['filename']!; // Filename

    // Send the request
    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      print('Upload success: $responseData');
    } else {
      print('Upload failed: ${response.statusCode}');
    }
  }

  Future getProducts() async {
    var url = Uri.parse("$baseUrl/marketplace");
    final res = await http.post(url, headers: {
      'Content-Type': 'application/json', // Specify that you're sending JSON
    });

    if (res.statusCode == 200) {
      return res;
    } else {
      return "Can't get products";
    }
  }

  Future uploadFacility(body) async {
    var url = Uri.parse("$baseUrl/facility");
    final res = await http.post(url, body: body);
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future getSingleFacility() async {
    var url = Uri.parse(
        "$baseUrl/facility/singleFacility?email=${CurrentSigned.signedEmail}");
    final res = await http.get(url, headers: {
      'Content-Type': 'application/json', // Specify that you're sending JSON
    });

    if (res.statusCode == 200) {
      return res.body;
    } else {
      return false;
    }
  }

  Future getFacilities() async {
    var url = Uri.parse("$baseUrl/facility");
    final res = await http.get(url, headers: {
      'Content-Type': 'application/json', // Specify that you're sending JSON
    });

    if (res.statusCode == 200) {
      return res.body;
    } else {
      return false;
    }
  }

  Future saveContact(body) async {
    var url = Uri.parse("$baseUrl/contact");
    final res = await http.post(url, body: body);

    if (res.statusCode == 200) {
      return res;
    } else {
      return false;
    }
  }

  Future getContacts() async {
    var url = Uri.parse("$baseUrl/contact");
    final res = await http.get(url);

    if (res.statusCode == 200) {
      return res;
    } else {
      return false;
    }
  }

  Future deleteContacts(body) async {
    var url = Uri.parse("$baseUrl/contact");
    final res = await http.delete(url, body: body);

    if (res.statusCode == 200) {
      return res;
    } else {
      return false;
    }
  }
}
