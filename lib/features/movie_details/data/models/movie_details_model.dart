import 'package:flutter_movie_app/features/movie_details/data/models/movie_similar_model.dart';
import 'package:flutter_movie_app/features/movie_details/domain/entities/movie_details_entity.dart';
import '../../../../core/utils/functions.dart';
import 'movie_cast_model.dart';
import 'movie_review_model.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel(
      {required super.id,
      required super.adult,
      required super.backdropPath,
      required super.genres,
      required super.homepage,
      required super.imdbId,
      required super.originalTitle,
      required super.overview,
      required super.voteCount,
      required super.voteAverage,
      required super.movieCasts,
      required super.relaseDate,
      required super.tagline,
      required super.posterPath,
      required super.runtime,
      required super.movieReviews,
      required super.movieSimilar});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'] ?? "",
      adult: json['adult'] ?? "",
      backdropPath: json['backdrop_path'] ?? "",
      genres: getGenres(json['genres']),
      homepage: json["homepage"] ?? "",
      imdbId: json['imdb_id'] ?? "",
      originalTitle: json['title'] ?? "",
      overview: json['overview'] ?? "",
      voteCount: getVotesCount(json["vote_count"]),
      voteAverage:
          double.parse((json['vote_average'] as double).toStringAsFixed(1)),
      movieCasts: List<MovieCastModel>.from((json['credits']['cast'] as List)
          .map((e) => MovieCastModel.fromJson(e))),
      relaseDate: getDate(json['release_date']),
      tagline: json['tagline'] ?? "",
      posterPath: json['poster_path'] ?? "",
      runtime: getRuntime(json['runtime']),
      movieReviews: List<MovieReviewModel>.from(
          (json['reviews']['results'] as List)
              .map((e) => MovieReviewModel.fromJson(e))),
      movieSimilar: List<MovieSimilarModel>.from(
          (json['similar']['results'] as List)
              .map((e) => MovieSimilarModel.fromJson(e))),
    );
  }
}
