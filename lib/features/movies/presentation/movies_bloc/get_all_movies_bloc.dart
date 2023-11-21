import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/features/movies/domain/entities/movie_entity.dart';
import 'package:flutter_movie_app/features/movies/domain/usecases/get_all_popular_movies.dart';
import 'package:flutter_movie_app/features/movies/domain/usecases/get_all_top_rated_movies.dart';
import 'package:flutter_movie_app/features/movies/domain/usecases/get_all_upcoming_movies.dart';
import 'package:flutter_movie_app/features/movies/domain/usecases/get_search_movies_usecase.dart';
import 'package:flutter_movie_app/features/movies/presentation/movies_bloc/get_all_movies_event.dart';
import 'package:flutter_movie_app/features/movies/presentation/movies_bloc/get_all_movies_state.dart';

class MoviesBloc extends Bloc<AllMoviesEvent, MoviesState> {
  final GetAllPopularMoviesUseCase _getAllPopularMoviesUseCase;
  final GetAllTopRatedMoviesUseCase _getAllTopRatedMoviesUseCase;
  final GetAllUpcomingMoviesUseCase _getAllUpcomingMoviesUseCase;
  final GetSearchMoviesUseCase _getSearchMoviesUseCase;

  MoviesBloc(
    this._getAllPopularMoviesUseCase,
    this._getAllTopRatedMoviesUseCase,
    this._getAllUpcomingMoviesUseCase,
    this._getSearchMoviesUseCase,
  ) : super(MoviesLoading()) {
    on<GetPopularMoviesEvent>(_getPopularMoviesEvent);
    on<GetAllMoviesEvent>(_getAllMoviesEvent);
    on<GetTopRatedMoviesEvent>(_getTopRatedMoviesEvent);
    on<GetUpcomingMoviesEvent>(_getUpcomingMoviesEvent);
    on<SearchMoviesEvent>(_getSearchMoviesEvent);
  }

  FutureOr<void> _getPopularMoviesEvent(
      event, Emitter<MoviesState> emit) async {
    emit(MoviesLoading());
    final failureOrEntity = await _getAllPopularMoviesUseCase(event.page);
    failureOrEntity.fold(
      (failed) => emit(MoviesFailed(failure: failed)),
      (success) => emit(PopularMoviesLoaded(popularMovies: success)),
    );
  }

  FutureOr<void> _getTopRatedMoviesEvent(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(MoviesLoading());
    final failureOrEntity = await _getAllTopRatedMoviesUseCase(event.page);
    failureOrEntity.fold(
      (failed) => emit(MoviesFailed(failure: failed)),
      (success) => emit(TopRatedMoviesLoaded(topRatedMovies: success)),
    );
  }

  FutureOr<void> _getUpcomingMoviesEvent(
      GetUpcomingMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(MoviesLoading());
    final failureOrEntity = await _getAllUpcomingMoviesUseCase(event.page);
    failureOrEntity.fold(
      (failed) => emit(MoviesFailed(failure: failed)),
      (success) => emit(UpcomingMoviesLoaded(upcomingMovies: success)),
    );
  }

  FutureOr<void> _getAllMoviesEvent(
      GetAllMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(MoviesLoading());
    List<MovieEntity>? popularMovies;
    List<MovieEntity>? topRatedMovies;
    List<MovieEntity>? upcomingMovies;
    bool foldFailed = false;
    String failString = "";

    final failureOrEntityPopularMovies =
        await _getAllPopularMoviesUseCase(event.page);
    failureOrEntityPopularMovies.fold(
      (failed) => {
        foldFailed = true,
        failString = "popular failed",
      },
      (success) => popularMovies = success,
    );

    final failureOrEntityTopRatedMovies =
        await _getAllTopRatedMoviesUseCase(event.page);
    failureOrEntityTopRatedMovies.fold(
      (failed) => {
        foldFailed = true,
        failString = "top rated failed",
      },
      (success) => topRatedMovies = success,
    );

    final failureOrEntityUpcomingMovies =
        await _getAllUpcomingMoviesUseCase(event.page);
    failureOrEntityUpcomingMovies.fold(
      (failed) => {
        foldFailed = true,
        failString = "upcoming failed",
      },
      (success) => upcomingMovies = success,
    );
    if (foldFailed) {
      emit(AllMoviesFailedState(failString));
    } else {
      emit(AllMoviesLoadedState(
        popularMovies: popularMovies!,
        topRatedMovies: topRatedMovies!,
        upcomingMovies: upcomingMovies!,
      ));
    }
  }

  FutureOr<void> _getSearchMoviesEvent(
      SearchMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(MoviesLoading());
    final failureOrEntitySearch = await _getSearchMoviesUseCase(event.query);
    failureOrEntitySearch.fold(
      (failed) => emit(MoviesFailed(failure: failed)),
      (success) => emit(SearchedMoviesLoaded(searchedMovies: success)),
    );
  }
}
