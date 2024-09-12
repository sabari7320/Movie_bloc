part of 'trending_movies_bloc.dart';

@immutable
sealed class TrendingMoviesState {}

final class TrendingMoviesInitial extends TrendingMoviesState {}

final class TrendingMoviesLoading extends TrendingMoviesState {}

final class TrendingMoviesLoaded extends TrendingMoviesState {
  final List<Movie> Movies;

  TrendingMoviesLoaded(this.Movies);
}

final class TrendingMoviesError extends TrendingMoviesState {
  final String Message;

  TrendingMoviesError(this.Message);
}
