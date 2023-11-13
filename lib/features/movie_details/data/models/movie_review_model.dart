import 'package:flutter_movie_app/features/movie_details/domain/entities/movie_review_entity.dart';

import '../../../../core/utils/functions.dart';

class MovieReviewModel extends MovieReviewEntity {
  const MovieReviewModel({
    required super.authorName,
    required super.authorUsername,
    required super.avatarUrl,
    required super.rating,
    required super.content,
    required super.createdAt,
  });

  factory MovieReviewModel.fromJson(Map<String, dynamic> json) {
    return MovieReviewModel(
      authorName: getAuthorname(
          json['author_details']['name'], json['author_details']['username']),
      authorUsername: json['author_details']['username'] ?? "",
      avatarUrl: json['author_details']['avatar_path'] ??
          "/qPnZlG3EltTQvC3snWaEjPTtXP9.jpg",
      rating: json['author_details']['rating'] ?? 0,
      content: json['content'] ?? "",
      createdAt: json['created_at'] ?? "",
    );
  }
}
