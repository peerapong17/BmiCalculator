import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/component/handy_button.dart';
import 'package:bmi_calculator/component/icon_content.dart';
import 'package:bmi_calculator/screen/result_screen.dart';
import 'package:bmi_calculator/component/reusable.dart';
import 'package:bmi_calculator/component/reusable_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../component/constants.dart';

enum Gender { male, female }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color femaleColor = inactiveColor;
  Color maleColor = inactiveColor;
  int height = 180;
  int weight = 60;
  int age = 20;
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? activeColor
                        : inactiveColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? activeColor
                        : inactiveColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      Text(
                        ' cm.',
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                  Slider(
                      activeColor: Color(0xffEB1555),
                      inactiveColor: Color(0xff8D8E98),
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: activeColor,
                    cardChild: Column(
                      children: [
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReusableButton(
                              heroTag: 'btnWeightPLus',
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ReusableButton(
                              heroTag: 'btnWeightMinus',
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (weight > 1) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: activeColor,
                    cardChild: Column(
                      children: [
                        Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ReusableButton(
                              heroTag: 'btnAgePLus',
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(
                                  () {
                                    if (age < 120) {
                                      age++;
                                    }
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ReusableButton(
                              heroTag: 'btnAgeMinus',
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(
                                  () {
                                    if (age > 1) {
                                      age--;
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          HandyButton(
            text: 'Calculate',
            color: Colors.blue,
            onTap: () {
              CalculatorBrain calBrain =
                  CalculatorBrain(height: height, weight: weight);
              String bmiResult = calBrain.calculateBMI();
              String resultText = calBrain.getResult();
              String advice = calBrain.getAdvice();

              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => ResultScreen(
                    resultText: resultText,
                    bmiResult: bmiResult,
                    advice: advice,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
