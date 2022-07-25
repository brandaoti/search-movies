import 'package:flutter/material.dart';

import '../../core/client/api_client.dart';
import '../../core/components/warning_component.dart';
import '../../core/repositories/movie_repository.dart';
import '../controllers/movie_controller.dart';
import '../states/movie_states.dart';
import 'components/components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieController _controller = MovieController(
    repository: MovieRepositoryImpl(
      apiClient: ApiClientImpl(),
    ),
  );

  @override
  void initState() {
    super.initState();
    _getMovies();
  }

  void _getMovies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _controller.loadGenres();
      _controller.loadMovies();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<MovieStates>(
          valueListenable: _controller,
          builder: (_, states, __) {
            if (states is MovieLoaging) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (states is MovieError) {
              return Center(child: Text(states.message));
            }

            if (states is MovieLoaded) {
              return Column(
                children: [
                  HeaderComponent(
                    genres: states.genres,
                    onChangedGenre: (genreId) {
                      _controller.getMovieByCategory(genreId);
                    },
                    onSearchChanged: (value) {
                      _controller.onSearchMovies(value);
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: states.movies.length,
                      itemBuilder: (_, index) {
                        final movies = states.movies[index];

                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/movie_details',
                              arguments: movies.id,
                            );
                          },
                          child: Hero(
                            tag: movies.id,
                            child: MovieCardComponent(movie: movies),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }

            return WarningComponent(
              onRefresh: _getMovies,
              child: const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
