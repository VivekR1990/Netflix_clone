import 'package:flutter/material.dart';
import 'package:netflix_clone/constands/constands.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth10,
        SizedBox(
          height: 60,
          child: Text(
            title,
            style: const TextStyle(
                height: 1.5,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: AutofillHints.addressCity),
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 28,
        ),
        kWidth10,
        Container(
          height: 28,
          width: 28,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(7)),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png'),
                  fit: BoxFit.cover)),
        ),
        kWidth10
      ],
    );
  }
}