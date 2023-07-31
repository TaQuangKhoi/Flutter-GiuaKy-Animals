import 'dart:developer';

import 'package:flip_card/flip_card.dart';
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

  Widget? renderGrid() {
    List<String> animalList = getAnimal();
    List<Widget> row = [];

    for (int i = 0; i < 4; i++) {
      List<Widget> column = [];

      for (int j = 0; j < 6; j++) {
        int index = (i + 1) * (j + 1);
        column.add(
          FlipCard(
            fill: Fill.fillBack,
            // Fill the back side of the card to make in the same size as the front.
            direction: FlipDirection.HORIZONTAL,
            // default
            side: CardSide.FRONT,
            // The side to initially display.
            front: const Image(
              height: 50,
              image: AssetImage("assets/images/cover.png"),
            ),
            back: Image(
              height: 50,
              image: AssetImage("assets/images/${animalList[index - 1]}.png"),
            ),
          ),
        );
      }

      row.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: column,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: row,
    );
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
        child: renderGrid(),
      ),
    );
  }
}
