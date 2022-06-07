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
    '/get_now_playing_tvseries.dart';


import 'package:'
    'flutter_test'
    '/flutter_test.dart';


import 'package:'
    'mockito'
    '/mockito.dart';



import '../../helpers/test_helper_tvseries.mocks.dart';

void main() {
  late
  GetNowPlayingTvSeries
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
        GetNowPlayingTvSeries(
            mockTvRepository
        );
  });

  final
  tTv
  = <TvSeries>[
  ];

  test(
      'should get list of tv_series from the repository', ()
  async {
    // arrange
    when(
        mockTvRepository
            .getNowPlayingTvSeries())
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
}
