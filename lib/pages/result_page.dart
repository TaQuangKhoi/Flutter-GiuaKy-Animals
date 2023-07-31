import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<int> getBestPoint(level) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int bestPoint = 0;

    switch (level) {
      case "easy":
        bestPoint = prefs.getInt("easyBestPoint") ?? 0;
        break;
      case "medium":
        bestPoint = prefs.getInt("mediumBestPoint") ?? 0;
        break;
      case "hard":
        bestPoint = prefs.getInt("hardBestPoint") ?? 0;
        break;
      default:
        break;
    }

    return bestPoint;
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
              "EASY Best Point: ${getBestPoint('easy')} point",
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              "MEDIUM Best Point: ${getBestPoint('easy')} point",
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              "HARD Best Point: ${getBestPoint('easy')} point",
              style: const TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => GamePage(level: widget.level,)));
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
