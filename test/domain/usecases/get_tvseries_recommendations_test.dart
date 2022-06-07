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
    '/get_tvseries_recommendations.dart';


import 'package:'
    'flutter_test'
    '/flutter_test.dart';


import 'package:'
    'mockito'
    '/mockito.dart';



import '../../helpers/test_helper_tvseries.mocks.dart';

void main() {
  late
  GetTvSeriesRecommendations
  usecase
  ;


  late
  MockTvSeriesRepository
  mockTvRepository
  ;


  setUp(() {
    mockTvRepository =
        MockTvSeriesRepository(
        );
    usecase =
        GetTvSeriesRecommendations(
            mockTvRepository
        );
  });

  final
  tId =
  1;


  final
  tTv
  = <TvSeries>[
  ];

  test(
      'should get list of tv_series recommendations from the repository',
          () async {
        // arrange
        when(
            mockTvRepository
                .getTvSeriesRecommendations(
                tId))
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
            tId
        );
        // assert
        expect(
            result,
            Right(
                tTv)
        );
      });
}
