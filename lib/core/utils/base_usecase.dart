import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/core/failure/failure.dart';

abstract class BaseUseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

class NoParameters extends Equatable {
  const NoParameters();
  @override
  List<Object?> get props => [];
}
