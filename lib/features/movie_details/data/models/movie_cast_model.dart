import 'package:flutter_movie_app/features/movie_details/domain/entities/movie_cast_entity.dart';

class MovieCastModel extends MovieCastEntity {
  const MovieCastModel({
    required super.name,
    required super.profilePath,
  });

  factory MovieCastModel.fromJson(Map<String, dynamic> json) {
    return MovieCastModel(
      name: json['name'] ?? "",
      profilePath: json['profile_path'] ?? "/qPnZlG3EltTQvC3snWaEjPTtXP9.jpg",
    );
  }
}
