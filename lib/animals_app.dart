import 'package:flutter/material.dart';
import 'package:ta_quang_khoi_gk_animals/pages/choose_level_page.dart';
import 'package:ta_quang_khoi_gk_animals/pages/result_page.dart';
import 'package:ta_quang_khoi_gk_animals/pages/start_page.dart';

class AnimalsApp extends StatelessWidget {
  const AnimalsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animals Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChooseLevelPage(title: 'Choose Level'),
      // home: const ResultPage(
      //   level: 'easy',
      //   point: 10,
      // ),
      routes: {
        '/choose': (context) => const ChooseLevelPage(title: 'Choose Level'),
        '/start': (context) => const StartPage(
              level: '',
            ),
      },
    );
  }
}
