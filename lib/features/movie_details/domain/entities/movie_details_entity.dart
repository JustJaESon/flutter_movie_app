import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/features/movie_details/domain/entities/movie_cast_entity.dart';
import 'package:flutter_movie_app/features/movie_details/domain/entities/movie_review_entity.dart';
import 'package:flutter_movie_app/features/movie_details/domain/entities/movie_similar_entity.dart';

class MovieDetailsEntity extends Equatable {
  final int id;
  final bool adult;
  final String backdropPath;
  final String posterPath;
  final String genres;
  final String homepage;
  final String imdbId;
  final String originalTitle;
  final String overview;
  final double voteAverage;
  final String voteCount;
  final List<MovieCastEntity> movieCasts;
  final String relaseDate;
  final String tagline;
  final String runtime;
  final List<MovieReviewEntity> movieReviews;
  final List<MovieSimilarEntity> movieSimilar;

  const MovieDetailsEntity(
      {required this.posterPath,
      required this.id,
      required this.adult,
      required this.backdropPath,
      required this.genres,
      required this.homepage,
      required this.imdbId,
      required this.originalTitle,
      required this.overview,
      required this.voteCount,
      required this.voteAverage,
      required this.movieCasts,
      required this.relaseDate,
      required this.tagline,
      required this.runtime,
      required this.movieReviews,
      required this.movieSimilar});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        adult,
        backdropPath,
        genres,
        homepage,
        imdbId,
        originalTitle,
        overview,
        voteCount,
        voteAverage,
        movieCasts,
        relaseDate,
        tagline,
        posterPath,
        runtime,
        movieReviews,
        movieSimilar
      ];
}
