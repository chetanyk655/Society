import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:first_app/main_app.dart';
import 'package:flutter/services.dart';

void main() {
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp(const MainApp());
  });
}
