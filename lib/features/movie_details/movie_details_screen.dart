import 'package:flutter/material.dart';

import '../../core/client/client.dart';
import '../../core/components/components.dart';
import '../../core/components/warning_component.dart';
import '../../core/repositories/movie_repository.dart';
import '../../core/values/values.dart';
import '../controllers/credit_controller.dart';
import '../controllers/movie_details_controller.dart';
import '../states/credit_states.dart';
import '../states/movie_details_states.dart';
import 'components/components.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final MovieDetailsController _controller = MovieDetailsController(
    repository: MovieRepositoryImpl(
      apiClient: ApiClientImpl(),
    ),
  );

  final CreditController _controllerCredits = CreditController(
    repository: MovieRepositoryImpl(
      apiClient: ApiClientImpl(),
    ),
  );

  @override
  void initState() {
    super.initState();
    _getMovieDetails();
  }

  void _getMovieDetails() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final movieId = ModalRoute.of(context)?.settings.arguments as int;

      await _controller.getMovieDetails(movieId);
      _controllerCredits.getMovieDetails(movieId);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: ValueListenableBuilder<MovieDetailsStates>(
              valueListenable: _controller,
              builder: (_, states, __) {
                if (states is MovieDetailsError) {
                  return WarningComponent(
                    onRefresh: _getMovieDetails,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (states is MovieDetailsLoaging) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (states is MovieDetailsLoaded) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: size.height * .6,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: size.height * .4,
                              color: AppColors.backgroundStackColor,
                            ),
                            Positioned(
                              left: 20,
                              top: size.height * .03,
                              child: const BackButtonComponent(),
                            ),
                            Positioned(
                              top: size.height * .15,
                              child: Hero(
                                tag: states.movieDetails.id,
                                child: MoviePosterComponent(
                                  width: 216,
                                  height: size.height * 0.45,
                                  image: NetworkImage(
                                    ApiPathSettings.REQUEST_IMG(
                                      states.movieDetails.posterPath,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      AverageMovieVoteComponent(
                        voteAverage: states.movieDetails.voteAverage,
                      ),
                      const SizedBox(height: 32.0),
                      OriginalTitleComponent(
                        movieDetails: states.movieDetails,
                      ),
                      const SizedBox(height: 32.0),
                      MovieReleaseDateComponent(
                        date: states.movieDetails.releaseDate,
                        runtime: states.movieDetails.runtime,
                      ),
                      const SizedBox(height: 12.0),
                      GenreCardComponent(
                        genres: states.movieDetails.genres,
                      ),
                      const SizedBox(height: 56.0),
                      OverviewMovieComponent(
                        overview: states.movieDetails.overview,
                      ),
                      const SizedBox(height: 40.0),
                      BudgetComponent(
                        budget: states.movieDetails.budget,
                        companies: states.movieDetails.companies,
                      ),
                      const SizedBox(height: 40.0),
                      ValueListenableBuilder<CreditStates>(
                        valueListenable: _controllerCredits,
                        builder: (_, states, __) {
                          if (states is CreditLoaded) {
                            return CreditsComponent(credits: states.credits);
                          }
                          return Container();
                        },
                      ),
                      const SizedBox(height: 40.0),
                    ],
                  );
                }

                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
