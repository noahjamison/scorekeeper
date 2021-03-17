import 'package:flutter/material.dart';

class RoundedButtonSmall extends StatelessWidget {
  final Color color;
  final String title;
  final Function onPressed;

  RoundedButtonSmall({
    @required this.color,
    @required this.title,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 0.0,
        color: this.color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: this.onPressed,
          minWidth: 200.0,
          height: 75.0,
          child: Text(
            this.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
