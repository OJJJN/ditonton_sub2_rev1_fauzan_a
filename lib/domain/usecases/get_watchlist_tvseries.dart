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
    '/common'
    '/failure.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/repositories'
    '/tvseries_repository.dart';



class GetWatchlistTvSeries {
  final
  TvSeriesRepository
  _repository;


  GetWatchlistTvSeries(
      this
          ._repository
      );

  Future<Either<Failure,
      List<TvSeries>>> execute() {
    return _repository
        .getWatchlistTvSeries(
    );
  }
}
