import 'package:first_app/member/contant_system/contact_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:first_app/society_details.dart';
//import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp( ContactListDisplay());
  });
}
