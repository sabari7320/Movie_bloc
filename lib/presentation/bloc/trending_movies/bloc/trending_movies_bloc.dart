import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
//import 'package:meta/meta.dart';
import 'package:movie_bloc/domain/entities/Movie.dart';
import 'package:movie_bloc/domain/usecases/get_trending_movies.dart';

part 'trending_movies_event.dart';
part 'trending_movies_state.dart';

class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetTrendingMovies getTrendingMovies;

  TrendingMoviesBloc({required this.getTrendingMovies})
      : super(TrendingMoviesInitial()) {
    on<FetchTrendingMovies>((event, emit) async {
      emit(TrendingMoviesLoading());
      // ignore: non_constant_identifier_names
      final FailureOrMovies = await getTrendingMovies.call();
      FailureOrMovies.fold(
          (failure) => emit(TrendingMoviesError(failure.toString())),
          (movies) => emit(TrendingMoviesLoaded(movies)));
    });
  }
}
