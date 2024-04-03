import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Test App',
      home: ColorfulScreen(),
    );
  }
}

class ColorfulScreen extends StatefulWidget {
  const ColorfulScreen({super.key});

  @override
  State<ColorfulScreen> createState() => _ColorfulScreenState();
}

class _ColorfulScreenState extends State<ColorfulScreen> {
  Color _backgroundColor = Colors.white;

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
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor(_backgroundColor),
            ),
          ),
        ),
      ),
    );
  }

  Color textColor(Color backgroundColor) {
    final double luminance = (0.299 * backgroundColor.red +
            0.587 * backgroundColor.green +
            0.114 * backgroundColor.blue) /
        255;
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
