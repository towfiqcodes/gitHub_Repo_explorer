// domain/failures/failure.dart
abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure(String message) : super(message);
}


class ServerException implements Exception {
  final String message;
  ServerException([this.message = 'Server error']);
}
