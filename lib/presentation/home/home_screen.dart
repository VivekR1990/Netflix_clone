import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/constands/constands.dart';
import 'package:netflix_clone/controller/api.dart';
import 'package:netflix_clone/presentation/home/widgets/background_cards.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_titel_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
int randomIndex = 0;

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  fetchDatas() async {
    trendingNowListNotifeir.value = await Api().getTrendingMovies();
    topRatedListNotifeir.value = await Api().getTopRated();
    upComingListNotifeir.value = await Api().getUpComing();
    top10TvShowsInIndiaTodayListNotifeir.value =
        await Api().getTop10TvShowsInIndiaToday();
    final random = Random();
    randomIndex = random.nextInt(10);
  }

  @override
  Widget build(BuildContext context) {
    fetchDatas();
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (context, value, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection scrollDirection = notification.direction;
                if (scrollDirection == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (scrollDirection == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: [
                      FutureBuilder(
                        future: Api().getTrendingMovies(),
                        builder: (context, snapshot) => snapshot.hasData
                            ? BackgroundCard(
                                image: snapshot.data![randomIndex].posterPath)
                            : const SizedBox(
                                height: 700,
                                width: double.infinity,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                      ),
                      kHeight10,
                      MainTitleCard(
                        title: "Top Rated",
                        listNotifier: topRatedListNotifeir,
                      ),
                      MainTitleCard(
                        title: "Trending now",
                        listNotifier: trendingNowListNotifeir,
                      ),
                      const NumberTitleCard(),
                      MainTitleCard(
                        title: "Upcoming",
                        listNotifier: upComingListNotifeir,
                      )
                    ],
                  ),
                  scrollNotifier.value
                      ? AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          color: Colors.black.withOpacity(0.2),
                          height: 90,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/netflix logo.png",
                                    width: 40,
                                    height: 60,
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png'),
                                            fit: BoxFit.cover)),
                                  ),
                                  kWidth10
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "TV Shows",
                                    style: homeTitleTextStyle,
                                  ),
                                  Text(
                                    "Movies",
                                    style: homeTitleTextStyle,
                                  ),
                                  Text(
                                    "Categories",
                                    style: homeTitleTextStyle,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      : kHeight10
                ],
              ),
            );
          }),
    );
  }
}
