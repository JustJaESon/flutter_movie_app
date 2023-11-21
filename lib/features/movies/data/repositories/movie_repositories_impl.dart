import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie_app/core/failure/failure.dart';
import 'package:flutter_movie_app/features/movies/data/datasources/remote/movie_remote_datasource.dart';
import 'package:flutter_movie_app/features/movies/data/models/movie_model.dart';
import 'package:flutter_movie_app/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _movieRemoteDataSource;
  MovieRepositoryImpl(this._movieRemoteDataSource);

  @override
  Future<Either<Failure, List<MovieModel>>> getMoviesByPopularityFromDataSource(
      int page) async {
    try {
      final result = await _movieRemoteDataSource
          .getMoviesByPopularityFromDataSource(page);
      return right(result);
    } on DioException catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getMoviesByTopRatedFromDataSource(
      int page) async {
    try {
      final result =
          await _movieRemoteDataSource.getMoviesByTopRatedFromDataSource(page);
      return right(result);
    } on DioException catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getMoviesByUpcomingFromDataSource(
      int page) async {
    try {
      final result =
          await _movieRemoteDataSource.getMoviesByUpcomingFromDataSource(page);
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getSearchMoviesFromDataSource(
      String query) async {
    try {
      final result =
          await _movieRemoteDataSource.getSearchMoviesFromDataSource(query);
      return right(result);
    } on DioException catch (e) {
      return left(ServerFailure(error: e.toString()));
    }
  }
}
