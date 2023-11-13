import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final bool adult;
  final int id;
  final String backdropPath;
  final List<dynamic> genreIds;
  final String originalLanguage;
  final String title;
  final String overview;
  final String popularity;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;

  const MovieEntity(
      {required this.adult,
      required this.id,
      required this.backdropPath,
      required this.genreIds,
      required this.originalLanguage,
      required this.title,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage});

  List<Object?> get props => [
        adult,
        id,
        backdropPath,
        genreIds,
        originalLanguage,
        title,
        overview,
        popularity,
        posterPath,
        releaseDate,
        voteAverage
      ];
}
