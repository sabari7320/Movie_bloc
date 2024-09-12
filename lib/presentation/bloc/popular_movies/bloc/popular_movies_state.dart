part of 'popular_movies_bloc.dart';

@immutable
sealed class PopularMoviesState {}

final class PopularMoviesInitial extends PopularMoviesState {}

final class PopularMoviesLoading extends PopularMoviesState {}

final class PopularMoviesLoaded extends PopularMoviesState {
  final List<Movie> Movies;

  PopularMoviesLoaded(this.Movies);
}

final class PopularMoviesError extends PopularMoviesState {
  final String message;

  PopularMoviesError(this.message);
}
