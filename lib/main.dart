import 'package:flutter/material.dart';
// import 'screens/start_screen.dart';
import 'screens/quizz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: MainBackground()),
    );
  }
}

class MainBackground extends StatelessWidget {
  const MainBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.cyan, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: const Quizz(),
    );
  }
}
