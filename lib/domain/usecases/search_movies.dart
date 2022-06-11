import 'package:'
    'dartz'
    '/dartz.dart';




import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/movie.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/repositories'
    '/movie_repository.dart';



class SearchMovies {
  final
  MovieRepository
  repository
  ;

  SearchMovies(
      this
          .repository
      );

  Future<
      Either<
          dynamic,
          List<Movie>>>
  execute(
      String query
      ) {


    return
      repository
          .searchMovies(
          query
      );
  }
}
