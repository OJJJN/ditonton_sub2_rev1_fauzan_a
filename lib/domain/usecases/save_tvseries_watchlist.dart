import 'package:'
    'dartz'
    '/dartz.dart';



import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/tvseries_detail.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/repositories'
    '/tvseries_repository.dart';



class SaveWatchlistTvSeries {
  final
  TvSeriesRepository
  repository;

  SaveWatchlistTvSeries(
      this
          .repository
      );

  Future<
      Either<
          dynamic,
          String>>
  execute(
      TvSeriesDetail
      tvseries
      ) {
    return
      repository
        .saveWatchlistTvSeries(
        tvseries
    );
  }
}
