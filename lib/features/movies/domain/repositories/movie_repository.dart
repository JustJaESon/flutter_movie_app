import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/failure/failure.dart';
import 'package:flutter_movie_app/features/movies/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>>
      getMoviesByPopularityFromDataSource(int page);
  Future<Either<Failure, List<MovieEntity>>> getMoviesByTopRatedFromDataSource(
      int page);
  Future<Either<Failure, List<MovieEntity>>> getMoviesByUpcomingFromDataSource(
      int page);
}
