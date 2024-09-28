import 'package:flutter/material.dart';
import 'package:wallet/custombutton.dart';
import 'package:wallet/dashboard.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
                decoration: InputDecoration(
                  labelText: 'Email',
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
              CustomButton(
                text: 'Register',
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
                  Navigator.pop(context);
                },
                child: const Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
