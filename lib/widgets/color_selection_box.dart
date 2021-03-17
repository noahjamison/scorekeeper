import 'package:flutter/material.dart';

class ColorSelectionBox extends StatelessWidget {
  final color;
  final playerColor;
  final onTap;
  bool isSelected;

  ColorSelectionBox({
    @required this.color,
    @required this.playerColor,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    isSelected = (playerColor == color);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: isSelected ? 75.0 : 50.0,
        width: isSelected ? 75.0 : 50.0,
        decoration: BoxDecoration(
          color: this.color,
          // border: Border.all(
          //   color: Colors.blueAccent,
          // ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}

class ColorSelectionBoxSmall extends StatelessWidget {
  final color;
  final playerColor;
  final onTap;
  bool isSelected;

  ColorSelectionBoxSmall({
    @required this.color,
    @required this.playerColor,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    isSelected = (playerColor == color);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: isSelected ? 60.0 : 40.0,
        width: isSelected ? 60.0 : 40.0,
        decoration: BoxDecoration(
          color: this.color,
          // border: Border.all(
          //   color: Colors.blueAccent,
          // ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
