import 'package:dio/dio.dart';
import 'package:flutter_movie_app/core/constants/api_constants.dart';
import 'package:flutter_movie_app/core/failure/failure.dart';
import 'package:flutter_movie_app/core/utils/functions.dart';
import 'package:flutter_movie_app/features/movies/data/models/movie_model.dart';

import '../../../../../core/constants/api_key.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getMoviesByPopularityFromDataSource(int page);
  Future<List<MovieModel>> getMoviesByTopRatedFromDataSource(int page);
  Future<List<MovieModel>> getMoviesByUpcomingFromDataSource(int page);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;
  MovieRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<MovieModel>> getMoviesByPopularityFromDataSource(int page) async {
    final response =
        await dio.get(getAllPopularMoviesPath(page, apiKey, baseUrl));
    if (response.statusCode != 200) {
      throw ServerFailure(error: response.statusCode.toString());
    } else {
      final List<MovieModel> popularMovies =
          List<Map<String, dynamic>>.from(response.data['results'])
              .map((map) => MovieModel.fromJson(map))
              .toList();
      return popularMovies;
    }
  }

  @override
  Future<List<MovieModel>> getMoviesByTopRatedFromDataSource(int page) async {
    final response = await dio.get(getAllTopRatedMoviesPath(page, apiKey));
    if (response.statusCode != 200) {
      throw ServerFailure(error: response.statusCode.toString());
    } else {
      final List<MovieModel> topRatedMovies =
          List<Map<String, dynamic>>.from(response.data['results'])
              .map((map) => MovieModel.fromJson(map))
              .toList();
      return topRatedMovies;
    }
  }

  @override
  Future<List<MovieModel>> getMoviesByUpcomingFromDataSource(int page) async {
    final response = await dio.get(getAllUpcomingMoviesPath(page, apiKey));
    if (response.statusCode != 200) {
      throw ServerFailure(error: response.statusCode.toString());
    } else {
      final List<MovieModel> upcomingMovies =
          List<Map<String, dynamic>>.from(response.data['results'])
              .map((map) => MovieModel.fromJson(map))
              .toList();
      return upcomingMovies;
    }
  }
}
