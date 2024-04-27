import 'package:flutter/material.dart';
import 'package:netflix_clone/constands/constands.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard(
      {super.key, required this.title, required this.listNotifier});
  final String title;
  final ValueNotifier<List<Movie>> listNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: title),
          kHeight10,
          LimitedBox(
              maxHeight: 250,
              child: ValueListenableBuilder(
                  valueListenable: listNotifier,
                  builder: (context, value, _) {
                    return ListView.builder(
                      itemCount: value.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var data = value[index];
                        return MainCardHome(
                          movie: data,
                        );
                      },
                    );
                  }))
        ],
      ),
    );
  }
}