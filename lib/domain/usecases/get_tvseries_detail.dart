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
    '/common'
    '/failure.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/repositories'
    '/tvseries_repository.dart';



class GetTvSeriesDetail {
  final
  TvSeriesRepository
  repository;

  GetTvSeriesDetail(
      this.repository
      );

  Future<Either<Failure,
      TvSeriesDetail>> execute(int id) {
    return repository
        .getTvSeriesDetail(
        id
    );
  }
}
