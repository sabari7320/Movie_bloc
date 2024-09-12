part of 'trending_movies_bloc.dart';

@immutable
sealed class TrendingMoviesEvent {}

//abstract class TrendingMoviesEvent{}

class FetchTrendingMovies extends TrendingMoviesEvent {}
