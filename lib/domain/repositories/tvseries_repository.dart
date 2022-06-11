import 'package:'
    'dartz'
    '/dartz.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common/'
    'commutils.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/tvseries_detail.dart';



abstract class
TvSeriesRepository {
  Future<Either<Failure,
      List<TvSeries>>>
  getNowPlayingTvSeries(
      );


  Future<Either<Failure,
      List<TvSeries>>>
  getPopularTvSeries(
      );


  Future<Either<Failure,
      List<TvSeries>>> getTopRatedTvSeries(
      );


  Future<Either<Failure,
      TvSeriesDetail>> getTvSeriesDetail(int id
      );


  Future<Either<Failure,
      List<TvSeries>>> getTvSeriesRecommendations(int id
      );


  Future<Either<Failure,
      List<TvSeries>>> searchTvSeries(String query
      );


  Future<Either<Failure,
      String>> saveWatchlistTvSeries(TvSeriesDetail tv
      );


  Future<Either<Failure,
      String>> removeWatchlistTvSeries(TvSeriesDetail tv
      );


  Future<bool>
  isAddedToWatchlistTvSeries(int id
      );


  Future<Either<Failure,
      List<TvSeries>>> getWatchlistTvSeries(
      );
}
