import 'dart:ui';

import 'package:ScoreKeeper/score_keeper_info.dart';
import 'package:ScoreKeeper/screens/score_keeper_screen.dart';
import 'package:ScoreKeeper/widgets/color_selection_box.dart';
import 'package:ScoreKeeper/widgets/number_selection_box.dart';
import 'package:ScoreKeeper/widgets/rounded_button_small.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kHeaderTextStyle = TextStyle(
  fontSize: 32.0,
);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Set defaults for the game's setup
  ScoreKeeperInfo info = ScoreKeeperInfo(
    player1Color: Colors.blueAccent,
    player2Color: Colors.deepOrangeAccent,
    pointsToWinGame: 11,
    changeServeEvery: 1,
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    info.isSmallScreen = height < 750;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:
                info.isSmallScreen ? forSmallScreens() : forLargeScreens(),
          ),
        ),
      ),
    );
  }

  /// Show this UI for larger phone screens (i.e. iPhone 12 Pro Max)
  List<Widget> forLargeScreens() {
    return [
      player1ColorSelectionRow(),
      player2ColorSelectionRow(),
      pointsToWinGameRow(),
      pointsToChangeServeRow(),
      RoundedButtonSmall(
        color: Colors.blue,
        title: 'start',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScoreKeeperScreen(info: info),
              fullscreenDialog: true,
            ),
          );
        },
      ),
    ];
  }

  /// Show this UI for smaller phone screens (i.e. iPhone 8)
  List<Widget> forSmallScreens() {
    return [
      player1ColorSelectionRowSmall(),
      player2ColorSelectionRowSmall(),
      pointsToWinGameRowSmall(),
      pointsToChangeServeRowSmall(),
      RoundedButtonSmall(
        color: Colors.blue,
        title: 'start',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScoreKeeperScreen(info: info),
              fullscreenDialog: true,
            ),
          );
        },
      ),
    ];
  }

  // UI Widgets for larger screens (default)
  Widget player1ColorSelectionRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 32.0),
          child: Text(
            'Player 1',
            style: kHeaderTextStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ColorSelectionBox(
              color: Colors.blueAccent,
              playerColor: info.player1Color,
              onTap: () {
                setState(() {
                  info.player1Color = Colors.blueAccent;
                });
              },
            ),
            ColorSelectionBox(
              color: Colors.red,
              playerColor: info.player1Color,
              onTap: () {
                setState(() {
                  info.player1Color = Colors.red;
                });
              },
            ),
            ColorSelectionBox(
              color: Colors.greenAccent,
              playerColor: info.player1Color,
              onTap: () {
                setState(() {
                  info.player1Color = Colors.greenAccent;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Widget player2ColorSelectionRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 32.0),
          child: Text(
            'Player 2',
            style: kHeaderTextStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ColorSelectionBox(
              color: Colors.deepOrangeAccent,
              playerColor: info.player2Color,
              onTap: () {
                setState(() {
                  info.player2Color = Colors.deepOrangeAccent;
                });
              },
            ),
            ColorSelectionBox(
              color: Colors.lightBlueAccent,
              playerColor: info.player2Color,
              onTap: () {
                setState(() {
                  info.player2Color = Colors.lightBlueAccent;
                });
              },
            ),
            ColorSelectionBox(
              color: Colors.purpleAccent,
              playerColor: info.player2Color,
              onTap: () {
                setState(() {
                  info.player2Color = Colors.purpleAccent;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Widget pointsToWinGameRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 32.0),
          child: Text(
            'Points to Win',
            style: kHeaderTextStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberSelectionBox(
              number: 11,
              currentNumber: info.pointsToWinGame,
              onTap: () {
                setState(() {
                  info.pointsToWinGame = 11;
                });
              },
            ),
            NumberSelectionBox(
              number: 15,
              currentNumber: info.pointsToWinGame,
              onTap: () {
                setState(() {
                  info.pointsToWinGame = 15;
                });
              },
            ),
            NumberSelectionBox(
              number: 21,
              currentNumber: info.pointsToWinGame,
              onTap: () {
                setState(() {
                  info.pointsToWinGame = 21;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget pointsToChangeServeRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(32.0, 8.0, 8.0, 32.0),
          child: Text(
            'Change Serve',
            style: kHeaderTextStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberSelectionBox(
              number: 1,
              currentNumber: info.changeServeEvery,
              onTap: () {
                setState(() {
                  info.changeServeEvery = 1;
                });
              },
            ),
            NumberSelectionBox(
              number: 2,
              currentNumber: info.changeServeEvery,
              onTap: () {
                setState(() {
                  info.changeServeEvery = 2;
                });
              },
            ),
            NumberSelectionBox(
              number: 5,
              currentNumber: info.changeServeEvery,
              onTap: () {
                setState(() {
                  info.changeServeEvery = 5;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  // UI Widgets for smaller screens
  Widget player1ColorSelectionRowSmall() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 4.0, 4.0, 16.0),
          child: Text(
            'Player 1',
            style: kHeaderTextStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ColorSelectionBoxSmall(
              color: Colors.blueAccent,
              playerColor: info.player1Color,
              onTap: () {
                setState(() {
                  info.player1Color = Colors.blueAccent;
                });
              },
            ),
            ColorSelectionBoxSmall(
              color: Colors.red,
              playerColor: info.player1Color,
              onTap: () {
                setState(() {
                  info.player1Color = Colors.red;
                });
              },
            ),
            ColorSelectionBoxSmall(
              color: Colors.greenAccent,
              playerColor: info.player1Color,
              onTap: () {
                setState(() {
                  info.player1Color = Colors.greenAccent;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Widget player2ColorSelectionRowSmall() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 4.0, 4.0, 16.0),
          child: Text(
            'Player 2',
            style: kHeaderTextStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ColorSelectionBoxSmall(
              color: Colors.deepOrangeAccent,
              playerColor: info.player2Color,
              onTap: () {
                setState(() {
                  info.player2Color = Colors.deepOrangeAccent;
                });
              },
            ),
            ColorSelectionBoxSmall(
              color: Colors.lightBlueAccent,
              playerColor: info.player2Color,
              onTap: () {
                setState(() {
                  info.player2Color = Colors.lightBlueAccent;
                });
              },
            ),
            ColorSelectionBoxSmall(
              color: Colors.purpleAccent,
              playerColor: info.player2Color,
              onTap: () {
                setState(() {
                  info.player2Color = Colors.purpleAccent;
                });
              },
            ),
          ],
        )
      ],
    );
  }

  Widget pointsToWinGameRowSmall() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 4.0, 4.0, 16.0),
          child: Text(
            'Points to Win',
            style: kHeaderTextStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberSelectionBoxSmall(
              number: 11,
              currentNumber: info.pointsToWinGame,
              onTap: () {
                setState(() {
                  info.pointsToWinGame = 11;
                });
              },
            ),
            NumberSelectionBoxSmall(
              number: 15,
              currentNumber: info.pointsToWinGame,
              onTap: () {
                setState(() {
                  info.pointsToWinGame = 15;
                });
              },
            ),
            NumberSelectionBoxSmall(
              number: 21,
              currentNumber: info.pointsToWinGame,
              onTap: () {
                setState(() {
                  info.pointsToWinGame = 21;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget pointsToChangeServeRowSmall() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 4.0, 4.0, 16.0),
          child: Text(
            'Change Serve',
            style: kHeaderTextStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NumberSelectionBoxSmall(
              number: 1,
              currentNumber: info.changeServeEvery,
              onTap: () {
                setState(() {
                  info.changeServeEvery = 1;
                });
              },
            ),
            NumberSelectionBoxSmall(
              number: 2,
              currentNumber: info.changeServeEvery,
              onTap: () {
                setState(() {
                  info.changeServeEvery = 2;
                });
              },
            ),
            NumberSelectionBoxSmall(
              number: 5,
              currentNumber: info.changeServeEvery,
              onTap: () {
                setState(() {
                  info.changeServeEvery = 5;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
