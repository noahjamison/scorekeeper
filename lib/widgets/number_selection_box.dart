import 'package:flutter/material.dart';

class NumberSelectionBox extends StatelessWidget {
  final number;
  final currentNumber;
  final onTap;
  bool isSelected;

  NumberSelectionBox({
    @required this.number,
    @required this.currentNumber,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    isSelected = (number == currentNumber);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: isSelected ? 75.0 : 50.0,
        width: isSelected ? 75.0 : 50.0,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2.0,
            color: isSelected ? Colors.blueAccent : Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              fontSize: isSelected ? 42.0 : 24.0,
            ),
          ),
        ),
      ),
    );
  }
}

class NumberSelectionBoxSmall extends StatelessWidget {
  final number;
  final currentNumber;
  final onTap;
  bool isSelected;

  NumberSelectionBoxSmall({
    @required this.number,
    @required this.currentNumber,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    isSelected = (number == currentNumber);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: isSelected ? 60.0 : 40.0,
        width: isSelected ? 60.0 : 40.0,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2.0,
            color: isSelected ? Colors.blueAccent : Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              fontSize: isSelected ? 42.0 : 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
