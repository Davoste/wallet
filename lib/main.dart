import 'package:flutter/material.dart';
import 'package:wallet/login.dart';
import 'package:wallet/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Wallet App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      home: LoginPage(),
      routes: {
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
