import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/core/failure/failure.dart';
import 'package:flutter_movie_app/features/movies/domain/entities/movie_entity.dart';

abstract class MoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class AllMoviesFailedState extends MoviesState {
  final String? failed;

  AllMoviesFailedState(this.failed);
}

class MoviesFailed extends MoviesState {
  final Failure? failure;
  MoviesFailed({
    this.failure,
  });
}

class PopularMoviesLoaded extends MoviesState {
  final List<MovieEntity>? popularMovies;
  PopularMoviesLoaded({this.popularMovies});
}

class TopRatedMoviesLoaded extends MoviesState {
  final List<MovieEntity>? topRatedMovies;
  TopRatedMoviesLoaded({this.topRatedMovies});
}

class UpcomingMoviesLoaded extends MoviesState {
  final List<MovieEntity>? upcomingMovies;
  UpcomingMoviesLoaded({this.upcomingMovies});
}

class AllMoviesLoadedState extends MoviesState {
  final List<MovieEntity> popularMovies;
  final List<MovieEntity> topRatedMovies;
  final List<MovieEntity> upcomingMovies;

  AllMoviesLoadedState(
      {required this.popularMovies,
      required this.topRatedMovies,
      required this.upcomingMovies});
}
