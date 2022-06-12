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
    '/on_the_air_tvseries'
    '/on_the_air_tvseries_bloc.dart';


//dummy and mock package

import '../../dummy_data/dummy_objects_tvseries.dart';


import '../../helpers/test_helper_tvseries.mocks.dart';


void main(
    ) {
  late
  MockGetNowPlayingTvSeries
  mockGetNowPlayingTvSeries;


  late
  OnTheAirTvseriesBloc
  onTheAirTvseriesBloc;



  setUp((
      ) {
    mockGetNowPlayingTvSeries
    = MockGetNowPlayingTvSeries(
    );


    onTheAirTvseriesBloc
    = OnTheAirTvseriesBloc(
        mockGetNowPlayingTvSeries
    );
  });





  test(
      "OnTheAirTvseriesBloc must be initial state should be empty", (
      ) {
    expect(
        onTheAirTvseriesBloc
            .state,
        OnTheAirTvseriesEmpty()
    );
  });



    blocTest<
        OnTheAirTvseriesBloc,
        OnTheAirTvseriesState>(
      'OnTheAirTvseriesBloc must be emit [Loading, Loaded] when data is gotten successfully',
      build: (
          ) {
        when(
            mockGetNowPlayingTvSeries
                .execute())
            .thenAnswer((_)
        async
        => Right(
            testTvSeriesList)
        );


        return
          onTheAirTvseriesBloc;


      },
      act: (
          bloc)
      => bloc
          .add(
          OnTheAirTvseriesGetEvent()
      ),

      expect: ()
      => [
        OnTheAirTvseriesLoading(),
        OnTheAirTvseriesLoaded(
            testTvSeriesList
        )
      ],

      verify: (
          bloc
          ) {
        verify(
            mockGetNowPlayingTvSeries
                .execute()
        );
      },
    );



    blocTest<
        OnTheAirTvseriesBloc,
        OnTheAirTvseriesState>(
      'OnTheAirTvseriesBloc must be emit [Loading, Error] when get now playing is unsuccessful',
      build: (
          ) {
        when(
            mockGetNowPlayingTvSeries
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
          onTheAirTvseriesBloc;


      },
      act: (
          bloc)
      => bloc
          .add(
          OnTheAirTvseriesGetEvent()
      ),
      expect: (
          ) => [
        OnTheAirTvseriesLoading(
        ),
        const
        OnTheAirTvseriesError(
            'Server Failure'
        )
      ],
      verify: (
          bloc
          ) {
        verify(
            mockGetNowPlayingTvSeries
                .execute()
        );
      },
    );
}