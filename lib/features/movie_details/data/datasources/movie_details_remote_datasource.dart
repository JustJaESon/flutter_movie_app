import 'package:dio/dio.dart';
import 'package:flutter_movie_app/core/constant/api_constants.dart';
import 'package:flutter_movie_app/core/failure/failure.dart';
import 'package:flutter_movie_app/core/utils/functions.dart';
import 'package:flutter_movie_app/features/movie_details/data/models/movie_details_model.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetailsModel> getMovieDetails(String movieId);
}

class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final Dio dio;
  MovieDetailsRemoteDataSourceImpl({required this.dio});
  @override
  Future<MovieDetailsModel> getMovieDetails(String movieId) async {
    final response = await dio.get(getMovieDetailsPath(movieId, apiKey));
    if (response.statusCode != 200) {
      throw ServerFailure(error: response.statusCode.toString());
    } else {
      return MovieDetailsModel.fromJson(response.data);
    }
  }
}
