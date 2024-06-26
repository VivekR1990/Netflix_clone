import 'package:flutter/material.dart';
import 'package:netflix_clone/constands/constands.dart';
import 'package:netflix_clone/controller/api.dart';
import 'package:netflix_clone/presentation/search_page/widgets/search_text.dart';
import 'package:netflix_clone/presentation/search_page/widgets/top_search.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextWidget(text: "Top Searches"),
        kHeight10,
        Expanded(
          child: FutureBuilder(
            future: Api().forSearchDara(),
            builder: (context, snapshot) {
              if (snapshot.hasError ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = snapshot.data![index];
                      return TopSearchItemTile(
                        movie: data,
                      );
                    },
                    separatorBuilder: (context, index) => kHeight10,
                    itemCount: snapshot.data!.length);
              }
            },
          ),
        ),
      ],
    );
  }
}