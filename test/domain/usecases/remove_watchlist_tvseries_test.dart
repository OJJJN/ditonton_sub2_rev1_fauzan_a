import 'package:'
    'dartz'
    '/dartz.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/remove_tvseries_watchlist.dart';


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
  RemoveWatchlistTvSeries
  usecase
  ;


  late
  MockTvSeriesRepository
  mockTvSeriesRepository
  ;



  setUp(() {
    mockTvSeriesRepository =
        MockTvSeriesRepository(
        );
    usecase =
        RemoveWatchlistTvSeries(
            mockTvSeriesRepository
        );
  });

  test(
      'should remove watchlist tv_series from repository', ()
  async {
    // arrange
    when(
        mockTvSeriesRepository
            .removeWatchlistTvSeries(
            testTvSeriesDetail))
        .thenAnswer((_)
    async =>
        Right(
            'Removed from watchlist')
    );
    // act
    final
    result
    = await usecase
        .execute(
        testTvSeriesDetail
    );
    // assert
    verify(
        mockTvSeriesRepository
            .removeWatchlistTvSeries(
            testTvSeriesDetail)
    );


    expect(
        result,
        Right(
            'Removed from watchlist')
    );
  });
}
