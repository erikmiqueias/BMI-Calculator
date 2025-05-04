import 'package:bmi_app/models/colors.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatefulWidget {
  const GenderCard({
    super.key,
    required this.genderIcon,
    required this.gender,
    required this.color,
    required this.isActive,
  });
  final IconData genderIcon;
  final String gender;
  final Color color;
  final bool isActive;

  @override
  State<GenderCard> createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      height: 180,
      child: Card(
        color: widget.color,
        elevation: widget.isActive ? 8 : 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: widget.isActive ? Colors.blueAccent : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.genderIcon,
              size: 100,
              color: widget.isActive ? Colors.blueAccent : Colors.white,
            ),
            SizedBox(height: 8),
            Text(
              widget.gender,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: widget.isActive ? Colors.blueAccent : Color(0xFF8B8C9E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
