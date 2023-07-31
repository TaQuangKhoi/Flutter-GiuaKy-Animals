import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final String level;
  final int point;
  const ResultPage({super.key, required this.level, required this.point});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
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
              "EASY Best Point: point",
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              "MEDIUM Best Point: point",
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              "HARD Best Point: point",
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
