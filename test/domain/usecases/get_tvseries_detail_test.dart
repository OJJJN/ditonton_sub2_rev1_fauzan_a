import 'package:'
    'dartz'
    '/dartz.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_tvseries_detail.dart';


import 'package:'
    'flutter_test'
    '/flutter_test.dart';


import 'package:'
    'mockito'
    '/mockito.dart';



import '../'
    '../'
    'dummy_data'
    '/dummy_objects_tvseries.dart';


import '../../helpers/test_helper_tvseries.mocks.dart';

void main() {
  late
  GetTvSeriesDetail
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
        GetTvSeriesDetail(
            mockTvSeriesRepository
        );
  });

  const tId = 1;

  test(
      'should get tv_series detail from the repository', ()
  async {
    // arrange
    when(
        mockTvSeriesRepository
            .getTvSeriesDetail(
            tId))
        .thenAnswer((_)
    async => Right(
        testTvSeriesDetail)
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
            testTvSeriesDetail)
    );
  });
}
