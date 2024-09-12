import 'package:fpdart/fpdart.dart';
import 'package:movie_bloc/core/errors/serverfailure.dart';
import 'package:movie_bloc/domain/entities/Movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getTrendingMovies();
  Future<Either<Failure, List<Movie>>> searchMovies(String query);
  Future<Either<Failure, List<Movie>>> getPopularMovies();
}
