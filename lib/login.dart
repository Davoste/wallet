import 'package:flutter/material.dart';
import 'package:wallet/custombutton.dart';
import 'package:wallet/dashboard.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              const Icon(
                Icons.account_balance_wallet,
                size: 100,
                color: Colors.green,
              ),
              Text(
                "M-Pepe",
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
              const SizedBox(height: 20),

              const TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              AnimatedButton(
                text: 'Login',
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, anim1, anim2) => DashboardPage(),
                        transitionsBuilder: (context, anim1, anim2, child) {
                          return FadeTransition(opacity: anim1, child: child);
                        },
                      ));
                },
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text('Don’t have an account? Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
