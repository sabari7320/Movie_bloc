import 'package:fpdart/fpdart.dart';
import 'package:movie_bloc/core/errors/serverfailure.dart';
import 'package:movie_bloc/domain/entities/Movie.dart';
import 'package:movie_bloc/domain/repositories/Movie_repository.dart';

class GetTrendingMovies {
  final MovieRepository repostory;

  GetTrendingMovies(this.repostory);

  Future<Either<Failure, List<Movie>>> call() async {
    return await repostory.getTrendingMovies();
  }
}
