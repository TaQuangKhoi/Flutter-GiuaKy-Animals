import 'dart:developer';

import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  final String level;
  const StartPage({super.key, required this.level});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    log("StartPage: ${widget.level}");
    return const Placeholder();
  }
}
