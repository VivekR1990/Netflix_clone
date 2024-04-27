import 'package:flutter/material.dart';
import 'package:netflix_clone/constands/constands.dart';
import 'package:netflix_clone/controller/api.dart';
import 'image_widget.dart';

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "Introducing downloads \nfor you",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFamily: AutofillHints.addressCity),
        ),
        kHeight10,
        const Text(
          "We will download a personalized selection of movies and shows for you, so there is always something to watch on your \ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        kHeight10,
        FutureBuilder<List<String>>(
          future: Api().getDownloadImageUrls(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey[800],
                  radius: size.width * 0.395,
                  child: const CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey[800],
                  radius: size.width * 0.395,
                  child: const CircularProgressIndicator(),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No data available');
            } else {
              return SizedBox(
                height: size.width,
                width: size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[800],
                        radius: size.width * 0.395,
                      ),
                    ),
                    DownloadPageImageWidget(
                      imageList: snapshot.data![0],
                      margin: const EdgeInsets.only(left: 150, bottom: 30),
                      angle: 18,
                      size: Size(size.width * 0.35, size.width * .56),
                    ),
                    DownloadPageImageWidget(
                      imageList: snapshot.data![1],
                      margin: const EdgeInsets.only(right: 150, bottom: 30),
                      angle: -18,
                      size: Size(size.width * 0.35, size.width * .56),
                    ),
                    DownloadPageImageWidget(
                      imageList: snapshot.data![2],
                      margin: const EdgeInsets.only(bottom: 3),
                      size: Size(size.width * 0.42, size.width * .62),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}