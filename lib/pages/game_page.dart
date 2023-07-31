import 'dart:developer';

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:ta_quang_khoi_gk_animals/models/animal_model.dart';
import 'package:ta_quang_khoi_gk_animals/pages/result_page.dart';

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

  List<FlipCardController> flipCardControllerList = [];

  List<Animal> openedAnimals = [];

  int point = 0;

  late List<Widget> stack;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 24; i++) {
      flipCardControllerList.add(FlipCardController());
    }
    stack = [
      renderGrid(),
    ];
  }

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

  int getIndexOf24(i, j) {
    switch (i) {
      case 1:
        return j + 1;
      case 2:
        return j + 1 + 6;
      case 3:
        return j + 1 + 12;
      case 4:
        return j + 1 + 18;
      default:
        return 50;
    }
  }

  Widget renderGrid() {
    List<String> animalList = getAnimal();
    int numberOfMatches = 0;
    List<Widget> row = [];

    for (int i = 0; i < 4; i++) {
      List<Widget> column = [];

      for (int j = 0; j < 6; j++) {
        int index = getIndexOf24(i + 1, j);
        // log("index: $index");
        column.add(
          FlipCard(
            fill: Fill.fillBack,
            // Fill the back side of the card to make in the same size as the front.
            direction: FlipDirection.HORIZONTAL,
            // default
            side: CardSide.FRONT,
            controller: flipCardControllerList[index - 1],
            // autoFlipDuration: const Duration(seconds: 1),
            // The side to initially display.
            front: const Image(
              height: 50,
              image: AssetImage("assets/images/cover.png"),
            ),
            back: Image(
              height: 50,
              image: AssetImage("assets/images/${animalList[index - 1]}.png"),
            ),
            onFlipDone: (isFront) async {
              // log("isFront: $isFront");
              if (isFront) {
                Animal animal = Animal(
                  name: animalList[index - 1],
                  index: index,
                  sound: '',
                );
                openedAnimals.add(animal);
                log("animal: $animal");

                if (openedAnimals.length == 2) {
                  if (openedAnimals[0].name == openedAnimals[1].name) {
                    log("Matched");
                    openedAnimals.clear();
                    point += 10;
                    numberOfMatches++;

                    if (numberOfMatches == 12) {
                      log("You win");
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("You win"),
                            content: const Text("Press Finish to see Result"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ResultPage(
                                                level: widget.level,
                                                point: point,
                                              )));
                                },
                                child: const Text("Finish"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } else {
                    log("Not matched");
                    point -= 5;

                    // toggle all cards in openedAnimals
                    for (Animal animal in openedAnimals) {
                      log("animal.index: ${animal.index}");
                      await flipCardControllerList[animal.index - 1]
                          .toggleCard();
                    }

                    openedAnimals.clear();
                  }
                }
              }
            },
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
        child: Stack(
          children: stack,
        ),
      ),
    );
  }
}
