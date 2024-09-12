part of 'search_movies_bloc.dart';

@immutable
sealed class SearchMoviesEvent {}

class fetchsearchingmovie extends SearchMoviesEvent {
  final String query;

  fetchsearchingmovie(this.query);
}
