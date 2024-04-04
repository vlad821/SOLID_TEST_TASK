import 'dart:math';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color _backgroundColor = Colors.white;

  // function that generates a random color
  void changeBackgroundColor() {
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
      onTap: changeBackgroundColor,
      child: Scaffold(
        backgroundColor: _backgroundColor,
        body: Center(
          child: StyleText(
            backgroundColor: _backgroundColor,
            text: 'Hello there',
            textStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class StyleText extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final TextStyle textStyle;

  const StyleText({super.key, 
    required this.backgroundColor,
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final double luminance =
        (0.299 * backgroundColor.red + 0.587 * backgroundColor.green + 0.114 * backgroundColor.blue) /
            255;
    final Color textColor = luminance > 0.5 ? Colors.black : Colors.white;
    return Text(
      text,
      style: textStyle.copyWith(color: textColor),
    );
  }
}
