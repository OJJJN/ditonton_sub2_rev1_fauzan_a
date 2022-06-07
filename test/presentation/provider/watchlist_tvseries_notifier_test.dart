import 'package:'
    'dartz'
    '/dartz.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/failure.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/state_enum.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_watchlist_tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/watchlist_tvseries_notifier.dart';


import 'package:'
    'flutter_test'
    '/flutter_test.dart';


import 'package:'
    'mockito'
    '/annotations.dart';


import 'package:'
    'mockito'
    '/mockito.dart';



import '../'
    '../'
    'dummy_data'
    '/dummy_objects_tvseries.dart';


import 'watchlist_tvseries_notifier_test.mocks.dart';

@GenerateMocks(
    [
      GetWatchlistTvSeries
    ]
)


void main() {
  late
  WatchlistTvSeriesNotifier
  provider
  ;


  late
  MockGetWatchlistTvSeries
  mockGetWatchlistTvSeries
  ;


  late
  int
  listenerCallCount
  ;



  setUp(() {
    listenerCallCount = 0;
    mockGetWatchlistTvSeries =
        MockGetWatchlistTvSeries(
        );
    provider =
    WatchlistTvSeriesNotifier(
      getWatchlistTvSeries: mockGetWatchlistTvSeries,
    )..addListener(() {
      listenerCallCount += 1;
    });
  });

  test(
      'should change tv data when data is gotten successfully', ()
  async {
    // arrange
    when(
        mockGetWatchlistTvSeries
            .execute())
        .thenAnswer((_)
    async =>
        Right([
          testWatchlistTvSeries
        ])
    );
    // act
    await provider
        .fetchWatchlistTvSeries(
    );
    // assert
    expect(
        provider
            .watchlistTvState,
        RequestState
            .Loaded
    );


    expect(
        provider
            .watchlistTvSeries,
        [
          testWatchlistTvSeries
        ]
    );


    expect(
        listenerCallCount,
        2
    );
  });

  test(
      'should return error when data is unsuccessful', ()
  async {
    // arrange
    when(
        mockGetWatchlistTvSeries
            .execute())
        .thenAnswer((_)
    async =>
        Left(
            DatabaseFailure(
                "Can't get data")
        )
    );
    // act
    await provider
        .fetchWatchlistTvSeries(
    );
    // assert
    expect(
        provider
            .watchlistTvState,
        RequestState
            .Error
    );


    expect(
        provider
            .message,
        "Can't get data"
    );


    expect(
        listenerCallCount,
        2
    );
  });
}