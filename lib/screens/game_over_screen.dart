import 'package:ScoreKeeper/screens/home_screen.dart';
import 'package:ScoreKeeper/widgets/rounded_button_small.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final backgroundColor;

  GameOverScreen({@required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: RotatedBox(
          quarterTurns: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'That\'s Game!',
                style: TextStyle(fontSize: 60.0, color: Colors.white),
              ),
              SizedBox(height: 30.0),
              RoundedButtonSmall(
                  color: Colors.blueGrey,
                  title: 'new game',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                        fullscreenDialog: true,
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
