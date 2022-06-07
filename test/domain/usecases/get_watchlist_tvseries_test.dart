import 'package:'
    'dartz'
    '/dartz.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_watchlist_tvseries.dart';


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
  GetWatchlistTvSeries
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
        GetWatchlistTvSeries(
            mockTvSeriesRepository
        );
  });

  test(
      'should get list of tv_series from the repository', ()
  async {
    // arrange
    when(
        mockTvSeriesRepository
            .getWatchlistTvSeries())
        .thenAnswer((_)
    async => Right(
        testTvSeriesList)
    );
    // act
    final
    result
    = await usecase
        .execute(
    );
    // assert
    expect(
        result,
        Right(
            testTvSeriesList)
    );
  });
}
