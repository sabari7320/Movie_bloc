import 'package:movie_bloc/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<TrendingMovies> getTrendingMovies();

  Future<List<MovieModel>> searchMovies(String query);

  Future<List<MovieModel>> getPopularMovies();
}
