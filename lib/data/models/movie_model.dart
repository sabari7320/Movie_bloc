import 'dart:convert';

import 'package:movie_bloc/domain/entities/Movie.dart';

class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  MovieModel(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterPath});

//Convert Json into MovieModel
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json["id"],
      title: json["title"],
      overview: json["overview"],
      posterPath: json["posterPath"]);

//Convert moviemodel into json
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "overview": overview,
        "posterPath": posterPath
      };

  Movie toEntity() {
    return Movie(
        id: id, title: title, overview: overview, posterPath: posterPath);
  }
}

//---------------------------------------------------------------------------------------//

TrendingMovies TrendingMoviesmodelFromJson(String str) =>
    TrendingMovies.fromJson(json.decode(str));

class TrendingMovies {
  TrendingMovies({this.results});
  MovieTrendModel? results;

  factory TrendingMovies.fromJson(Map<String, dynamic> json) =>
      TrendingMovies(results: MovieTrendModel.fromJson(json['results']));

  Map<String, dynamic> toJson() => {"results": results};

  map(Function(dynamic model) param0) {}
}

class MovieTrendModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  MovieTrendModel(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterPath});

//Convert Json into MovieModel
  factory MovieTrendModel.fromJson(Map<String, dynamic> json) =>
      MovieTrendModel(
          id: json["id"],
          title: json["title"],
          overview: json["overview"],
          posterPath: json["posterPath"]);

//Convert moviemodel into json
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "overview": overview,
        "posterPath": posterPath
      };

  Movie toEntity() {
    return Movie(
        id: id, title: title, overview: overview, posterPath: posterPath);
  }
}
