
import 'dart:math';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  Color _backgroundColor = Colors.white;
  // function that generate Color
  void _changeBackgroundColor() {
    final Random random = Random();
    final int red = random.nextInt(256);
    final int green = random.nextInt(256);
    final int blue = random.nextInt(256);
    final Color newColor = Color.fromARGB(255, red, green, blue);
    setState(() {
      _backgroundColor = newColor;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeBackgroundColor,
      child: Scaffold(
        backgroundColor: _backgroundColor,
        body: Center(
          child: Text(
            'Hello there',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: textColor(_backgroundColor),
            ),
          ),
        ),
      ),
    );
  }

// a method that determines the color of the text depending on the backgroundColor
  Color textColor(Color backgroundColor) {
    final double luminance = (0.299 * backgroundColor.red +
            0.587 * backgroundColor.green +
            0.114 * backgroundColor.blue) /
        255;
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
