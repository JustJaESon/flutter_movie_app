// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Failure {
  String error;
  Failure({
    required this.error,
  });
}

class ServerFailure extends Failure {
  ServerFailure({required super.error});
}

class ApiFailure extends Failure {
  ApiFailure({required super.error});
}

class DioFailure extends Failure {
  DioFailure({required super.error});
}
