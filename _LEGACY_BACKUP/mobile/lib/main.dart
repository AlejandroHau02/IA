import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const EmotionalApp());
}

class EmotionalApp extends StatelessWidget {
  const EmotionalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emotional App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          surface: Color(0xFF121212),
          primary: Color(0xFF007968),
        ),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}