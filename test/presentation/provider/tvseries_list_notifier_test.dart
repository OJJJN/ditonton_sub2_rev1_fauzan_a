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
    'ditonton_sub2_rev1_fauzan_a/'
    'domain'
    '/entities'
    '/tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_now_playing_tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_popular_tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_top_rated_tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/tvseries_list_notifier.dart';


import 'package:'
    'flutter_test'
    '/flutter_test.dart';


import 'package:'
    'mockito'
    '/annotations.dart';


import 'package:'
    'mockito'
    '/mockito.dart';



import 'tvseries_list_notifier_test.mocks.dart';

@GenerateMocks(
    [
      GetNowPlayingTvSeries,
      GetPopularTvSeries,
      GetTopRatedTvSeries
    ]
)


void main() {
  late
  TvSeriesListNotifier
  provider
  ;


  late
  MockGetNowPlayingTvSeries
  mockGetNowPlayingTvSeries
  ;


  late
  MockGetPopularTvSeries
  mockGetPopularTvSeries
  ;


  late
  MockGetTopRatedTvSeries
  mockGetTopRatedTvSeries
  ;


  late
  int
  listenerCallCount
  ;



  setUp(() {
    listenerCallCount = 0;
    mockGetNowPlayingTvSeries =
        MockGetNowPlayingTvSeries(
        );
    mockGetPopularTvSeries =
        MockGetPopularTvSeries(
        );
    mockGetTopRatedTvSeries =
        MockGetTopRatedTvSeries(
        );
    provider
    = TvSeriesListNotifier(
      getNowPlayingTvSeries: mockGetNowPlayingTvSeries,
      getPopularTvSeries: mockGetPopularTvSeries,
      getTopRatedTvSeries: mockGetTopRatedTvSeries,
    )..addListener(() {
      listenerCallCount += 1;
    });
  });



  final
  tTv
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
  tTvList
  = <TvSeries>[
    tTv
  ];

  group(
      'now playing tv', () {
    test(
        'initialState should be Empty', () {
      expect(
          provider
              .nowPlayingState,
          equals(
              RequestState
                  .Empty)
      );
    });

    test(
        'should get data from the usecase', ()
    async {
      // arrange
      when(
          mockGetNowPlayingTvSeries
              .execute())
          .thenAnswer((_)
      async => Right(
          tTvList)
      );
      // act
      provider
          .fetchNowPlayingTvSeries(
      );
      // assert
      verify(
          mockGetNowPlayingTvSeries
              .execute()
      );
    });

    test(
        'should change state to Loading when usecase is called', () {
      // arrange
      when(
          mockGetNowPlayingTvSeries
              .execute())
          .thenAnswer((_)
      async =>
          Right(
              tTvList)
      );
      // act
      provider
          .fetchNowPlayingTvSeries(
      );
      // assert
      expect(
          provider
              .nowPlayingState,
          RequestState
              .Loading
      );
    });

    test(
        'should change tv when data is gotten successfully', ()
    async {
      // arrange
      when(
          mockGetNowPlayingTvSeries
              .execute())
          .thenAnswer((_)
      async =>
          Right(
              tTvList)
      );
      // act
      await
      provider
          .fetchNowPlayingTvSeries(
      );
      // assert
      expect(
          provider
              .nowPlayingState,
          RequestState
              .Loaded
      );


      expect(
          provider
              .nowPlayingTvSeries,
          tTvList
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
          mockGetNowPlayingTvSeries
              .execute())
          .thenAnswer((_)
      async =>
          Left(
              ServerFailure(
                  'Server Failure')
          )
      );
      // act
      await provider
          .fetchNowPlayingTvSeries(
      );
      // assert
      expect(
          provider
              .nowPlayingState,
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

  group(
      'popular tv', () {
    test(
        'should change state to loading when usecase is called', ()
    async {
      // arrange
      when(
          mockGetPopularTvSeries
              .execute())
          .thenAnswer((_)
      async => Right(
          tTvList)
      );
      // act
      provider
          .fetchPopularTvSeries(
      );
      // assert
      expect(
          provider
              .popularTvSeriesState,
          RequestState
              .Loading
      );
      // verify(provider.setState(RequestState.Loading));
    });

    test(
        'should change tv data when data is gotten successfully',
            () async {
          // arrange
          when(
              mockGetPopularTvSeries
                  .execute())
              .thenAnswer((_)
          async => Right(
              tTvList)
          );
          // act
          await provider
              .fetchPopularTvSeries(
          );
          // assert
          expect(
              provider
                  .popularTvSeriesState,
              RequestState
                  .Loaded
          );


          expect(
              provider
                  .popularTvSeries,
              tTvList
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
          mockGetPopularTvSeries
              .execute())
          .thenAnswer((_)
      async =>
          Left(
              ServerFailure(
                  'Server Failure')
          )
      );
      // act
      await provider
          .fetchPopularTvSeries(
      );
      // assert
      expect(
          provider
              .popularTvSeriesState,
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

  group(
      'top rated tv', () {
    test(
        'should change state to loading when usecase is called', ()
    async {
      // arrange
      when(
          mockGetTopRatedTvSeries
              .execute())
          .thenAnswer((_)
      async =>
          Right(
              tTvList)
      );
      // act
      provider
          .fetchTopRatedTvSeries(
      );
      // assert
      expect(
          provider
              .topRatedTvSeriesState,
          RequestState
              .Loading
      );
    });

    test(
        'should change tv data when data is gotten successfully',
            () async {
          // arrange
          when(
              mockGetTopRatedTvSeries
                  .execute())
              .thenAnswer((_)
          async =>
              Right(
                  tTvList)
          );
          // act
          await provider
              .fetchTopRatedTvSeries(
          );
          // assert
          expect(
              provider
                  .topRatedTvSeriesState,
              RequestState
                  .Loaded
          );


          expect(
              provider
                  .topRatedTvSeries,
              tTvList
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
          mockGetTopRatedTvSeries
              .execute())
          .thenAnswer((_)
      async =>
          Left(
              ServerFailure(
                  'Server Failure')
          )
      );
      // act
      await provider
          .fetchTopRatedTvSeries(
      );
      // assert
      expect(
          provider
              .topRatedTvSeriesState,
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