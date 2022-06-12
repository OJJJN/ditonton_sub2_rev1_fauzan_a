
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
    '/tvseries_recommendations'
    '/tvseries_recommendations_bloc.dart';



//dummy data and mock package
import '../'
    '../'
    'dummy_data'
    '/dummy_objects_tvseries.dart';


import '../../helpers/test_helper_tvseries.mocks.dart';

void main(
    ) {
  late
  MockGetTvSeriesRecommendations
  mockGetTvSeriesRecommendations;


  late
  TvseriesRecommendationsBloc
  tvseriesRecommendationsBloc;



  setUp((
      ) {
    mockGetTvSeriesRecommendations
    = MockGetTvSeriesRecommendations(
    );


    tvseriesRecommendationsBloc
    = TvseriesRecommendationsBloc(
      mockGetTvSeriesRecommendations
    );

  });

  test(
      "TvseriesRecommendationsBloc must be initial state should be empty", () {
    expect(
        tvseriesRecommendationsBloc
            .state,
        TvseriesRecommendationsEmpty()
    );
  });



  const
  revtvseriesId
  = 1;




  blocTest<
      TvseriesRecommendationsBloc,
      TvseriesRecommendationsState>(
    'TvseriesRecommendationsBloc must be emit [Loading, Loaded] when data is gotten successfully',
    build: (
        ) {
      when(
          mockGetTvSeriesRecommendations
              .execute(
              revtvseriesId)
      )
          .thenAnswer((_)
      async
      => Right(
          testTvSeriesList)
      );


      return
        tvseriesRecommendationsBloc;


    },
    act: (
        bloc)
    => bloc
        .add(
        const
        TvseriesRecommendationsGetEvent(
            revtvseriesId)
    ),


    expect: ()
    =>
    [
      TvseriesRecommendationsLoading(
      ),
      TvseriesRecommendationsLoaded(
          testTvSeriesList
      )
    ],
    verify: (
        bloc
        ) {
      verify(
          mockGetTvSeriesRecommendations
              .execute(
              revtvseriesId)
      );
    },
  );




    blocTest<
        TvseriesRecommendationsBloc,
        TvseriesRecommendationsState>(
      'TvseriesRecommendationsBloc must be emit [Loading, Error] when get recommendation is unsuccessful',
      build: (
          ) {
        when(
            mockGetTvSeriesRecommendations
                .execute(
                revtvseriesId))
            .thenAnswer((_)
        async
        =>
            Left(
                ServerFailure(
                    'Server Failure')
            )
        );


        return
          tvseriesRecommendationsBloc;

      },
      act: (
          bloc)
      => bloc
          .add(
          const
          TvseriesRecommendationsGetEvent(
              revtvseriesId)
      ),
      expect: ()
      => [
        TvseriesRecommendationsLoading(
        ),
        const
        TvseriesRecommendationsError(
            'Server Failure'
        )
      ],
      verify: (
          bloc
          ) {
        verify(
            mockGetTvSeriesRecommendations
                .execute(
                revtvseriesId)
        );
      },
    );
}