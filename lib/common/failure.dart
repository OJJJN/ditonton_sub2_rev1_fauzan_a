//this is call the package
import 'package:'
    'equatable/'
    'equatable.dart';

//this is call the class
abstract class Failure
    extends
    Equatable {

  final
  String
  message
  ;

  const Failure(
      this
          .message
      );

  @override
  List<Object> get props =>
      [message
      ];
}

//this is call the class
class ServerFailure
    extends
    Failure {
  const ServerFailure(
      String message) : super(
      message);
}

//this is call the class
class ConnectionFailure
    extends
    Failure {
  const ConnectionFailure(
      String message) : super(
      message
  );
}

//this is call the class
class DatabaseFailure
    extends
    Failure {
  const DatabaseFailure(
      String message) : super(
      message
  );
}
