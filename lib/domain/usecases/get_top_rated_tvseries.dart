import 'package:'
    'dartz'
    '/dartz.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/failure.dart';


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



class GetTopRatedTvSeries {
  final
  TvSeriesRepository repository;

  GetTopRatedTvSeries(
      this.repository
      );


  Future<Either<Failure,
      List<TvSeries>>> execute() {
    return repository
        .getTopRatedTvSeries(
    );
  }
}
