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
    '/domain'
    '/usecases'
    '/search_tvseries.dart';


import 'package:'
    'flutter_test'
    '/flutter_test.dart';


import 'package:'
    'mockito'
    '/mockito.dart';



import '../../helpers/test_helper_tvseries.mocks.dart';

void main() {
  late
  SearchTvSeries
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
        SearchTvSeries(
            mockTvSeriesRepository
        );
  });

  final
  tTv =
  <TvSeries>[
  ];

  final
  tQuery
  = 'Game of throne'
  ;

  test(
      'should get list of tv_series from the repository', ()
  async {
    // arrange
    when(
        mockTvSeriesRepository
            .searchTvSeries(
            tQuery))
        .thenAnswer((_)
    async =>
        Right(
            tTv)
    );
    // act
    final
    result
    = await usecase
        .execute(
        tQuery
    );
    // assert
    expect(
        result,
        Right(
            tTv)
    );
  });
}
