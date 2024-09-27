import 'package:flutter/material.dart';
import 'package:wallet/custombutton.dart';

class SuccessMessage extends StatefulWidget {
  @override
  _SuccessMessageState createState() => _SuccessMessageState();
}

class _SuccessMessageState extends State<SuccessMessage> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _visible = true;
      });

      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _visible = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(seconds: 1),
      child: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white, size: 30),
            SizedBox(width: 10),
            Text(
              'Confirmed. Transaction Successful!',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class SendMoneyPage extends StatefulWidget {
  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final _formKey = GlobalKey<FormState>();
  String recipientName = '';
  double amount = 0.0;
  String selectedPaymentMethod = 'Bank Transfer';
  bool isFavorite = false;
  bool showSuccessMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Money'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Recipient Name TextField
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Recipient Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    recipientName = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // Amount TextField
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  double? amount = double.tryParse(value!);
                  if (amount == null || amount <= 0) {
                    return 'Enter a valid amount';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    amount = double.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 20),

              // Payment Method Dropdown
              DropdownButtonFormField<String>(
                value: selectedPaymentMethod,
                decoration: InputDecoration(
                  labelText: 'Payment Method',
                  border: OutlineInputBorder(),
                ),
                items: ['Bank Transfer', 'Credit Card', 'Mobile Money']
                    .map((method) => DropdownMenuItem<String>(
                          value: method,
                          child: Text(method),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value!;
                  });
                },
              ),
              SizedBox(height: 20),

              // Favorite Transaction Switch
              SwitchListTile(
                title: Text('Mark as Favorite'),
                value: isFavorite,
                onChanged: (value) {
                  setState(() {
                    isFavorite = value;
                  });
                },
              ),
              SizedBox(height: 30),

              // Send Money Button
              CustomButton(
                text: 'Send Money',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      showSuccessMessage = true;
                    });
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        showSuccessMessage = false;
                      });
                    });
                  }
                },
              ),

              SizedBox(height: 20),

              // Animated Success Message
              AnimatedOpacity(
                opacity: showSuccessMessage ? 1.0 : 0.0,
                duration: Duration(seconds: 1),
                child: Text(
                  'Transaction Successful!',
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
