import 'package:bmi_app/widgets/button.dart';
import 'package:flutter/material.dart';

class BodyInfo extends StatefulWidget {
  const BodyInfo({
    super.key,
    required this.title,
    required this.textNumber,
    this.increment,
    this.decrement,
  });
  final String title;
  final int textNumber;
  final Function()? increment;
  final Function()? decrement;

  @override
  State<BodyInfo> createState() => _BodyInfoState();
}

class _BodyInfoState extends State<BodyInfo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      height: 180,
      child: Card(
        color: Color(0xFF24263B),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: Color(0xFF8B8C9E),
              ),
            ),
            Text(
              widget.textNumber.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(icon: Icons.add, onPressed: widget.increment!),
                  Spacer(),
                  Button(icon: Icons.remove, onPressed: widget.decrement!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
