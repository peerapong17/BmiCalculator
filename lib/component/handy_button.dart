import 'package:flutter/material.dart';

class HandyButton extends StatefulWidget {
  HandyButton({this.text, this.onTap, this.color});

  final String text;
  final Function onTap;
  final Color color;

  @override
  _HandyButtonState createState() => _HandyButtonState();
}

class _HandyButtonState extends State<HandyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        height: 80,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
