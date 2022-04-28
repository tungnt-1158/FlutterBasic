import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';

class Movie {
  final String posterPath;
  final int id;
  final String title;
  final String originalTitle;
  final num voteAverage;
  final List<dynamic> genreIds;
  final String releaseDate;
  final String overview;
  final String backdropPath;

  Movie(
      {required this.posterPath,
      required this.id,
      required this.title,
      required this.originalTitle,
      required this.voteAverage,
      required this.genreIds,
      required this.releaseDate,
      required this.overview,
      required this.backdropPath});

  factory Movie.fromJson(Map<String, dynamic> jsonData) {
    return Movie(
      posterPath: jsonData['poster_Path'],
      id: jsonData['id'],
      title: jsonData['title'],
      originalTitle: jsonData['original_title'],
      voteAverage: jsonData['vote_average'],
      genreIds: jsonData['genre_ids'],
      releaseDate: jsonData['release_date'],
      overview: jsonData['overview'],
      backdropPath: jsonData['backdrop_path'],
    );
  }

  static Map<String, dynamic> toMap(Movie movie) => {
        'id': movie.id,
        'poster_Path': movie.posterPath,
        'title': movie.title,
        'original_title': movie.originalTitle,
        'vote_average': movie.voteAverage,
        'genre_ids': movie.genreIds,
        'release_date': movie.releaseDate,
        'overview': movie.overview,
        'backdrop_path': movie.backdropPath,
      };

  static String encode(List<Movie> musics) => json.encode(
        musics
            .map<Map<String, dynamic>>((music) => Movie.toMap(music))
            .toList(),
      );

  static List<Movie> decode(String movies) =>
      (json.decode(movies) as List<dynamic>)
          .map<Movie>((item) => Movie.fromJson(item))
          .toList();
}
