import 'package:flutter/material.dart';
import 'package:chledge/screens/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

// TODO: Know why the top bar is not rendering

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chledge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const BottomBar(),
    );
  }
}
