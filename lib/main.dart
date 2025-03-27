import 'package:flutter/material.dart';
import 'package:chledge/screens/bottom_bar.dart';
import 'package:chledge/utils/themes.dart';

void main() {
  runApp(const ChledgeApp());
}

class ChledgeApp extends StatelessWidget {
  const ChledgeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chledge",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark, // Or light, dark, system
      debugShowCheckedModeBanner: false,
      home: const BottomBar(),
    );
  }
}
