import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      onLongPress: onPressed,
      icon: Icon(icon, color: Colors.white),
      style: IconButton.styleFrom(
        backgroundColor: Color(0xFF8B8C9E),
        elevation: 25,
      ),
    );
  }
}
