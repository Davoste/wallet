import 'package:flutter/material.dart';

import 'package:wallet/sendmoney.dart';

class DashboardGreeting extends StatefulWidget {
  final String accountOwner;

  DashboardGreeting({required this.accountOwner});

  @override
  _DashboardGreetingState createState() => _DashboardGreetingState();
}

class _DashboardGreetingState extends State<DashboardGreeting>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fadeIn = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeIn,
      child: Container(
          // The same code for the greeting container
          ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  final String accountOwner = 'Stephen';

  const DashboardPage({super.key}); // Example account owner's name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
                      const Text(
                        'Hello,',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 5, 95, 8),
                        ),
                      ),
                      DashboardGreeting(
                        accountOwner: "Stephen",
                      ),
                      Text(
                        accountOwner,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 200),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors
                            .blueGrey[100], // Placeholder avatar background
                        child: const Icon(
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
            const SizedBox(height: 30),

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
                            var begin = const Offset(
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

            const SizedBox(height: 20),
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

  const DashboardIcon(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap});

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
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
