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
    '/usecases'
    '/get_watchlist_tvseries_status.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/remove_tvseries_watchlist.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/save_tvseries_watchlist.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_tvseries_detail.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_tvseries_recommendations.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/tvseries_detail_notifier.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/state_enum.dart';


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


import 'tvseries_detail_notifier_test.mocks.dart';


@GenerateMocks(
    [
  GetTvSeriesDetail,
  GetTvSeriesRecommendations,
  GetWatchListStatusTvSeries,
  SaveWatchlistTvSeries,
  RemoveWatchlistTvSeries,
]
)
void main() {
  late
  TvSeriesDetailNotifier
  provider
  ;


  late
  MockGetTvSeriesDetail
  mockGetTvSeriesDetail
  ;


  late
  MockGetTvSeriesRecommendations
  mockGetTvSeriesRecommendations
  ;


  late
  MockGetWatchListStatusTvSeries
  mockGetWatchlistStatusTvSeries
  ;


  late
  MockSaveWatchlistTvSeries
  mockSaveWatchlistTvSeries
  ;


  late
  MockRemoveWatchlistTvSeries
  mockRemoveWatchlistTvSeries
  ;


  late
  int
  listenerCallCount
  ;



  setUp(() {
    listenerCallCount = 0;
    mockGetTvSeriesDetail =
        MockGetTvSeriesDetail(
        );
    mockGetTvSeriesRecommendations =
        MockGetTvSeriesRecommendations(
        );
    mockGetWatchlistStatusTvSeries =
        MockGetWatchListStatusTvSeries(
        );
    mockSaveWatchlistTvSeries =
        MockSaveWatchlistTvSeries(
        );
    mockRemoveWatchlistTvSeries =
        MockRemoveWatchlistTvSeries(
        );
    provider = TvSeriesDetailNotifier(
      getTvSeriesDetail: mockGetTvSeriesDetail,
      getTvSeriesRecommendations: mockGetTvSeriesRecommendations,
      getWatchListTvSeriesStatus: mockGetWatchlistStatusTvSeries,
      saveWatchlistTvSeries: mockSaveWatchlistTvSeries,
      removeWatchlistTvSeries: mockRemoveWatchlistTvSeries,
    )..addListener(() {
      listenerCallCount += 1;
    });
  });

  const tId = 1;

  final
  tTvS
  = TvSeries(
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    id: 1,
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
  );


  final
  tTvSeries
  = <TvSeries>[
    tTvS
  ];

  void _arrangeUsecase() {
    when(
        mockGetTvSeriesDetail
            .execute(
            tId)
    )
        .thenAnswer((_)
    async => Right(
        testTvSeriesDetail)
    );


    when(
        mockGetTvSeriesRecommendations
            .execute(
            tId))
        .thenAnswer((_)
    async => Right(
        tTvSeries)
    );
  }

  group(
      'Get Movie Detail', () {
    test(
        'should get data from the usecase', ()
    async {
      // arrange
      _arrangeUsecase();
      // act
      await provider
          .fetchTvSeriesDetail(
          tId
      );
      // assert
      verify(
          mockGetTvSeriesDetail
              .execute(
              tId)
      );


      verify(
          mockGetTvSeriesRecommendations
              .execute(
              tId)
      );
    });

    test(
        'should change state to Loading when usecase is called', () {
      // arrange
      _arrangeUsecase();
      // act
      provider
          .fetchTvSeriesDetail(
          tId
      );
      // assert
      expect(
          provider.tvSeriesState,
          RequestState
              .Loading
      );


      expect(
          listenerCallCount,
          1
      );
    });

    test(
        'should change movie when data is gotten successfully', ()
    async {
      // arrange
      _arrangeUsecase();
      // act
      await provider
          .fetchTvSeriesDetail(
          tId
      );
      // assert
      expect(
          provider.tvSeriesState,
          RequestState
              .Loaded
      );


      expect(
          provider.tvseries,
          testTvSeriesDetail
      );


      expect(
          listenerCallCount,
          3
      );

    });

    test(
        'should change recommendation movies when data is gotten successfully',
            () async {
          // arrange
          _arrangeUsecase();
          // act
          await provider
              .fetchTvSeriesDetail(
              tId
          );
          // assert
          expect(
              provider.tvSeriesState,
              RequestState
                  .Loaded
          );


          expect(
              provider.tvSeriesRecommendations,
              tTvSeries
          );

        });
  });

  group(
      'Get Movie Recommendations', () {
    test(
        'should get data from the usecase', ()
    async {
      // arrange
      _arrangeUsecase();
      // act
      await provider
          .fetchTvSeriesDetail(
          tId
      );
      // assert
      verify(
          mockGetTvSeriesRecommendations
              .execute(
              tId)
      );


      expect(
          provider.tvSeriesRecommendations,
          tTvSeries
      );
    });

    test(
        'should update recommendation state when data is gotten successfully',
            () async {
          // arrange
          _arrangeUsecase();
          // act
          await provider
              .fetchTvSeriesDetail(
              tId
          );
          // assert
          expect(
              provider.recommendationState,
              RequestState
                  .Loaded
          );


          expect(
              provider
                  .tvSeriesRecommendations,
              tTvSeries
          );
        });

    test(
        'should update error message when request in successful', ()
    async {
      // arrange
      when(
          mockGetTvSeriesDetail
              .execute(
              tId))
          .thenAnswer((_)
      async => Right(
          testTvSeriesDetail)
      );


      when(
          mockGetTvSeriesRecommendations
              .execute(
              tId))
          .thenAnswer((_)
      async => Left(
          ServerFailure(
              'Failed')
      )
      );
      // act
      await provider
          .fetchTvSeriesDetail(
          tId
      );
      // assert
      expect(
          provider
              .recommendationState,
          RequestState
              .Error
      );


      expect(
          provider
              .message,
          'Failed'
      );
    });
  });

  group(
      'Watchlist', () {
    test(
        'should get the watchlist status', ()
    async {
      // arrange
      when(
          mockGetWatchlistStatusTvSeries
              .execute(1)).thenAnswer((_)
      async => true
      );
      // act
      await provider
          .loadWatchlistTvSeriesStatus(
          1
      );
      // assert
      expect(
          provider
              .isAddedToWatchlist,
          true
      );
    });

    test(
        'should execute save watchlist when function called', ()
    async {
      // arrange
      when(
          mockSaveWatchlistTvSeries
              .execute(
              testTvSeriesDetail))
          .thenAnswer((_)
      async => const
      Right(
          'Success')
      );


      when(
          mockGetWatchlistStatusTvSeries
              .execute(
              testTvSeriesDetail.id))
          .thenAnswer((_)
      async => true
      );

      // act
      await provider
          .addWatchlistTvSeries(
          testTvSeriesDetail
      );
      // assert
      verify(
          mockSaveWatchlistTvSeries
              .execute(
              testTvSeriesDetail)
      );

    });

    test(
        'should execute remove watchlist when function called', ()
    async {
      // arrange
      when(
          mockRemoveWatchlistTvSeries
              .execute(
              testTvSeriesDetail))
          .thenAnswer((_)
      async => const
      Right(
          'Removed')
      );


      when(
          mockGetWatchlistStatusTvSeries
              .execute(
              testTvSeriesDetail
                  .id))
          .thenAnswer((_)
      async =>
      false
      );

      // act
      await provider
          .removeFromWatchlistTvSeries(
          testTvSeriesDetail
      );

      // assert
      verify(
          mockRemoveWatchlistTvSeries
              .execute(
              testTvSeriesDetail)
      );
    });

    test(
        'should update watchlist status when add watchlist success', ()
    async {
      // arrange
      when(
          mockSaveWatchlistTvSeries
              .execute(
              testTvSeriesDetail))
          .thenAnswer((_)
      async => const
      Right(
          'Added to Watchlist')
      );


      when(
          mockGetWatchlistStatusTvSeries
              .execute(
              testTvSeriesDetail.id))
          .thenAnswer((_)
      async => true
      );
      // act
      await provider
          .addWatchlistTvSeries(
          testTvSeriesDetail
      );
      // assert
      verify(
          mockGetWatchlistStatusTvSeries
              .execute(
              testTvSeriesDetail.id)
      );


      expect(
          provider
              .isAddedToWatchlist,
          true
      );


      expect(
          provider
              .watchlistMessage,
          'Added to Watchlist'
      );


      expect(
          listenerCallCount,
          1
      );

    });

    test(
        'should update watchlist message when add watchlist failed', ()
    async {
      // arrange
      when(
          mockSaveWatchlistTvSeries
              .execute(
              testTvSeriesDetail))
          .thenAnswer((_)
      async =>
          Left(
              DatabaseFailure(
                  'Failed')
          )
      );


      when(
          mockGetWatchlistStatusTvSeries
              .execute(testTvSeriesDetail
              .id))
          .thenAnswer((_)
      async => false
      );
      // act
      await provider
          .addWatchlistTvSeries(
          testTvSeriesDetail
      );
      // assert


      expect(
          provider
              .watchlistMessage,
          'Failed'
      );


      expect(
          listenerCallCount,
          1
      );
    });
  });

  group(
      'on Error', () {
    test(
        'should return error when data is unsuccessful', ()
    async {
      // arrange
      when(
          mockGetTvSeriesDetail
              .execute(
              tId))
          .thenAnswer((_)
      async => Left
        (ServerFailure(
          'Server Failure')
      ));


      when(
          mockGetTvSeriesRecommendations
              .execute(
              tId))
          .thenAnswer((_)
      async =>
          Right(
              tTvSeries)
      );
      // act


      await provider
          .fetchTvSeriesDetail(
          tId
      );
      // assert


      expect(
          provider
              .tvSeriesState,
          RequestState
              .Error
      );


      expect(
          provider
              .message,
          'Server Failure'
      );


      expect(
          listenerCallCount,
          2
      );
    });
  });
}
