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
    '/entities'
    '/tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_top_rated_tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/top_rated_tvseries_notifier.dart';


import 'package:'
    'flutter_test'
    '/flutter_test.dart';


import 'package:'
    'mockito'
    '/annotations.dart';


import 'package:'
    'mockito'
    '/mockito.dart';



import 'top_rated_tvseries_notifier_test.mocks.dart';

@GenerateMocks(
    [
      GetTopRatedTvSeries
    ]
)


void main() {
  late
  MockGetTopRatedTvSeries
  mockGetTopRatedTv
  ;


  late
  TopRatedTvSeriesNotifier
  notifier
  ;


  late
  int
  listenerCallCount
  ;



  setUp(() {
    listenerCallCount = 0;
    mockGetTopRatedTv =
        MockGetTopRatedTvSeries(
        );
    notifier =
    TopRatedTvSeriesNotifier(
        getTopRatedTvSeries:
        mockGetTopRatedTv)
      ..addListener(() {
        listenerCallCount++;
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
  tTvList =
  <TvSeries>[
    tTv
  ];

  test(
      'should change state to loading when usecase is called', ()
  async {
    // arrange
    when(
        mockGetTopRatedTv
            .execute())
        .thenAnswer((_)
    async => Right(
        tTvList)
    );
    // act
    notifier
        .fetchTopRatedTvSeries(
    );
    // assert
    expect(
        notifier.state,
        RequestState
            .Loading
    );


    expect(
        listenerCallCount,
        1
    );
  });

  test(
      'should change tv data when data is gotten successfully', ()
  async {
    // arrange
    when(
        mockGetTopRatedTv
            .execute())
        .thenAnswer((_)
    async => Right(
        tTvList)
    );
    // act
    await
    notifier.fetchTopRatedTvSeries(
    );
    // assert
    expect(
        notifier.state,
        RequestState
            .Loaded
    );


    expect(
        notifier.tvseries,
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
        mockGetTopRatedTv
            .execute())
        .thenAnswer((_)
    async => Left(
        ServerFailure(
            'Server Failure')
    )
    );
    // act
    await notifier
        .fetchTopRatedTvSeries(
    );
    // assert
    expect(
        notifier.state,
        RequestState
            .Error
    );


    expect(
        notifier.message,
        'Server Failure'
    );


    expect(
        listenerCallCount,
        2
    );
  });
}