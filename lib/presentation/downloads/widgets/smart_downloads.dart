import 'package:flutter/material.dart';
import 'package:netflix_clone/constands/constands.dart';

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          height: 40,
        ),
        Icon(
          Icons.settings,
          size: 28,
          color: Colors.white,
        ),
        kWidth10,
        Text(
          "Smart Downloads",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}