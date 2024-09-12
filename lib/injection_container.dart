import 'package:get_it/get_it.dart';
import 'package:movie_bloc/data/datasource/movie_remote_data_source.dart';
import 'package:movie_bloc/data/datasource/remote/movie_remote_data_source_impl.dart';
import 'package:movie_bloc/data/repositories/movie_repository_impl.dart';
import 'package:movie_bloc/domain/repositories/movie_repository.dart';
import 'package:movie_bloc/domain/usecases/get_popular_movies.dart';
import 'package:movie_bloc/domain/usecases/get_trending_movies.dart';
import 'package:movie_bloc/domain/usecases/search_movie.dart';
import 'package:movie_bloc/presentation/bloc/popular_movies/bloc/popular_movies_bloc.dart';
import 'package:movie_bloc/presentation/bloc/search_movies/bloc/search_movies_bloc.dart';
import 'package:movie_bloc/presentation/bloc/trending_movies/bloc/trending_movies_bloc.dart';
import 'package:http/http.dart' as http;

final GetIt  getIt = GetIt.instance;

// void init() {
//   getIt.registerFactory(() => PopularMoviesBloc(getPopularMovies: getIt()));
//
//   getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));
//
//   getIt.registerFactory(() => SearchMoviesBloc(searchMovies: getIt()));
//
//   //USECASES
//
//   getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
//
//   getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
//
//   getIt.registerLazySingleton(() => SearchMovies(getIt()));
//
// //Repository
//
//   getIt.registerLazySingleton<MovieRepository>(
//       () => MovieRepositoryImpl(remoteDataSource: getIt()));
//
// //Data Source
//   getIt.registerLazySingleton<MovieRemoteDataSource>(
//       () => MovieRemoteDataSourceImpl(client: getIt()));
//
// //Http Services
//   getIt.registerLazySingleton(() => http.Client());
// }

void init() {
  // Register Http Client
  getIt.registerLazySingleton(() => http.Client());

  // Data Source
  getIt.registerLazySingleton<MovieRemoteDataSource>(
          () => MovieRemoteDataSourceImpl(client: getIt()));

  // Repository
  getIt.registerLazySingleton<MovieRepository>(
          () => MovieRepositoryImpl(remoteDataSource: getIt()));

  // Use Cases
  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  getIt.registerLazySingleton(() => SearchMovies(getIt()));

  // Blocs
  getIt.registerFactory(() => PopularMoviesBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => SearchMoviesBloc(searchMovies: getIt()));
}
