import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/failure/failure.dart';
import 'package:flutter_movie_app/core/utils/base_usecase.dart';
import 'package:flutter_movie_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:flutter_movie_app/features/movie_details/domain/repositories/movie_details_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetailsEntity, String> {
  final MovieDetailsRepository _movieRepository;
  GetMovieDetailsUseCase(this._movieRepository);

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(String params) async {
    return await _movieRepository.getMovieDetails(params);
  }
}
