import 'dart:ui';

import 'package:baitap2/models/movies.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../providers/movieLists_provider.dart';
import '../screens/movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  bool _isLoading = false;
  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Provider.of<MovieListsProvider>(context, listen: false)
        .fetchAndSetMovies()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final moviesData = Provider.of<MovieListsProvider>(context);
    final fetchedMovies = moviesData.movies;
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
          // shrinkWrap: true,
          itemCount: fetchedMovies.length,

          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MovieDetail(movie: fetchedMovies[index])),
                );
              },
              child: MovieListItem(
                thumbnail: fetchedMovies[index].posterPath,
                title: fetchedMovies[index].title,
                overview: fetchedMovies[index].overview,
              ),
            );
          },
        );
  }
}

class MovieListItem extends StatelessWidget {
  const MovieListItem({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.overview,
  }) : super(key: key);

  final String thumbnail;
  final String title;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 16),
          FadeInImage.assetNetwork(
            placeholder: 'assets/images/connexion.png',
            image: 'https://image.tmdb.org/t/p/w500/' + thumbnail,
            height: 142.0,
            width: 92.0,
            fit: BoxFit.fill,
            fadeInDuration: new Duration(milliseconds: 100),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: _MovieDescription(
              title: title,
              overview: overview,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}

class _MovieDescription extends StatelessWidget {
  const _MovieDescription({
    Key? key,
    required this.title,
    required this.overview,
  }) : super(key: key);

  final String title;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            overview,
            style: const TextStyle(fontSize: 14.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
        ],
      ),
    );
  }
}


