import 'package:first_app/admin/admin_dashboard.dart';
import 'package:first_app/member/Complaint_and_feedback.dart';
import 'package:first_app/member/contant_system/contact_list.dart';
import 'package:first_app/member/dashboard_final.dart';
import 'package:first_app/member/emergency_contacts.dart';
import 'package:first_app/member/notice/notice.dart';
import 'package:first_app/member/security_call.dart';
import 'package:first_app/selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp( const MaterialApp(home: EmergencyContact()));
  });
}
