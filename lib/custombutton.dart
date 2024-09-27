import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final Function onPressed;

  AnimatedButton({required this.text, required this.onPressed});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onPressed();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: _pressed ? 160 : 150,
        height: _pressed ? 55 : 50,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(25),
          boxShadow: _pressed
              ? [BoxShadow(color: Colors.green, blurRadius: 8)]
              : [BoxShadow(color: Colors.greenAccent, blurRadius: 4)],
        ),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(text),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
        backgroundColor: MaterialStateProperty.all(Colors.green),
        textStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}
