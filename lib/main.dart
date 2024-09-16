import 'package:first_app/member/contant_system/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
<<<<<<< HEAD
// import 'package:first_app/society_details.dart';
// import 'package:first_app/emergency_contacts.dart';
// import 'package:flutter/rendering.dart';
=======
//import 'package:first_app/society_details.dart';
//import 'package:flutter/rendering.dart';
>>>>>>> f622b648b00b71f2806adbed6e4a6aef8cd6b9b6

void main() {
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
<<<<<<< HEAD
  ]).then((fn) {});
=======
  ]).then((fn) {
    runApp( ContactListDisplay());
  });
>>>>>>> f622b648b00b71f2806adbed6e4a6aef8cd6b9b6
}
