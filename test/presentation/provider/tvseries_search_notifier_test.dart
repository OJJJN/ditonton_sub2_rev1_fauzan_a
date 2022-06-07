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
    '/search_tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/tvseries_search_notifier.dart';


import 'package:'
    'flutter_test'
    '/flutter_test.dart';


import 'package:'
    'mockito'
    '/annotations.dart';


import 'package:'
    'mockito'
    '/mockito.dart';



import 'tvseries_search_notifier_test.mocks.dart';


@GenerateMocks(
    [
      SearchTvSeries
    ]
)

void main() {
  late
  TvSeriesSearchNotifier
  provider
  ;


  late
  MockSearchTvSeries
  mockSearchTvSeries
  ;


  late
  int
  listenerCallCount
  ;



  setUp(() {
    listenerCallCount = 0;
    mockSearchTvSeries =
        MockSearchTvSeries(
        );
    provider =
    TvSeriesSearchNotifier(
        searchTvSeries: mockSearchTvSeries)
      ..addListener(() {
        listenerCallCount += 1;
      });
  });



  final
  tTvModel
  = TvSeries(
    backdropPath: '/mUkuc2wyV9dHLG0D0Loaw5pO2s8.jpg',
    genreIds: const [10765, 10759, 18],
    id: 1399,
    originalName: 'Game of Thrones',
    overview:
    "Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.",
    popularity: 29.780826,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    firstAirDate: '2011-04-17',
    name: 'Game of Thrones',
    voteAverage: 7.91,
    voteCount: 1172,
  );



  final
  tTvList
  = <TvSeries>[
    tTvModel
  ];


  const tQuery = 'game of thrones';

  group(
      'search tv', () {
    test(
        'should change state to loading when usecase is called', ()
    async {
      // arrange
      when(
          mockSearchTvSeries
              .execute(
              tQuery))
          .thenAnswer((_)
      async =>
          Right(
              tTvList)
      );
      // act
      provider
          .fetchTvSeriesSearch(
          tQuery
      );
      // assert
      expect(
          provider
              .state,
          RequestState
              .Loading
      );
    });

    test(
        'should change search result data when data is gotten successfully',
            () async {
          // arrange
          when(
              mockSearchTvSeries
                  .execute(tQuery))
              .thenAnswer((_)
          async =>
              Right(
                  tTvList)
          );
          // act
          await provider
              .fetchTvSeriesSearch(
              tQuery
          );
          // assert
          expect(
              provider
                  .state,
              RequestState
                  .Loaded
          );


          expect(
              provider
                  .searchResult,
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
          mockSearchTvSeries
              .execute(tQuery))
          .thenAnswer((_)
      async =>
          Left(
              ServerFailure(
                  'Server Failure')
          )
      );
      // act
      await provider
          .fetchTvSeriesSearch(
          tQuery
      );
      // assert
      expect(
          provider
              .state,
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