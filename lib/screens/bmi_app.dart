import 'package:bmi_app/models/colors.dart';
import 'package:bmi_app/result_screen.dart';
import 'package:bmi_app/services/imc_service.dart';
import 'package:bmi_app/widgets/body_info.dart';
import 'package:bmi_app/widgets/gender_card.dart';
import 'package:flutter/material.dart';

class BmiApp extends StatefulWidget {
  const BmiApp({super.key});

  @override
  State<BmiApp> createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  var height = 1.0;
  var weight = 0;
  var age = 0;
  double bmiResult = 0.0;
  String bmiClassificate = "";
  bool _isActive = true;

  void changeHeight(double newValue) {
    setState(() {
      height = newValue;
    });
  }

  void incrementValue(String type) {
    if (type == 'weight') {
      setState(() {
        weight++;
      });
    } else {
      setState(() {
        age++;
      });
    }
  }

  void decrementValue(String type) {
    if (type == 'weight') {
      if (weight <= 0) {
        setState(() {
          weight = 0;
        });
        return;
      }
      setState(() {
        weight--;
      });
    } else {
      if (age == 0) {
        setState(() {
          age = 0;
        });
        return;
      }
      setState(() {
        age--;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    changeHeight(height);
    weight = 0;
    age = 0;
  }

  void clear() {
    setState(() {
      height = 1.0;
      weight = 0;
      age = 0;
      bmiResult = 0.0;
      bmiClassificate = "";
      _isActive = true;
    });
  }

  void calculate() {
    final result = calculateBmi(weight, (height / 100));
    final display = resultInfo(result, age);

    setState(() {
      bmiResult = result;
      bmiClassificate = display;
    });
  }

  void _openResultBmiOverlay() {
    showModalBottomSheet(
      isScrollControlled: false,
      context: context,
      builder:
          (ctx) => ResultScreen(
            resultBmi: bmiResult,
            bmiClassificate: bmiClassificate,
          ),
    ).then((value) => clear());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        spacing: 25,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    _isActive = true;
                  });
                },
                child: GenderCard(
                  genderIcon: Icons.male,
                  gender: 'Masculino',
                  color: _isActive ? colors[0] : colors[1],
                  isActive: _isActive,
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    _isActive = false;
                  });
                },
                child: GenderCard(
                  genderIcon: Icons.female,
                  gender: 'Feminino',
                  color: _isActive ? colors[0] : colors[1],
                  isActive: !_isActive,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 319,
            height: 189,
            child: Card(
              color: Color(0xFF333244),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Altura',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Color(0xFF8B8C9E),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        height.ceil().toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'cm',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData().copyWith(
                      trackHeight: 2,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 7.0,
                      ),
                    ),
                    child: Slider(
                      inactiveColor: Colors.white,
                      activeColor: Color(0xFFE83D67),
                      value: height,
                      onChanged: changeHeight,
                      min: 1.0,
                      max: 300.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BodyInfo(
                title: 'Peso',
                textNumber: weight,
                increment: () => incrementValue('weight'),
                decrement: () => decrementValue('weight'),
              ),
              BodyInfo(
                title: 'Idade',
                textNumber: age,
                increment: () => incrementValue('age'),
                decrement: () => decrementValue('age'),
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () {
              calculate();
              _openResultBmiOverlay();
              print(bmiClassificate);
              print(bmiResult);
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.red.shade400,
              foregroundColor: Colors.white,
              minimumSize: Size(500, 100),
            ),
            child: Text(
              'Calcular',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
