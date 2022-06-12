//this is call the package
import 'package:'
    'equatable/'
    'equatable.dart';


import 'package:'
    'flutter'
    '/widgets.dart';

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/genre.dart';







//this is call the class exception
class ServerException
    implements
        Exception {
}

//this is call the class exception
class DatabaseException
    implements
        Exception {
  final
  String
  message
  ;

  DatabaseException(
      this
          .message
      );
}


//this is call the class failure
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

//this is call the class failure
class ServerFailure
    extends
    Failure {
  const ServerFailure(
      String message) : super(
      message);
}

//this is call the class failure
class ConnectionFailure
    extends
    Failure {
  const ConnectionFailure(
      String message) : super(
      message
  );
}

//this is call the class failure
class DatabaseFailure
    extends
    Failure {
  const DatabaseFailure(
      String message) : super(
      message
  );
}

class SslFailure
    extends
    Failure {
  SslFailure(
      String message)
      : super
      (message
    );
}


//this is call package format genre
String showFormatGenres(
    List<
        Genre>
    genres
    ) {

  String
  result
  = '';


  for (
  var
  genre
  in genres
  ) {

    result
    += genre
        .name
        + ', ';

  }

  if (
  result
      .isEmpty
  ) {
    return
      result;
  }


  return
    result
        .substring(
        0,
        result
            .length
            - 2
    );

}

String
showFormatDurationFromList(
    List<
        int>
    runtimes
    ) {


  return
    runtimes
        .map(
            (runtime
            ) =>
                showFormatDuration(
                    runtime))
        .join(
        ", "
    );

}

String
showFormatDuration(
    int runtime
    ) {

  final
  int
  hours
  = runtime
      ~/
      60;


  final
  int
  minutes
  = runtime
      %
      60;


  if (
  hours
      > 0
  ) {

    return
      '${hours}h'
          ' ${minutes}m';


  } else {
    return
      '${minutes}m';

  }
}


//this is call package enum

enum
RequestState {
  Empty,
  Loading,
  Loaded,
  Error }


//this is call the package utils
final RouteObserver<
    ModalRoute>
routeObserver =
RouteObserver<
    ModalRoute>(
);





