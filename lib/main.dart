import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Mainpage()));
}

class Mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                height: 150,
                minWidth: 150,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Gamepage()),
                  );
                },
                child: Text("START"),
              ),
            ),
          ),
          Container(
            color: Colors.redAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                color: Colors.white,
                shape: CircleBorder(),
                height: 150,
                minWidth: 150,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Gamepage()),
                  );
                },
                child: Text("START"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Gamepage extends StatefulWidget {
  @override
  State<Gamepage> createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {
  double bluecaedheight = 0;
  double redcaedheight = 0;

  int playerAscore = 0;
  int playerBscore = 0;

  bool initialized = false;

  @override
  Widget build(BuildContext context) {
    if (initialized == false) {
      bluecaedheight = MediaQuery.of(context).size.height / 2;
      redcaedheight = MediaQuery.of(context).size.height / 2;
      initialized = true;
    }

    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              print(bluecaedheight);
              setState(() {
                bluecaedheight = bluecaedheight + 20;
                redcaedheight = redcaedheight - 20;

                playerBscore = playerBscore + 5;
              });

              double winningheight = MediaQuery.of(context).size.height - 60;

              if (bluecaedheight > winningheight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(playerBscore, "B"),
                  ),
                );
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.blueAccent,
              height: bluecaedheight,
              width: double.infinity,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player B",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    playerBscore.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              print(redcaedheight);
              setState(() {
                redcaedheight = redcaedheight + 20;
                bluecaedheight = bluecaedheight - 20;

                playerAscore = playerAscore + 5;
              });
              double screenheight = MediaQuery.of(context).size.height;
              double winningheight = MediaQuery.of(context).size.height - 60;

              if (redcaedheight > winningheight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(playerAscore, "A"),
                  ),
                );
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.redAccent,
              height: redcaedheight,
              width: double.infinity,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player A",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    playerAscore.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  int score = 0;
  String player = "";

  ResultPage(this.score, this.player);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == "A" ? Colors.redAccent : Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              score.toString(),
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            Text(
              player == "A" ? "PLAYER A WON " : "PLAYER B WON ",
              style: TextStyle(fontSize: 35),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              color: Colors.white,
              child: Text("Resart game"),
            ),
          ],
        ),
      ),
    );
  }
}
