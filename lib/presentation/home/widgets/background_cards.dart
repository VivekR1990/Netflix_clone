import 'package:flutter/material.dart';
import 'package:netflix_clone/constands/colors/colors.dart';
import 'package:netflix_clone/constands/constands.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imagePath + image), fit: BoxFit.fill)),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButton(icon: Icons.add, title: "My List"),
              _playButton(),
              const CustomButton(icon: Icons.info, title: "Info"),
            ],
          ),
        ),
      ],
    );
  }
}

TextButton _playButton() {
  return TextButton.icon(
    onPressed: () {},
    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhiteColor)),
    icon: const Icon(
      Icons.play_arrow,
      color: kBlackColor,
    ),
    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "Play ",
        style: TextStyle(
            fontSize: 18,
            color: kBlackColor,
            fontFamily: AutofillHints.addressCity),
      ),
    ),
  );
}