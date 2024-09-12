import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_bloc/domain/entities/Movie.dart';
import 'package:movie_bloc/domain/usecases/search_movie.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies searchMovies;
  SearchMoviesBloc({required this.searchMovies})
      : super(SearchMoviesInitial()) {
    on<fetchsearchingmovie>((event, emit) async {
      emit(SearchMoviesLoading());
      // ignore: non_constant_identifier_names
      final FailureOrMovies = await searchMovies(event.query);
      FailureOrMovies.fold(
          (failure) => emit(SearchMoviesError(failure.toString())),
          (movies) => emit(SearchMoviesLoaded(movies)));
    });
  }
}
