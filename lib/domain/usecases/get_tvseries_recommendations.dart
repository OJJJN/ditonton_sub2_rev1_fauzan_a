import 'package:'
    'dartz'
    '/dartz.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/tvseries.dart';




import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/repositories'
    '/tvseries_repository.dart';



class GetTvSeriesRecommendations {
  final
  TvSeriesRepository
  repository;

  GetTvSeriesRecommendations(
      this
          .repository
      );

  Future<
      Either<
          dynamic,
          List<TvSeries>>>
  execute(
      id
      ) {

    return
      repository
        .getTvSeriesRecommendations(
        id
    );
  }
}
