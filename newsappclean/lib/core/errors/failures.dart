class Failure {
  final String message;

  Failure(this.message);
}

class NetworkFailure extends Failure {
  NetworkFailure() : super("Network failure");
}

class ServerFailure extends Failure {
  ServerFailure() : super("Server failure");
}
