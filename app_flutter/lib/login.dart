import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins')),
            const Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 64.0, end: 64.0, top: 44.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                )),
            const Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 64.0, end: 64.0, bottom: 44.0, top: 16.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle:
                        TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                  ),
                )),
            ElevatedButton(
              onPressed: () {
                print('Hello, World!');
              },
              style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 88.0),
              ),
              child: const Text('Login',
                  style: TextStyle(
                      color: Color.fromARGB(255, 35, 13, 161),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins')),
            ),
          ],
        )));
  }
}
