import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.resultBmi,
    required this.bmiClassificate,
  });
  final double resultBmi;
  final String bmiClassificate;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
        color: Color(0xFF24263B),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Text(
            'Seu IMC:',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            widget.resultBmi.toStringAsFixed(2),
            style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            widget.bmiClassificate,
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 25,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            'O IMC (Índice de Massa Corporal) é calculado dividindo o peso (kg) pela altura ao quadrado (m²). Ele ajuda a identificar se a pessoa está dentro do peso ideal, abaixo ou acima do peso.',
            style: TextStyle(color: Colors.amber.shade400, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
