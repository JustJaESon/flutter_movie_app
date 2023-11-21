import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/core/components/presentation/widgets/status_loading_widget.dart';
import 'package:flutter_movie_app/core/service_locators.dart/injection_container.dart';
import 'package:flutter_movie_app/features/movies/presentation/movies_bloc/get_all_movies_bloc.dart';
import 'package:flutter_movie_app/features/movies/presentation/movies_bloc/get_all_movies_event.dart';
import 'package:flutter_movie_app/features/movies/presentation/movies_bloc/get_all_movies_state.dart';
import 'package:flutter_movie_app/features/movies/presentation/widgets/more_movies_card_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesSearchScreen extends StatelessWidget {
  const MoviesSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc>(
      create: (context) => sl()..add(const SearchMoviesEvent(query: "")),
      child: Scaffold(
        appBar: AppBar(
          actionsIconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            "Search Movies",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Column(
          children: [
            const SearchTextField(),
            BlocBuilder<MoviesBloc, MoviesState>(
              builder: (context, state) {
                if (state is MoviesLoading) {
                  return const Expanded(
                      child: Center(child: StatusLoadingWidget()));
                } else if (state is SearchedMoviesLoaded) {
                  if (state.searchedMovies.isEmpty) {
                    return _noMoviesWidget(context);
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.searchedMovies.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MoviesCardWidget(
                            movieEntity: state.searchedMovies[index],
                          );
                        },
                      ),
                    );
                  }
                } else if (state is AllMoviesFailedState) {
                  return Center(
                    child: Text(state.failed.toString()),
                  );
                }
                return const Center(
                  child: Text(
                    "Search",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Expanded _noMoviesWidget(BuildContext context) {
    return Expanded(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .5.w,
          child: Text(
            "No movies found. Search for movies",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc>(
      create: (context) => sl<MoviesBloc>(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0.h),
        height: 44.h,
        width: MediaQuery.of(context).size.width * .9.w,
        child: TextField(
          onSubmitted: (searchQuery) {
            BlocProvider.of<MoviesBloc>(context)
                .add(SearchMoviesEvent(query: searchQuery));
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10.0),
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0.r),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
            hintText: "Search",
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
