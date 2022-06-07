import 'package:'
    'dartz/dartz.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_popular_tvseries.dart';


import 'package:'
    'flutter_test'
    '/flutter_test.dart';


import 'package:'
    'mockito'
    '/mockito.dart';



import '../../helpers/test_helper_tvseries.mocks.dart';

void main() {
  late
  GetPopularTvSeries
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
        GetPopularTvSeries(
            mockTvSeriesRepository
        );
  });

  final
  tTv =
  <TvSeries>[
  ];

  group(
      'Get Popular Tv Tests', () {
    group(
        'execute', () {
      test(
          'should get list of tv_series from the repository when execute function is called',
              () async {
            // arrange
            when(
                mockTvSeriesRepository
                    .getPopularTvSeries())
                .thenAnswer((_)
            async => Right(
                tTv)
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
                    tTv)
            );
          });
    });
  });
}
