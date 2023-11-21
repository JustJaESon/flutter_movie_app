import 'package:equatable/equatable.dart';

class MovieReviewEntity extends Equatable {
  final String authorName;
  final String authorUsername;
  final String avatarUrl;
  final double rating;
  final String content;
  final String createdAt;

  const MovieReviewEntity({
    required this.authorName,
    required this.authorUsername,
    required this.avatarUrl,
    required this.rating,
    required this.content,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        authorName,
        authorUsername,
        avatarUrl,
        rating,
        content,
        createdAt,
      ];
}
