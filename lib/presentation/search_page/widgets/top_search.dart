import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/constands/constands.dart';
import 'package:netflix_clone/models/movies.dart';


class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
              height: 90,
              width: 150,
              child: Image.network(
                "$imagePath${movie.backDropPath}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          kWidth20,
          Expanded(
            child: Text(
              movie.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const Icon(
            CupertinoIcons.play_circle,
            color: Colors.white,
            size: 40,
          ),
          kWidth10
        ],
      ),
    );
  }
}