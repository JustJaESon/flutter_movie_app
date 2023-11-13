import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_movie_app/features/movies/presentation/pages/popular_movies_page.dart';
import 'package:flutter_movie_app/features/movies/presentation/pages/top_rated_movies_page.dart';
import 'package:flutter_movie_app/features/movies/presentation/pages/upcoming_movies_page.dart';
import 'package:flutter_movie_app/features/movies/presentation/widgets/movies_carousel_widget.dart';
import 'package:flutter_movie_app/features/movies/presentation/widgets/movies_selection_card.dart';

class MoviesDashboard extends StatelessWidget {
  final List<MovieEntity> popularMovies;
  final List<MovieEntity> topRatedMovies;
  final List<MovieEntity> upcomingMovies;
  const MoviesDashboard(
      {super.key,
      required this.popularMovies,
      required this.topRatedMovies,
      required this.upcomingMovies});

  List<MovieEntity> allMovies(List<MovieEntity> popularMovies,
      List<MovieEntity> topRatedMovies, List<MovieEntity> upcomingMovies) {
    final List<MovieEntity> allMovies =
        popularMovies + topRatedMovies + upcomingMovies;
    return allMovies;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MoviesCarouselWidget(
            allMovies: allMovies(
          popularMovies,
          topRatedMovies,
          upcomingMovies,
        )),
        const SizedBox(
          height: 4,
        ),
        MoviesSelectionCard(
          movie: popularMovies,
          movieGroup: "Popular Movies",
          func: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PopularMoviesPage(
                  pageName: "Popular Movies",
                  page: 1,
                ),
              ),
            );
          },
        ),
        MoviesSelectionCard(
          movie: topRatedMovies,
          movieGroup: "Top Rated Movies",
          func: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TopRatedMoviesPage(
                  pageName: "Top Rated Movies",
                ),
              ),
            );
          },
        ),
        MoviesSelectionCard(
          movie: upcomingMovies,
          movieGroup: "Upcoming Movies",
          func: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UpcomingMoviesPage(
                  pageName: "Upcoming Movies",
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
