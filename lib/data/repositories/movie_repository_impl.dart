import 'package:fpdart/fpdart.dart';
import 'package:movie_bloc/core/errors/serverexception.dart';
import 'package:movie_bloc/core/errors/serverfailure.dart';
import 'package:movie_bloc/data/datasource/movie_remote_data_source.dart';
import 'package:movie_bloc/data/models/movie_model.dart';
import 'package:movie_bloc/domain/entities/Movie.dart';
import 'package:movie_bloc/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final List<MovieModel> MovieModels =
          await remoteDataSource.getPopularMovies();
      final List<Movie> Movies =
          MovieModels.map((model) => model.toEntity()).toList();
      return Right(Movies);
    } on Serverexception {
      return Left(Serverfailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies() async {
    try {
      final TrendingMovies MovieModels =
          await remoteDataSource.getTrendingMovies();
      final List<Movie> Movies =
          MovieModels.map((model) => model.toEntity()).toList();
      return Right(Movies);
    } on Serverexception {
      return Left(Serverfailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> searchMovies(String query) async {
    try {
      final List<MovieModel> MovieModels =
          await remoteDataSource.searchMovies(query);
      final List<Movie> Movies =
          MovieModels.map((model) => model.toEntity()).toList();
      return Right(Movies);
    } on Serverexception {
      return Left(Serverfailure());
    }
  }
}
