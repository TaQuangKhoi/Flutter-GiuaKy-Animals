import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'choose_level_page.dart';

class ResultPage extends StatefulWidget {
  final String level;
  final int point;

  const ResultPage({super.key, required this.level, required this.point});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  void updateBestPoint() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (widget.level) {
      case "easy":
        int bestPoint = prefs.getInt("easyBestPoint") ?? 0;
        if (widget.point > bestPoint) {
          prefs.setInt("easyBestPoint", widget.point);
        }
        break;
      case "medium":
        int bestPoint = prefs.getInt("mediumBestPoint") ?? 0;
        if (widget.point > bestPoint) {
          prefs.setInt("mediumBestPoint", widget.point);
        }
        break;
      case "hard":
        int bestPoint = prefs.getInt("hardBestPoint") ?? 0;
        if (widget.point > bestPoint) {
          prefs.setInt("hardBestPoint", widget.point);
        }
        break;
      default:
        break;
    }
  }

  Future<int?> getBestPoint(level) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (level) {
      case "easy":
        final int? bestPoint = prefs.getInt("easyBestPoint");
        return bestPoint;
      case "medium":
        final int? bestPoint = prefs.getInt("mediumBestPoint");
        return bestPoint;
      case "hard":
        final int? bestPoint = prefs.getInt("hardBestPoint");
        return bestPoint;
      default:
        return 0;
    }
  }

  int bestEasyPoint = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    updateBestPoint();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Your Result"),
        automaticallyImplyLeading: false,
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
              "Last Point: ${widget.point}",
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              "EASY Best Point:  point",
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              "MEDIUM Best Point:  point",
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              "HARD Best Point:  point",
              style: const TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ChooseLevelPage(title: 'Choose Level')));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: const Size(200, 50)),
                child: const Text(
                  'RESTART',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
