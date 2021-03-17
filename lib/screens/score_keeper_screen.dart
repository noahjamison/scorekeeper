import 'dart:collection';

import 'package:ScoreKeeper/score_keeper_info.dart';
import 'package:ScoreKeeper/screens/game_over_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Players {
  player1,
  player2,
}

class ScoreKeeperScreen extends StatefulWidget {
  final ScoreKeeperInfo info;

  ScoreKeeperScreen({@required this.info});

  @override
  _ScoreKeeperScreenState createState() => _ScoreKeeperScreenState(info: info);
}

class _ScoreKeeperScreenState extends State<ScoreKeeperScreen> {
  final ScoreKeeperInfo info;

  _ScoreKeeperScreenState({@required this.info});

  int _firstPlayerScore = 0;
  int _secondPlayerScore = 0;

  bool isFirstPlayerServing = true;

  Queue score = Queue();

  /// Changes which player is current server
  void updateServer() {
    // Check if we are in overtime
    if (_firstPlayerScore >= info.pointsToWinGame &&
        _firstPlayerScore > _secondPlayerScore) {
      isFirstPlayerServing = false;
    } else if (_secondPlayerScore >= info.pointsToWinGame &&
        _secondPlayerScore > _firstPlayerScore) {
      isFirstPlayerServing = true;
    }
    // Change serve to losing player if it is game point
    else if (info.pointsToWinGame - _firstPlayerScore == 1 &&
        _firstPlayerScore > _secondPlayerScore) {
      isFirstPlayerServing = false;
    } else if (info.pointsToWinGame - _secondPlayerScore == 1 &&
        _secondPlayerScore > _firstPlayerScore) {
      isFirstPlayerServing = true;
    }

    // Changes serve every set amount (e.i. every 5 serves)
    else if ((score.length / info.changeServeEvery).floor() % 2 == 0) {
      isFirstPlayerServing = true;
    } else {
      isFirstPlayerServing = false;
    }
  }

  /// Checks to see if game is over
  void checkForWinner() {
    // Enforce win by 2 rules
    if ((_firstPlayerScore - _secondPlayerScore).abs() < 2) {
      return;
    }

    // If player1 won
    if (_firstPlayerScore >= info.pointsToWinGame &&
        _firstPlayerScore > _secondPlayerScore) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameOverScreen(
            backgroundColor: info.player1Color,
          ),
          fullscreenDialog: true,
        ),
      );
      // If player2 won
    } else if (_secondPlayerScore >= info.pointsToWinGame &&
        _secondPlayerScore > _firstPlayerScore) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameOverScreen(
            backgroundColor: info.player2Color,
          ),
          fullscreenDialog: true,
        ),
      );
    }
  }

  /// Updates count of player scores
  void updateScores() {
    // Reset scores before beginning recount
    _firstPlayerScore = 0;
    _secondPlayerScore = 0;

    // Recount scores
    score.forEach((element) {
      if (element == Players.player1) {
        _firstPlayerScore++;
      } else if (element == Players.player2) {
        _secondPlayerScore++;
      }
    });
  }

  /// Resets the score for both players
  void resetScore() {
    setState(() {
      _firstPlayerScore = 0;
      _secondPlayerScore = 0;
      score = Queue();

      isFirstPlayerServing = true;
    });
  }

  /// Removes the last point that was scored
  void removeLastPoint() {
    if (score.length == 0) return;

    setState(() {
      score.removeLast();
      updateScores();
      updateServer();
    });
  }

  @override
  Widget build(BuildContext context) {
    double smallScreenButtonPosition = MediaQuery.of(context).size.width / 1.38;
    double largeScreenButtonPosition =
        MediaQuery.of(context).size.width / 1.075;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        score.add(Players.player1);
                        updateScores();
                        updateServer();
                        checkForWinner();
                      });
                    },
                    onLongPress: resetScore,
                    child: Container(
                      color: info.player1Color,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // This container is a placeholder for layout
                          Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              color: info.player1Color,
                              shape: BoxShape.circle,
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 1,
                            child: Text(
                              _firstPlayerScore.toString(),
                              style: TextStyle(
                                fontSize: 275.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              color: isFirstPlayerServing
                                  ? Colors.white
                                  : info.player1Color,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        score.add(Players.player2);
                        updateScores();
                        updateServer();
                        checkForWinner();
                      });
                    },
                    onLongPress: resetScore,
                    child: Container(
                      color: info.player2Color,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              color: isFirstPlayerServing
                                  ? info.player2Color
                                  : Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 1,
                            child: Text(
                              _secondPlayerScore.toString(),
                              style: TextStyle(
                                fontSize: 275.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // This container is a placeholder for layout
                          Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              color: info.player2Color,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: MediaQuery.of(context).size.height / 100,
              bottom: info.isSmallScreen
                  ? smallScreenButtonPosition
                  : largeScreenButtonPosition,
              child: RotatedBox(
                quarterTurns: 1,
                child: BackButton(
                  onPressed: removeLastPoint,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  final Function onPressed;

  BackButton({
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Container(
          width: 125.0,
          height: 75.0,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Icon(
            Icons.keyboard_return,
            color: Colors.white,
            size: 48.0,
          ),
        ),
      ),
    );
  }
}
