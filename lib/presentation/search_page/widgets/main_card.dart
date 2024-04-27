import 'package:flutter/material.dart';
import 'package:netflix_clone/constands/constands.dart';
import 'package:netflix_clone/models/movies.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("$imagePath${movie.posterPath}"),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}