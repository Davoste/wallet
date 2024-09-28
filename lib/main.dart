import 'package:flutter/material.dart';
import 'package:wallet/login.dart';
import 'package:wallet/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Wallet App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
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
