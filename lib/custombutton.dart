import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final String text;
  final Function onPressed;

  const AnimatedButton(
      {super.key, required this.text, required this.onPressed});

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
        duration: const Duration(milliseconds: 200),
        width: _pressed ? 160 : 150,
        height: _pressed ? 55 : 50,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(25),
          boxShadow: _pressed
              ? [const BoxShadow(color: Colors.green, blurRadius: 8)]
              : [const BoxShadow(color: Colors.greenAccent, blurRadius: 4)],
        ),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
        backgroundColor: WidgetStateProperty.all(Colors.green),
        textStyle: WidgetStateProperty.all(
            const TextStyle(fontSize: 16, color: Colors.white)),
      ),
      child: Text(text),
    );
  }
}

