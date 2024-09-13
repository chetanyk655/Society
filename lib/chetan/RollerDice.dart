import 'package:flutter/material.dart';
import 'dart:math';

var randomizer = Random();

class RollerDice extends StatefulWidget {
  const RollerDice({super.key});

  @override
  State<RollerDice> createState() {
    return _RollerDiceState();
  }
}

class _RollerDiceState extends State<RollerDice> {
  var CRD = 2;
  void rollDice() {
    setState(() {
      CRD = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        'assets/images/dice-$CRD.png',
        width: 200,
      ),
      TextButton(
          onPressed: rollDice,
          child: const Text(
            "Roll Dice",
            style: TextStyle(fontSize: 30, color: Colors.white),
          )),
    ]);
  }
}
