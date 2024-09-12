import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc/injection_container.dart';
import 'package:movie_bloc/presentation/bloc/popular_movies/bloc/popular_movies_bloc.dart';
import 'package:movie_bloc/presentation/bloc/search_movies/bloc/search_movies_bloc.dart';
import 'package:movie_bloc/presentation/bloc/trending_movies/bloc/trending_movies_bloc.dart';
import 'package:movie_bloc/presentation/pages/home_screen.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
          ),
          BlocProvider(
            create: (context) =>
                getIt<TrendingMoviesBloc>()..add(FetchTrendingMovies()),
          ),
          BlocProvider(
            create: (context) => getIt<SearchMoviesBloc>(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
