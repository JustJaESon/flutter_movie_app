import 'package:flutter_movie_app/core/utils/functions.dart';
import 'package:flutter_movie_app/features/movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.adult,
    required super.id,
    required super.backdropPath,
    required super.genreIds,
    required super.originalLanguage,
    required super.title,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'] ?? "",
      id: json['id'] ?? "",
      backdropPath: json['backdrop_path'] ?? "",
      genreIds: json['genre_ids'] ?? "",
      originalLanguage: json['original_language'] ?? "",
      title: json['title'] ?? "",
      overview: json['overview'] ?? "",
      popularity: json["popularity"].toString(),
      posterPath: json['poster_path'] ?? "",
      releaseDate: getDate(json["release_date"]),
      voteAverage: json['vote_average'],
    );
  }
}
