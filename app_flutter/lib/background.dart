import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color.fromARGB(255, 35, 13, 161),
              Color.fromARGB(255, 90, 25, 210),
              Color.fromARGB(255, 135, 66, 245),
            ],
          ),
        ));
  }
}