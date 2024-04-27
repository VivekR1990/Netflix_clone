import 'package:flutter/material.dart';
import 'package:netflix_clone/constands/colors/colors.dart';
import 'package:netflix_clone/constands/constands.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:netflix_clone/presentation/widgets/video_widgets.dart';
import '../../home/widgets/custom_button.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight10,
          Text(
            movie.title,
            style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                fontFamily: AutofillHints.addressCity),
          ),
          kHeight10,
          Text(
            movie.overview,
            style: const TextStyle(color: kGreyColor, fontSize: 15),
            textAlign: TextAlign.justify,
          ),
          kHeight30,
          VideoWidget(image: movie.posterPath),
          kHeight10,
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                icon: Icons.share,
                title: "Share",
                iconSize: 23,
                textSize: 14,
              ),
              kWidth10,
              CustomButton(
                icon: Icons.add,
                title: "My List",
                iconSize: 23,
                textSize: 14,
              ),
              kWidth10,
              CustomButton(
                icon: Icons.play_arrow,
                title: "Play",
                iconSize: 23,
                textSize: 14,
              ),
              kWidth10
            ],
          ),
          kHeight30
        ],
      ),
    );
  }
}