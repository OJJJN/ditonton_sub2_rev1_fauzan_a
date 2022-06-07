
import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_watchlist_tvseries_status.dart';


import 'package:'
    'flutter_test'
    '/flutter_test.dart';


import 'package:'
    'mockito'
    '/mockito.dart';



import '../../helpers/test_helper_tvseries.mocks.dart';

void main() {
  late
  GetWatchListStatusTvSeries
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
        GetWatchListStatusTvSeries(
            mockTvSeriesRepository
        );
  });

  test(
      'should get watchlist tv_series status from repository', ()
  async {
    // arrange
    when(
        mockTvSeriesRepository
            .isAddedToWatchlistTvSeries(
            1))
        .thenAnswer((_)
    async =>
    true
    );
    // act
    final
    result
    = await usecase
        .execute(
        1
    );
    // assert
    expect(
        result,
        true
    );
  });
}
