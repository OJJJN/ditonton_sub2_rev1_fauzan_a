
//normal package
import 'package:'
    'bloc_test'
    '/bloc_test.dart';


import 'package:'
    'dartz'
    '/dartz.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/commutils.dart';



import 'package:'
    'flutter_test'
    '/flutter_test.dart';


import 'package:'
    'mockito'
    '/mockito.dart';




//bloc package
import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/tvseries_detail'
    '/tvseries_detail_bloc.dart';


//dummy data and mock package
import '../'
    '../'
    'dummy_data'
    '/dummy_objects_tvseries.dart';


import '../../helpers/test_helper_tvseries.mocks.dart';


void main(
    ) {
  late
  MockGetTvSeriesDetail
  mockGetTvSeriesDetail;


  late
  TvseriesDetailBloc
  tvseriesDetailBloc;


  setUp((
      ) {
    mockGetTvSeriesDetail
    = MockGetTvSeriesDetail(
    );


    tvseriesDetailBloc
    = TvseriesDetailBloc(
        mockGetTvSeriesDetail
    );
  });



  const
  revtvseriesId
  = 1;

  test(
      "TvseriesDetailBloc must be initial state should be empty", (
      ) {
    expect(
        tvseriesDetailBloc
            .state,
        TvseriesDetailEmpty()
    );
  });



    blocTest<
        TvseriesDetailBloc,
        TvseriesDetailState>(
      'TvseriesDetailBloc must be emit [Loading, Loaded] when data is gotten successfully',
      build: (
          ) {
        when(
            mockGetTvSeriesDetail
                .execute(
                revtvseriesId)
        )
            .thenAnswer((_)
        async
        => Right(
            testTvSeriesDetail)
        );


        return
          tvseriesDetailBloc;


      },
      act: (
          bloc)
      => bloc
          .add(
          const
          TvseriesDetailGetEvent(
              revtvseriesId)
      ),

      expect: ()
      => [
        TvseriesDetailLoading(),
        TvseriesDetailLoaded(
            testTvSeriesDetail
        )
      ],
      verify: (
          bloc
          ) {
        verify(
            mockGetTvSeriesDetail
                .execute(
                revtvseriesId)
        );
      },
    );



    blocTest<
        TvseriesDetailBloc,
        TvseriesDetailState>(
      'TvseriesDetailBloc must be emit [Loading, Error] when get detail is unsuccessful',
      build: (
          ) {

        when(
            mockGetTvSeriesDetail
                .execute(
                revtvseriesId)
        )
            .thenAnswer((_)
        async
        =>
            Left(
                ServerFailure(
                    'Server Failure')
            )
        );


        return
          tvseriesDetailBloc;


      },
      act: (
          bloc)
      => bloc
          .add(
          const
          TvseriesDetailGetEvent(
              revtvseriesId)
      ),

      expect: ()
      => [
        TvseriesDetailLoading(),
        const
        TvseriesDetailError(
            'Server Failure')
      ],

      verify: (
          bloc
          ) {
        verify(
            mockGetTvSeriesDetail
                .execute(
                revtvseriesId)
        );
      },
    );
}