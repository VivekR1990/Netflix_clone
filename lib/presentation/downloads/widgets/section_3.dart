import 'package:flutter/material.dart';
import 'package:netflix_clone/constands/colors/colors.dart';
import 'package:netflix_clone/constands/constands.dart';

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 420,
          height: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: MaterialButton(
              onPressed: () {},
              color: kButtonColorBlue,
              child: const Text(
                "Set Up",
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: AutofillHints.addressCity),
              ),
            ),
          ),
        ),
        kHeight20,
        SizedBox(
          height: 45,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: MaterialButton(
              onPressed: () {},
              color: kButtonColorWhite,
              child: const Text(
                "See what you can download",
                style: TextStyle(
                    color: kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: AutofillHints.addressCity),
              ),
            ),
          ),
        ),
        kHeight20,
      ],
    );
  }
}