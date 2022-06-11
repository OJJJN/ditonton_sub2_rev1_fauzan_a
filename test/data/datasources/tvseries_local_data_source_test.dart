import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common/'
    'commutils.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/data'
    '/datasources'
    '/tvseries_local_data_source.dart';


import 'package:'
    'flutter_test'
    '/flutter_test.dart';


import 'package:'
    'mockito'
    '/mockito.dart';



import '../'
    '../'
    'dummy_data'
    '/dummy_objects_tvseries.dart';


import '../../helpers/test_helper_tvseries.mocks.dart';


void main() {
  late
  TvSeriesLocalDataSourceImpl
  dataSourcetv
  ;


  late
  MockDatabaseHelperTvSeries
  mockDatabaseHelperTv
  ;




  setUp(() {
    mockDatabaseHelperTv =
        MockDatabaseHelperTvSeries(
        );


    dataSourcetv =
        TvSeriesLocalDataSourceImpl(
            databaseHelper: mockDatabaseHelperTv
        );
  });

  group(
      'save watchlist tv_series', () {
    test(
        'should return success message when insert to database is success',
            () async {
          // arrange
          when(
              mockDatabaseHelperTv
                  .insertWatchlistTvSeries(
                  testTvSeriesTable))
              .thenAnswer((_)
          async =>
          1
          );
          // act
          final
          result
          = await dataSourcetv
              .insertWatchlistTvSeries(
              testTvSeriesTable
          );
          // assert
          expect(
              result,
              'Added to Watchlist'
          );
        });

    test(
        'should throw DatabaseException when insert tv_series to database is failed',
            () async {
          // arrange
          when(
              mockDatabaseHelperTv
                  .insertWatchlistTvSeries(
                  testTvSeriesTable))
              .thenThrow(
              Exception()
          );
          // act
          final
          call
          = dataSourcetv
              .insertWatchlistTvSeries(
              testTvSeriesTable
          );
          // assert
          expect(()
          => call,
              throwsA(
                  isA<DatabaseException>())
          );
        });
  });

  group(
      'remove watchlist tv_series', () {

    test(
        'should throw DatabaseException when remove tv_series from database is failed',
            () async {
          // arrange
          when(
              mockDatabaseHelperTv
                  .removeWatchlistTvSeries(
                  testTvSeriesTable))
              .thenThrow(
              Exception()
          );
          // act
          final
          call
          = dataSourcetv
              .removeWatchlistTvSeries(
              testTvSeriesTable
          );
          // assert
          expect(()
          => call,
              throwsA(
                  isA<DatabaseException>())
          );
        });
  });

  group(
      'Get Tv Detail By Id', () {
    const tId = 1;

    test(
        'should return Tv Detail Table when data is found', ()
    async {
      // arrange
      when(
          mockDatabaseHelperTv
              .getTvSeriesById(
              tId))
          .thenAnswer((_)
      async => testTvSeriesMap
      );
      // act
      final
      result
      = await dataSourcetv
          .getMovieByIdTvSeries(
          tId
      );
      // assert
      expect(
          result,
          testTvSeriesTable
      );
    });

    test(
        'should return null when data is not found', ()
    async {
      // arrange
      when(
          mockDatabaseHelperTv
              .getTvSeriesById(tId))
          .thenAnswer((_)
      async => null
      );
      // act
      final
      result
      = await dataSourcetv
          .getMovieByIdTvSeries(
          tId
      );
      // assert
      expect(
          result,
          null
      );
    });
  });

  group(
      'get watchlist tv_series', () {
    test(
        'should return list of TvTable from database', ()
    async {
      // arrange
      when(
          mockDatabaseHelperTv
              .getWatchlistTvSeries())
          .thenAnswer((_)
      async => [
        testTvSeriesMap]
      );
      // act
      final
      result
      = await dataSourcetv
          .getWatchlistTvSeries(
      );
      // assert
      expect(
          result,
          [
            testTvSeriesTable
          ]
      );
    });
  });
}
