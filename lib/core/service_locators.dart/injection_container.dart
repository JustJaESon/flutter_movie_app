import "package:dio/dio.dart";
import "package:flutter_movie_app/features/movie_details/data/datasources/movie_details_remote_datasource.dart";
import "package:flutter_movie_app/features/movie_details/data/repositories/movie_details_repositories_impl.dart";
import "package:flutter_movie_app/features/movie_details/domain/repositories/movie_details_repository.dart";
import "package:flutter_movie_app/features/movie_details/presentation/bloc/movie_details_bloc.dart";
import "package:flutter_movie_app/features/movies/data/datasources/remote/movie_remote_datasource.dart";
import "package:flutter_movie_app/features/movies/data/repositories/movie_repositories_impl.dart";
import "package:flutter_movie_app/features/movies/domain/repositories/movie_repository.dart";
import "package:flutter_movie_app/features/movies/domain/usecases/get_all_popular_movies.dart";
import "package:flutter_movie_app/features/movies/domain/usecases/get_all_top_rated_movies.dart";
import "package:flutter_movie_app/features/movies/domain/usecases/get_all_upcoming_movies.dart";
import 'package:flutter_movie_app/features/movie_details/domain/usecases/get_movie_details_usecase.dart';
import "package:flutter_movie_app/features/movies/domain/usecases/get_search_movies_usecase.dart";

import 'package:flutter_movie_app/features/movies/presentation/movies_bloc/get_all_movies_bloc.dart';

import "package:get_it/get_it.dart";

final sl = GetIt.I;

Future<void> init() async {
  sl.registerSingleton<Dio>(Dio());

  //DATA SOURCE
  sl.registerSingleton<MovieRemoteDataSource>(
      MovieRemoteDataSourceImpl(dio: sl()));

  sl.registerSingleton<MovieDetailsRemoteDataSource>(
      MovieDetailsRemoteDataSourceImpl(dio: sl()));

  //REPOSITORY
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl(sl()));
  sl.registerSingleton<MovieDetailsRepository>(
      MovieDetailsRepositoryImpl(sl()));

  //USE CASES
  sl.registerLazySingleton(() => GetAllPopularMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetAllTopRatedMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetAllUpcomingMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
  sl.registerLazySingleton(() => GetSearchMoviesUseCase(sl()));

  //BLOC
  sl.registerFactory<MoviesBloc>(() => MoviesBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc(sl()));
}
