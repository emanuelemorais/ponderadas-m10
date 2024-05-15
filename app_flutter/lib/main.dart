import 'package:flutter/material.dart';
import 'package:app_flutter/widgets/background.dart';
import 'package:app_flutter/pages/login.dart';

void main() {
  runApp(
    const MaterialApp(
      home: GradientContainer(
          child: Login()
        )
    ),
  );
}
