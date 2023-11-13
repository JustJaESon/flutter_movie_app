// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:flutter_movie_app/features/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:flutter_movie_app/features/movie_details/presentation/widgets/movie_details_similar_widget.dart';
import 'package:flutter_movie_app/features/movie_details/presentation/widgets/movies_details_cast.dart';
import 'package:flutter_movie_app/features/movie_details/presentation/widgets/movies_details_header_widget.dart';
import 'package:flutter_movie_app/features/movie_details/presentation/widgets/movies_details_reviews.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/service_locators.dart/injection_container.dart';

class MovieDetailsPage extends StatelessWidget {
  final int movieId;
  const MovieDetailsPage({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailsBloc>(
      create: (context) => sl<MovieDetailsBloc>()
        ..add(GetMovieDetailsEvent(movieId: movieId.toString())),
      child: Scaffold(
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MovieDetailsLoaded) {
              return MovieDetailsView(
                movieDetails: state.movieDetails,
              );
            } else if (state is MovieDetailsFailed) {
              return Center(
                child: Text(state.failure.toString()),
              );
            } else {
              return const Center(
                child: Text("basta may error "),
              );
            }
          },
        ),
      ),
    );
  }
}

class MovieDetailsView extends StatelessWidget {
  final MovieDetailsEntity movieDetails;
  const MovieDetailsView({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SingleChildScrollView(
        child: Column(
          children: [
            DetailsHeaderWidget(
              movieDetails: movieDetails,
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Overview",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    movieDetails.overview,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  MovieDetailsCastWidget(casts: movieDetails.movieCasts),
                  MoviesDetailsReviewsWidget(movieDetails.movieReviews),
                  SizedBox(
                    height: 16.h,
                  ),
                  MovieDetailsSimilarWidget(
                    movieSimilar: movieDetails.movieSimilar,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SafeArea(
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
    ]);
  }
}
