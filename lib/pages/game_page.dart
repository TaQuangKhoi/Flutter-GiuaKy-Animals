import 'dart:developer';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  final String level;

  const GamePage({super.key, required this.level});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> animalTypesList = [
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

  List<String> getAnimal() {
    int numberOfAnimalTypes = getNumberOfAnimalTypes();

    // get 4 animal types of animalTypesList
    List<String> animalTypes = animalTypesList.sublist(0, numberOfAnimalTypes);
    log("animalTypes: $animalTypes");

    // Create 1d array with 24 elements filled with 6 animal types
    List<String> animalList = [];
    for (int i = 0; i < 24; i++) {
      animalList.add(animalTypes[i % numberOfAnimalTypes]);
    }

    // Shuffle the 1d array
    animalList.shuffle();

    return animalList;
  }

  @override
  Widget build(BuildContext context) {
    log("getAnimal(): ${getAnimal()}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Resolve This Game"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Image(image: AssetImage("assets/images/bee.png")),
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
