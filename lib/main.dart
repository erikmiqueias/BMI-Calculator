import 'package:bmi_app/screens/bmi_app.dart';
import 'package:flutter/material.dart';

void main(List<String> args) => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Color(0xFF24263B),
      appBar: AppBar(
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 20,
        ),
        title: Text('BMI Calculator'),
        backgroundColor: Color(0xFF1C2135),
        centerTitle: true,
      ),
      body: BmiApp(),
    ),
  ),
);
