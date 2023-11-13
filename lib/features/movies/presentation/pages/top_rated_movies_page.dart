import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/core/components/presentation/widgets/status_failed_widget.dart';
import 'package:flutter_movie_app/core/components/presentation/widgets/status_loading_widget.dart';
import 'package:flutter_movie_app/core/components/presentation/widgets/status_nothing_widget.dart';
import 'package:flutter_movie_app/features/movies/presentation/movies_bloc/get_all_movies_bloc.dart';
import 'package:flutter_movie_app/features/movies/presentation/movies_bloc/get_all_movies_state.dart';
import 'package:flutter_movie_app/features/movies/presentation/widgets/more_movies_card_widget.dart';
import '../../../../core/service_locators.dart/injection_container.dart';
import '../movies_bloc/get_all_movies_event.dart';

class TopRatedMoviesPage extends StatelessWidget {
  final String pageName;
  const TopRatedMoviesPage({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc>(
      create: (context) => sl()..add(const GetTopRatedMoviesEvent(page: 1)),
      child: Scaffold(
          appBar: _customAppBar(context),
          body: BlocBuilder<MoviesBloc, MoviesState>(
            builder: (_, state) {
              if (state is MoviesLoading) {
                return const StatusLoadingWidget();
              } else if (state is TopRatedMoviesLoaded) {
                return _topRatedMoviesList(state);
              } else if (state is MoviesFailed) {
                return StatusFailedWidget(message: state.failure.toString());
              } else {
                return const StatusNothingWidget();
              }
            },
          )),
    );
  }

  ListView _topRatedMoviesList(TopRatedMoviesLoaded state) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: state.topRatedMovies!.length,
      itemBuilder: (BuildContext context, int index) {
        return MoviesCardWidget(
          movieEntity: state.topRatedMovies![index],
        );
      },
    );
  }

  AppBar _customAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      title: Text(
        pageName,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}