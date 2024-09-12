part of 'search_movies_bloc.dart';

@immutable
sealed class SearchMoviesState {}

final class SearchMoviesInitial extends SearchMoviesState {}

final class SearchMoviesLoading extends SearchMoviesState {}

final class SearchMoviesLoaded extends SearchMoviesState {
  final List<Movie> Movies;

  SearchMoviesLoaded(this.Movies);
}

final class SearchMoviesError extends SearchMoviesState {
  final String message;

  SearchMoviesError(this.message);
}
