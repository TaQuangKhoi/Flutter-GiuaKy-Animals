import 'package:flutter/material.dart';
import 'package:ta_quang_khoi_gk_animals/pages/choose_level_page.dart';

class AnimalsApp extends StatelessWidget {
  const AnimalsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChooseLevelPage(title: 'Flutter Demo Home Page'),
    );
  }
}