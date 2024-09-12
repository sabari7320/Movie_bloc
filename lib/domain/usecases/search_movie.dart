import 'package:fpdart/fpdart.dart';
import 'package:movie_bloc/core/errors/serverfailure.dart';
import 'package:movie_bloc/domain/entities/Movie.dart';
import 'package:movie_bloc/domain/repositories/Movie_repository.dart';

class SearchMovies {
  final MovieRepository repostory;

  SearchMovies(this.repostory);

  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await repostory.searchMovies(query);
  }
}
