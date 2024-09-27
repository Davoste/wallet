import 'package:flutter/material.dart';

import 'package:wallet/sendmoney.dart';

class DashboardPage extends StatelessWidget {
  final String accountOwner = 'Stephen'; // Example account owner's name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'M-Pepe',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green, // Futuristic blue tone
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting with account owner's name and placeholder avatar
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green.shade200,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 5, 95, 8),
                        ),
                      ),
                      Text(
                        accountOwner,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 200),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors
                            .blueGrey[100], // Placeholder avatar background
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Row of clickable service icons
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: [
                  DashboardIcon(
                    icon: Icons.send,
                    label: 'Send Money',
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  SendMoneyPage(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = Offset(
                                1.0, 0.0); // Page slides in from the right
                            var end = Offset.zero;
                            var curve = Curves.easeInOut;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  DashboardIcon(
                    icon: Icons.account_balance,
                    label: 'Bank Transfer',
                    onTap: () {
                      // Implement bank transfer action
                    },
                  ),
                  DashboardIcon(
                    icon: Icons.phone_iphone,
                    label: 'Buy Airtime',
                    onTap: () {
                      // Implement buy airtime action
                    },
                  ),
                  DashboardIcon(
                    icon: Icons.shield,
                    label: 'Insurance',
                    onTap: () {
                      // Implement insurance action
                    },
                  ),
                  DashboardIcon(
                    icon: Icons.money,
                    label: 'Withdraw',
                    onTap: () {
                      // Implement withdraw action
                    },
                  ),
                  DashboardIcon(
                    icon: Icons.credit_card,
                    label: 'Card Services',
                    onTap: () {
                      // Implement card services action
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.savings),
            label: 'Savings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Loans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.green,
        onTap: (index) {
          // Handle navigation actions
        },
      ),
    );
  }
}

// Reusable widget for service icons
class DashboardIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onTap;

  DashboardIcon({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue.shade100,
            child: Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
