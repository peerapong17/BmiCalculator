import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  ReusableButton({this.icon, this.onPress, this.heroTag});

  final IconData icon;
  final Function onPress;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      onPressed: onPress,
      backgroundColor: Color(0xff4C4F5C),
      child: Icon(icon),
    );
  }
}
