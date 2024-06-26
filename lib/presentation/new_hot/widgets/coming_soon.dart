import 'package:flutter/material.dart';
import 'package:netflix_clone/constands/colors/colors.dart';
import 'package:netflix_clone/constands/constands.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:netflix_clone/presentation/widgets/video_widgets.dart';
import '../../home/widgets/custom_button.dart';
import 'package:intl/intl.dart';

class ComingSoonWidget extends StatelessWidget {
  ComingSoonWidget({super.key, required this.movie});
  final Movie movie;
  final DateFormat monthFormatter = DateFormat('MMM');
  final DateFormat dayFormatter = DateFormat('dd');
  final DateFormat dayFormatterDay = DateFormat('EEEE');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 430,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                monthFormatter
                    .format(DateTime.parse(movie.releaseDate))
                    .toUpperCase(),
                style: const TextStyle(
                    fontSize: 15,
                    color: kGreyColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                dayFormatter.format(DateTime.parse(movie.releaseDate)),
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: AutofillHints.addressCity,
                    letterSpacing: 3),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(image: movie.posterPath),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width - 170,
                    child: Text(
                      movie.title,
                      style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontFamily: AutofillHints.addressCity,
                          letterSpacing: -1),
                    ),
                  ),
                  const Row(
                    children: [
                      CustomButton(
                        icon: Icons.notifications_none,
                        title: "Remind Me",
                        iconSize: 25,
                        textSize: 12,
                      ),
                      kWidth10,
                      CustomButton(
                        icon: Icons.info,
                        title: "info",
                        iconSize: 25,
                        textSize: 12,
                      ),
                      kWidth10
                    ],
                  ),
                ],
              ),
              kHeight10,
              Text(
                  "Coming On ${dayFormatterDay.format(DateTime.parse(movie.releaseDate))}"),
              kHeight10,
              Text(
                movie.title,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: AutofillHints.addressCity),
              ),
              kHeight10,
              Text(
                movie.overview,
                style: const TextStyle(color: kGreyColor),
                textAlign: TextAlign.justify,
              ),
              kHeight20
            ],
          ),
        )
      ],
    );
  }
}