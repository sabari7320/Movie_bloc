import 'dart:convert';

import 'package:movie_bloc/core/errors/serverexception.dart';
import 'package:movie_bloc/data/datasource/movie_remote_data_source.dart';
import 'package:movie_bloc/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  static const BASE_URL = "https://api.themoviedb.org/3";
  static const API_KEY = "963a72e5dee337768f8489fb19a5d74e";
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response =
        await client.get(Uri.parse("$BASE_URL/movie/popular?api_key=$API_KEY"));
    if (response.statusCode == 200) {
      final responsebody = json.decode(response.body);
      final List<MovieModel> Movies =
          responsebody['results'].map((e) => MovieModel.fromJson(e)).toList();
      return Movies;
    } else {
      throw Serverexception();
    }
  }

  @override
  Future<TrendingMovies> getTrendingMovies() async {
    final response = await client
        .get(Uri.parse("$BASE_URL/movie/trending?api_key=$API_KEY"));
    if (response.statusCode == 200) {
      final responsebody = TrendingMoviesmodelFromJson(response.body);

      return responsebody;
    } else {
      throw Serverexception();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response =
        await client.get(Uri.parse("$BASE_URL?query=$query&api_key=$API_KEY"));
    if (response.statusCode == 200) {
      final responsebody = json.decode(response.body);
      final List<MovieModel> Movies =
          responsebody['results'].map((e) => MovieModel.fromJson(e)).toList();
      return Movies;
    } else {
      throw Serverexception();
    }
  }
}
