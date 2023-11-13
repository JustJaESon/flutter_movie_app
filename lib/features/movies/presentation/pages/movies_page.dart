import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/core/components/presentation/widgets/status_loading_widget.dart';
import 'package:flutter_movie_app/core/service_locators.dart/injection_container.dart';
import 'package:flutter_movie_app/features/movies/presentation/movies_bloc/get_all_movies_bloc.dart';
import 'package:flutter_movie_app/features/movies/presentation/movies_bloc/get_all_movies_event.dart';
import 'package:flutter_movie_app/features/movies/presentation/movies_bloc/get_all_movies_state.dart';
import 'package:flutter_movie_app/features/movies/presentation/widgets/movies_dashboard.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc>(
      create: (context) => sl()..add(const GetAllMoviesEvent(page: 1)),
      child: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
        if (state is MoviesLoading) {
          return const StatusLoadingWidget();
        } else if (state is AllMoviesLoadedState) {
          return SingleChildScrollView(
            child: MoviesDashboard(
                popularMovies: state.popularMovies,
                topRatedMovies: state.topRatedMovies,
                upcomingMovies: state.upcomingMovies),
          );
        } else if (state is AllMoviesFailedState) {
          return Center(
            child: Text(state.failed.toString()),
          );
        }
        return const Center(
          child: Text(
            "else",
            style: TextStyle(color: Colors.white),
          ),
        );
      }),
    );
  }
}
