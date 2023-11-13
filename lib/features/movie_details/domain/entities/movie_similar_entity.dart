import 'package:equatable/equatable.dart';

class MovieSimilarEntity extends Equatable {
  final int id;
  final String posterPath;

  const MovieSimilarEntity({
    required this.id,
    required this.posterPath,
  });

  List<Object?> get props => [
        id,
        posterPath,
      ];
}
