import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ta_quang_khoi_gk_animals/pages/start_page.dart';

class ChooseLevelPage extends StatefulWidget {
  const ChooseLevelPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ChooseLevelPage> createState() => _ChooseLevelPageState();
}

class _ChooseLevelPageState extends State<ChooseLevelPage> {
  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.green, fixedSize: const Size(200, 50));
  TextStyle textStyle = const TextStyle(fontSize: 20, color: Colors.white);

  void chooseLevel(level) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => StartPage(level: level)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  chooseLevel("easy");
                },
                style: buttonStyle,
                child: Text(
                  'Easy',
                  style: textStyle,
                )),
            ElevatedButton(
                onPressed: () {
                  chooseLevel("medium");
                },
                style: buttonStyle,
                child: Text(
                  'Medium',
                  style: textStyle,
                )),
            ElevatedButton(
                onPressed: () {
                  chooseLevel("hard");
                },
                style: buttonStyle,
                child: Text(
                  'Hard',
                  style: textStyle,
                )),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
