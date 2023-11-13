part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

final class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetailsEntity movieDetails;

  const MovieDetailsLoaded({required this.movieDetails});
}

class MovieDetailsFailed extends MovieDetailsState {
  final Failure? failure;
  const MovieDetailsFailed({
    this.failure,
  });
}
