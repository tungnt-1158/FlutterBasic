import 'dart:ui';

import 'package:baitap2/models/movies.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../providers/movieLists_provider.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  const MovieDetail({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.blue,
          ),
          title: const Text(
            "Movie detail",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                child: ClipRRect(
                  child: Center(
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/connexion.png',
                      image: 'https://image.tmdb.org/t/p/w500/' +
                          movie.backdropPath,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/error.png',
                          fit: BoxFit.fitHeight,
                          height: 300,
                        );
                      },
                      height: 300.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 16,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/connexion.png',
                  image: 'https://image.tmdb.org/t/p/w500/' + movie.posterPath,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/error.png',
                      fit: BoxFit.fitHeight,
                      height: 142.0,
                      width: 92.0,
                    );
                  },
                  height: 142.0,
                  width: 92.0,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              const SizedBox(width: 16),
              Text(
                movie.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              CircularPercentIndicator(
                radius: 35.0,
                lineWidth: 5.0,
                percent: movie.voteAverage / 10,
                center: Text("${movie.voteAverage / 1}"),
                progressColor: Colors.black,
              ),
              const SizedBox(width: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: Container(
              padding: const EdgeInsets.all(0.0),
              color: Colors.grey,
              width: double.infinity,
              height: 1.0,
            ), //Container
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: SignInButton(
                    text: 'Reviews',
                    textColor: Colors.black45,
                    color: Colors.white,
                    image: 'assets/images/review.png',
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: SignInButton(
                    text: 'Trailers',
                    textColor: Colors.black45,
                    color: Colors.white,
                    image: 'assets/images/play.png',
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: Container(
              padding: const EdgeInsets.all(0.0),
              color: Colors.grey,
              width: double.infinity,
              height: 1.0,
            ), //Container
          ),
          Row(
            children: const <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    'Genre',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Release',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Container(
              padding: const EdgeInsets.all(0.0),
              color: Colors.white,
              width: double.infinity,
              height: 1.0,
            ), //Container
          ),
          Row(
            children: <Widget>[
              const Expanded(
                child: Center(
                  child: Text(
                    'Drama',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    movie.releaseDate,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              padding: const EdgeInsets.all(0.0),
              color: Colors.grey,
              width: double.infinity,
              height: 1.0,
            ), //Container
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(
                movie.overview,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignInButton extends CustomRaiseButton {
  SignInButton({
    String text: "",
    Color color: Colors.white,
    Color textColor: Colors.pinkAccent,
    String image: "",
    VoidCallback? onPressed,
  }) : super(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              image,
              width: 35,
              height: 35,
            ),
            Text(
              text,
              style: TextStyle(color: textColor, fontSize: 18.0),
            ),
          ]),
      color: color,
      height: 60.0,
      onPressed: onPressed);
}

class CustomRaiseButton extends StatelessWidget {
  CustomRaiseButton({
    this.child,
    this.color,
    this.height: 95.0,
    this.width: 150,
    this.onPressed,
  });

  final Widget? child;
  final Color? color;
  final double height;
  final double width;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: RaisedButton(
        elevation: 0,
        color: Colors.transparent,
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}