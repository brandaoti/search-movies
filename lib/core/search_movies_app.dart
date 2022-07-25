import 'package:flutter/material.dart';
import 'package:search_movies/core/helpers/app_theme.dart';

import '../features/home/home_screen.dart';
import '../features/movie_details/movie_details_screen.dart';

class SearchMoviesApp extends StatelessWidget {
  const SearchMoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Movies',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      routes: {
        '/': (context) => const HomeScreen(),
        '/movie_details': (context) => const MovieDetailsScreen(),
      },
    );
  }
}
