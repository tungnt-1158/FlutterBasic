import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/movies.dart';

class MovieListsProvider with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies {
    return [..._movies];
  }

  Future<Movie?> fetchAndSetMovies() async {
    const url = 'https://api.themoviedb.org/3/movie/popular?api_key=90c4bf2144015104a65675a75a430e55';
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final moviesString = await prefs.getString('movies_key');
        if (moviesString != null) {
          final List<Movie> movies = Movie.decode(moviesString);
          _movies = movies;
          print(moviesString);
          notifyListeners();
        }
        return null;
      }
      final List<Movie> loadedMovies = [];
      extractedData["results"].forEach((recipeData) {
        loadedMovies.add(
          Movie(
              posterPath: recipeData["poster_path"] ?? '',
              id: recipeData["id"],
              title: recipeData["title"],
              originalTitle: recipeData["original_title"],
              voteAverage: recipeData["vote_average"],
              genreIds: recipeData["genre_ids"],
              releaseDate: recipeData["release_date"],
              overview: recipeData["overview"],
              backdropPath: recipeData["backdrop_path"] ?? '',
            ),
        );
      });
      _movies = loadedMovies;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String encodedData = Movie.encode(_movies);
      await prefs.setString("movies_key", encodedData);

      notifyListeners();
    } catch (error) {
      print("AAAA");
      print(error);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final moviesString = await prefs.getString('movies_key');
      if (moviesString != null) {
        final List<Movie> movies = Movie.decode(moviesString);
        _movies = movies;
        print(moviesString);
        notifyListeners();
      }
    }
  }
}