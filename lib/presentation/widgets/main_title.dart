import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 23,
          height: 1.5,
          fontWeight: FontWeight.bold,
          fontFamily: AutofillHints.addressCity),
    );
  }
}