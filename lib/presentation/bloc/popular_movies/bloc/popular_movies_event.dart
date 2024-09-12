part of 'popular_movies_bloc.dart';

@immutable
sealed class PopularMoviesEvent {}

class FetchPopularMovies extends PopularMoviesEvent {}
