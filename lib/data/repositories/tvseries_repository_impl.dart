import 'dart:'
    'io';


import 'package:'
    'dartz'
    '/dartz.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/data'
    '/datasources'
    '/tvseries_local_data_source.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/data'
    '/datasources'
    '/tvseries_remote_data_source.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/data'
    '/models'
    '/tvseries_table.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common/'
    'commutils.dart';


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





class TvSeriesRepositoryImpl
    implements
        TvSeriesRepository {
  final
  TvSeriesRemoteDataSource
  remoteDataSource;


  final
  TvSeriesLocalDataSource
  localDataSource;



  TvSeriesRepositoryImpl({
    required this
        .remoteDataSource,
    required this
        .localDataSource,
  });

  @override
  Future<Either<Failure,
      List<TvSeries>>>
  getNowPlayingTvSeries()
  async {
    try {
      final
      result
      = await remoteDataSource
          .getNowPlayingTvSeries(
      );

      return Right(
          result.map((model) =>
              model.toEntity()).toList());
    } on ServerException {
      return
        Left(
            ServerFailure(
                '')
        );
    } on SocketException {
      return
        Left(
            ConnectionFailure(
                'Failed to connect to the network')
        );
    } on TlsException {
      return
        Left(
            SslFailure(
                'Certificate unvalid')
        );
    }
  }



  @override
  Future<Either<Failure, TvSeriesDetail>>
  getTvSeriesDetail(
      int id)
  async {
    try {
      final
      result
      = await remoteDataSource
          .getTvSeriesDetail(
          id
      );

      return
        Right(
            result
                .toEntity()
        );
    } on ServerException {
      return
        Left(
            ServerFailure(
                '')
        );
    } on SocketException {
      return
        Left(
            ConnectionFailure(
                'Failed to connect to the network')
        );
    } on TlsException {
      return
        Left(
            SslFailure(
                'Certificate unvalid')
        );
    }
  }

  @override
  Future<Either<Failure, List<TvSeries>>>
  getTvSeriesRecommendations(
      int id)
  async {
    try {
      final
      result
      = await remoteDataSource
          .getTvSeriesRecommendations(
          id
      );

      return Right(
          result.map((model) =>
              model.toEntity()).toList());
    } on ServerException {
      return
        Left(
            ServerFailure(
                '')
        );
    } on SocketException {
      return
        Left(
            ConnectionFailure(
                'Failed to connect to the network')
        );
    } on TlsException {
      return
        Left(
            SslFailure(
                'Certificate unvalid')
        );
    }
  }

  @override
  Future<Either<Failure, List<TvSeries>>>
  getPopularTvSeries()
  async {
    try {
      final
      result
      = await remoteDataSource
          .getPopularTvSeries(
      );
      return
        Right(
            result.map((model)
            => model.toEntity()).toList()
        );
    } on ServerException {
      return
        Left(
            ServerFailure(
                '')
        );
    } on SocketException {
      return
        Left(
            ConnectionFailure(
                'Failed to connect to the network')
        );
    } on TlsException {
      return
        Left(
            SslFailure(
                'Certificate unvalid')
        );
    }
  }

  @override
  Future<Either<Failure, List<TvSeries>>>
  getTopRatedTvSeries()
  async {
    try {
      final
      result
      = await remoteDataSource
          .getTopRatedTvSeries(
      );
      return
        Right(
            result.map((model)
            => model.toEntity()).toList()
        );
    } on ServerException {
      return
        Left(
            ServerFailure(
                '')
        );
    } on SocketException {
      return
        Left(
            ConnectionFailure(
                'Failed to connect to the network')
        );
    } on TlsException {
      return
        Left(
            SslFailure(
                'Certificate unvalid')
        );
    }
  }

  @override
  Future<Either<Failure, List<TvSeries>>>
  searchTvSeries(String query)
  async {
    try {
      final
      result
      = await remoteDataSource
          .searchTvSeries(query
      );

      return
        Right(result.map((model)
        => model.toEntity()).toList()
        );

    } on ServerException {
      return
        Left(
            ServerFailure(
                '')
        );
    } on SocketException {
      return
        Left(
            ConnectionFailure(
                'Failed to connect to the network')
        );
    } on TlsException {
      return
        Left(
            SslFailure(
                'Certificate unvalid')
        );
    }
  }

  @override
  Future<Either<Failure, String>>
  saveWatchlistTvSeries(
      TvSeriesDetail tvseries)
  async {
    try {
      final
      result
      = await localDataSource
          .insertWatchlistTvSeries(
          TvSeriesTable.fromEntity(
              tvseries)
      );

      return
        Right(
            result
        );
    } on DatabaseException catch (e) {
      return
        Left(
            DatabaseFailure(
                e.message)
        );
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<Failure, String>>
  removeWatchlist(
      TvSeriesDetail tvseries)
  async {
    try {
      final
      result
      = await localDataSource
          .removeWatchlistTvSeries(
          TvSeriesTable.fromEntity(
              tvseries)
      );
      return
        Right(result
        );
    } on DatabaseException catch (e) {
      return
        Left(
            DatabaseFailure(
                e.message)
        );
    }
  }

  @override
  Future<bool>
  isAddedToWatchlistTvSeries(
      int id)
  async {
    final
    result
    = await localDataSource
        .getMovieByIdTvSeries(
        id
    );
    return result != null;
  }

  @override
  Future<Either<Failure, List<TvSeries>>>
  getWatchlistTvSeries()
  async {
    final
    result
    = await localDataSource
        .getWatchlistTvSeries();
    return
      Right(
          result.map((data)
          => data.toEntity()).toList()
      );
  }

  @override
  Future<Either<Failure, String>>
  removeWatchlistTvSeries(
      TvSeriesDetail tvseries)
  async {
    try {
      final
      result
      = await localDataSource
          .removeWatchlistTvSeries(
          TvSeriesTable.fromEntity(
              tvseries)
      );
      return
        Right(
            result
        );
    } on DatabaseException catch (e) {
      return
        Left(
            DatabaseFailure(
                e.message)
        );
    }
  }
}