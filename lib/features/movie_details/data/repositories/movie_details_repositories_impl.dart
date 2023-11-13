import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie_app/core/failure/failure.dart';
import 'package:flutter_movie_app/features/movie_details/data/datasources/movie_details_remote_datasource.dart';
import 'package:flutter_movie_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:flutter_movie_app/features/movie_details/domain/repositories/movie_details_repository.dart';

class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final MovieDetailsRemoteDataSource _movieDetailsRemoteDataSource;
  MovieDetailsRepositoryImpl(this._movieDetailsRemoteDataSource);
  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(
      String movieId) async {
    try {
      final result =
          await _movieDetailsRemoteDataSource.getMovieDetails(movieId);
      return right(result);
    } on DioException catch (e) {
      throw e;
    }
  }
}
