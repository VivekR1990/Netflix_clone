import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/downloads/downlods_screen.dart';
import 'package:netflix_clone/presentation/home/home_screen.dart';
import 'package:netflix_clone/presentation/main_page/bottom_navigation.dart';
import 'package:netflix_clone/presentation/new_hot/new_hot_screen.dart';
import 'package:netflix_clone/presentation/search_page/search_screen.dart';

class MainPageScreen extends StatelessWidget {
  MainPageScreen({super.key});
  final List pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenSearch(),
    ScreenDownloads()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: bottomNavigationNotifier,
          builder: (context, int index, child) {
            return pages[index];
          },
        ),
        bottomNavigationBar: const BottomNavigationWidget(),
      ),
    );
  }
}