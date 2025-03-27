import 'package:flutter/material.dart';
import 'package:chledge/screens/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chledge",
      theme: ThemeData(
        // Light theme settings
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        // ... other light theme properties
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          brightness: Brightness.dark,
          surface: Colors.grey[900]!, // Grey surface (similar to background)
          onSurface: Colors.white, // White text on grey surface
          primary: Colors.blue[400]!,
          onPrimary: Colors.black,
          shadow: Colors.grey[800]!,
        ),
        scaffoldBackgroundColor:
            Colors.grey[900], // Ensure scaffold background matches
        // ... other dark theme customizations
      ),
      themeMode: ThemeMode.dark, // Or ThemeMode.light, ThemeMode.dark
      // debugShowCheckedModeBanner: false,
      home: const BottomBar(),
    );
  }
}
