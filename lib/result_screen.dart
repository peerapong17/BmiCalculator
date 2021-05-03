import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/handy_button.dart';
import 'package:bmi_calculator/reusable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {@required this.bmiResult,
      @required this.advice,
      @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String advice;

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
            child: Text(
              'Your Result',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              color: activeColor,
              cardChild: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 50,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      bmiResult,
                      style:
                          TextStyle(fontSize: 80, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      advice,
                      style: TextStyle(fontSize: 30),textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
          HandyButton(
            text: 'Recalculate',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
