import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:first_app/chetan/main_app.dart';
import 'package:first_app/chetan/quiz.dart';
import 'package:flutter/services.dart';

void main() {
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp(const Quiz());
  });
}
