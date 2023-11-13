import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/core/failure/failure.dart';
import 'package:flutter_movie_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:flutter_movie_app/features/movie_details/domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;
  MovieDetailsBloc(this._getMovieDetailsUseCase)
      : super(MovieDetailsInitial()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
  }

  FutureOr<void> _getMovieDetailsEvent(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    emit(MovieDetailsLoading());
    final failureOrEntity = await _getMovieDetailsUseCase(event.movieId);
    failureOrEntity.fold(
      (failed) => emit(MovieDetailsFailed(failure: failed)),
      (success) => emit(MovieDetailsLoaded(movieDetails: success)),
    );
  }
}
