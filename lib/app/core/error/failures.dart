abstract class Failure {
  final String message;

  const Failure(this.message);
  @override
  String toString() => message;
}

class NetworkFailure extends Failure {
  const NetworkFailure(String m) : super(m);
}

class ServerFailure extends Failure {
  const ServerFailure(String m) : super(m);
}

class CacheFailure extends Failure {
  const CacheFailure(String m) : super(m);
}
