import 'package:flutter_movie_app/features/movie_details/domain/entities/movie_similar_entity.dart';

class MovieSimilarModel extends MovieSimilarEntity {
  const MovieSimilarModel({
    required super.id,
    required super.posterPath,
  });

  factory MovieSimilarModel.fromJson(Map<String, dynamic> json) {
    return MovieSimilarModel(
      id: json['id'],
      posterPath: json['poster_path'] ?? "",
    );
  }
}
