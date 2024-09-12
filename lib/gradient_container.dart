import 'package:flutter/material.dart';
import 'package:first_app/RollerDice.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.brown, Colors.blue, Colors.yellow],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Center(child: RollerDice()),
    );
  }
}
