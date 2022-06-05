import 'package:'
    'dartz'
    '/dartz.dart';


import 'package'
    ':ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/movie_detail.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/repositories'
    '/movie_repository.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/failure.dart';



class GetMovieDetail {
  final
  MovieRepository
  repository
  ;

  GetMovieDetail(
      this
          .repository
      );

  Future<
      Either<Failure,
          MovieDetail
      >> execute(
      int id
      ) {
    return
      repository
          .getMovieDetail(
          id
      );
  }
}
