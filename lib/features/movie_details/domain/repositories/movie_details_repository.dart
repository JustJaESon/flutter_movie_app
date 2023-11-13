import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/failure/failure.dart';
import 'package:flutter_movie_app/features/movie_details/domain/entities/movie_details_entity.dart';

abstract class MovieDetailsRepository {
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(String movieId);
}
