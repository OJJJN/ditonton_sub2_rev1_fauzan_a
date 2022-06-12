
//normal package
import 'package:'
    'bloc_test'
    '/bloc_test.dart';


import 'package:'
    'dartz'
    '/dartz.dart';

import 'package:'
    'flutter_test'
    '/flutter_test.dart';


import 'package:'
    'mockito'
    '/mockito.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/commutils.dart';



//bloc package
import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/top_rated_tvseries'
    '/top_rated_tvseries_bloc.dart';




//dummy and mock package
import '../'
    '../'
    'dummy_data'
    '/dummy_objects_tvseries.dart';


import '../../helpers/test_helper_tvseries.mocks.dart';


void main(
    ) {
  late
  MockGetTopRatedTvSeries
  mockGetTopRatedTvSeries;


  late
  TopRatedTvseriesBloc
  topRatedTvseriesBloc;


  setUp((
      ) {
    mockGetTopRatedTvSeries
    = MockGetTopRatedTvSeries(
    );


    topRatedTvseriesBloc
    = TopRatedTvseriesBloc(
        mockGetTopRatedTvSeries
    );
  });





  test(
      "TopRatedTvseriesBloc must be initial state should be empty", (
      ) {
    expect(
        topRatedTvseriesBloc
            .state,
        TopRatedTvseriesEmpty()
    );
  });


    blocTest<
        TopRatedTvseriesBloc,
        TopRatedTvseriesState>(
      'TopRatedTvseriesBloc must be emit [Loading, Loaded] when data is gotten successfully',
      build: (
          ) {
        when(
            mockGetTopRatedTvSeries
                .execute())
            .thenAnswer((_)
        async
        => Right(
            testTvSeriesList)
        );


        return
          topRatedTvseriesBloc;

      },
      act: (
          bloc)
      => bloc
          .add(
          TopRatedTvseriesGetEvent()
      ),
      expect: ()
      => [
        TopRatedTvseriesLoading(),
        TopRatedTvseriesLoaded(
            testTvSeriesList
        )
      ],

      verify: (
          bloc
          ) {
        verify(
            mockGetTopRatedTvSeries
                .execute()
        );
      },
    );

    blocTest<
        TopRatedTvseriesBloc,
        TopRatedTvseriesState>(
      'TopRatedTvseriesBloc must be emit [Loading, Error] when get top rated is unsuccessful',
      build: (
          ) {
        when(
            mockGetTopRatedTvSeries
                .execute()
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
          topRatedTvseriesBloc;

      },
      act: (
          bloc)
      => bloc
          .add(
          TopRatedTvseriesGetEvent()
      ),

      expect: ()
      =>
      [
        TopRatedTvseriesLoading(),
        const
        TopRatedTvseriesError(
            'Server Failure'
        )
      ],
      verify: (
          bloc
          ) {
        verify(
            mockGetTopRatedTvSeries
                .execute()
        );
      },
    );
}