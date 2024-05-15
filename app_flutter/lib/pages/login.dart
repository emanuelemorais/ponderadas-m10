import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app_flutter/pages/tasks_page.dart';

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
                    fontFamily: 'Poppins',
                  ),
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
                    fontFamily: 'Poppins',
                  ),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle:
                        TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                  ),
                )),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PageTasks(
                            token:
                                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVtYW51ZWxlMkBnbWFpbC5jb20iLCJleHAiOjE3MTU4Mjc2MjV9.YE2eekZJTaV8ZOWql09z_2k1UHKWEn6XH8rcArH9kMk')));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 88.0),
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
