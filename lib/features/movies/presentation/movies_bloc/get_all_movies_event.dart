// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class AllMoviesEvent extends Equatable {
  const AllMoviesEvent();

  @override
  List<Object> get props => [];
}

class SearchMoviesEvent extends AllMoviesEvent {
  final String query;
  const SearchMoviesEvent({
    required this.query,
  });
}

class GetPopularMoviesEvent extends AllMoviesEvent {
  final int page;
  const GetPopularMoviesEvent({required this.page});
}

class GetTopRatedMoviesEvent extends AllMoviesEvent {
  final int page;
  const GetTopRatedMoviesEvent({required this.page});
}

class GetUpcomingMoviesEvent extends AllMoviesEvent {
  final int page;
  const GetUpcomingMoviesEvent({required this.page});
}

class GetAllMoviesEvent extends AllMoviesEvent {
  final int page;
  const GetAllMoviesEvent({required this.page});
}

class GetMovieDetailsEvent extends AllMoviesEvent {
  final int movieId;
  const GetMovieDetailsEvent({required this.movieId});
}

class GetMoviesByPage extends AllMoviesEvent {
  final int page;
  const GetMoviesByPage({required this.page});
}
