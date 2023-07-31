import 'package:flutter/material.dart';

import 'game_page.dart';

class StartPage extends StatefulWidget {
  final String level;

  const StartPage({super.key, required this.level});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int getNumberOfAnimalTypes() {
    switch (widget.level) {
      case "easy":
        return 4;
      case "medium":
        return 6;
      case "hard":
        return 12;
      default:
        return 4;
    }
  }

  int getTotalTime() {
    switch (widget.level) {
      case "easy":
        return 150;
      case "medium":
        return 100;
      case "hard":
        return 50;
      default:
        return 50;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Ready?"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Level: ${widget.level.toUpperCase()}",
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                "Animal types: ${getNumberOfAnimalTypes()}",
                style: const TextStyle(fontSize: 30),
              ),
              Text(
                "Total time: ${getTotalTime()} seconds",
                style: const TextStyle(fontSize: 30),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GamePage(level: widget.level,)));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      fixedSize: const Size(200, 50)),
                  child: const Text(
                    'Start',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ],
          ),
        ));
  }
}
