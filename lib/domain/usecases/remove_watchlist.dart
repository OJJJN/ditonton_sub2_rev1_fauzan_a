import 'package:'
    'dartz'
    '/dartz.dart';




import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/movie_detail.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/repositories'
    '/movie_repository.dart';



class RemoveWatchlist {
  final
  MovieRepository
  repository
  ;

  RemoveWatchlist(
      this
          .repository
      );

  Future<
      Either<
          dynamic,
          String>>
  execute(
      MovieDetail movie
      ) {

    return
      repository
          .removeWatchlist(
          movie
      );
  }
}
