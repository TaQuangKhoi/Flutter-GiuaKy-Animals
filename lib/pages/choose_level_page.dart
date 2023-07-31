import 'dart:developer';

import 'package:flutter/material.dart';

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

  void chooseLevel(level) {
    log("chooseLevel: $level");
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
            ElevatedButton(onPressed: () {chooseLevel("easy");}, child: const Text('Easy')),
            ElevatedButton(onPressed: () {chooseLevel("medium");}, child: const Text('Medium')),
            ElevatedButton(onPressed: () {chooseLevel("hard");}, child: const Text('Hard')),
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
