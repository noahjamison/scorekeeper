import 'package:flutter/material.dart';

class ScoreKeeperInfo {
  Color player1Color;
  Color player2Color;
  int pointsToWinGame;
  int changeServeEvery;
  bool isSmallScreen;

  ScoreKeeperInfo({
    @required this.player1Color,
    @required this.player2Color,
    @required this.pointsToWinGame,
    @required this.changeServeEvery,
  });
}
