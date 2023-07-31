import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> animalList = [
    "bee",
    "bird",
    "cat",
    "cow",
    "dog",
    "elephant",
    "fish",
    "frog",
    "duck",
    "horse",
    "lion",
    "monkey",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Resolve This Game"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("A"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("B"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("C"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("D"),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("A"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("B"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("C"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("D"),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("A"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("B"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("C"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("D"),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("A"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("B"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("C"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("D"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
