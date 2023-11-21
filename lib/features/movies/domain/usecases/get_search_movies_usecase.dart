import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/core/failure/failure.dart';
import 'package:flutter_movie_app/core/utils/base_usecase.dart';
import 'package:flutter_movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_movie_app/features/movies/domain/repositories/movie_repository.dart';

class GetSearchMoviesUseCase extends BaseUseCase<List<MovieEntity>, String> {
  final MovieRepository _movieRepository;
  GetSearchMoviesUseCase(this._movieRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(String params) async {
    return await _movieRepository.getSearchMoviesFromDataSource(params);
  }
}
