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
    '/popular_tvseries'
    '/popular_tvseries_bloc.dart';


//dummy and mock package
import '../'
    '../'
    'dummy_data'
    '/dummy_objects_tvseries.dart';


import '../../helpers/test_helper_tvseries.mocks.dart';


void main(
    ) {
  late
  MockGetPopularTvSeries
  mockGetPopularTvSeries;


  late
  PopularTvseriesBloc
  popularTvseriesBloc;



  setUp((
      ) {
    mockGetPopularTvSeries
    = MockGetPopularTvSeries(
    );


    popularTvseriesBloc
    = PopularTvseriesBloc(
        mockGetPopularTvSeries
    );
  });



  test(
      "PopularTvseriesBloc must be initial state should be empty", (
      ) {
    expect(
        popularTvseriesBloc
            .state,
        PopularTvseriesEmpty()
    );
  });



    blocTest<
        PopularTvseriesBloc,
        PopularTvseriesState>(
      'PopularTvseriesBloc must be emit [Loading, Loaded] when data is gotten successfully',
      build: (
          ) {
        when(
            mockGetPopularTvSeries
                .execute())
            .thenAnswer((_)
        async
        => Right(
            testTvSeriesList)
        );


        return
          popularTvseriesBloc;


      },
      act: (
          bloc)
      => bloc
          .add(
          PopularTvseriesGetEvent()
      ),
      expect: ()
      => [
        PopularTvseriesLoading(),
        PopularTvseriesLoaded(
            testTvSeriesList
        )
      ],
      verify: (
          bloc
          ) {
        verify(
            mockGetPopularTvSeries
                .execute()
        );
      },
    );



    blocTest<
        PopularTvseriesBloc,
        PopularTvseriesState>(
      'PopularTvseriesBloc must be emit [Loading, Error] when get popular is unsuccessful',
      build: (
          ) {
        when(
            mockGetPopularTvSeries
                .execute())
            .thenAnswer((_)
        async
        =>
            Left(
                ServerFailure(
                    'Server Failure')
            )
        );


        return
          popularTvseriesBloc;


      },
      act: (
          bloc)
      => bloc
          .add(
          PopularTvseriesGetEvent()
      ),
      expect: ()
      => [
        PopularTvseriesLoading(),
        PopularTvseriesError(
            'Server Failure'
        )
      ],

      verify: (
          bloc
          ) {
        verify(
            mockGetPopularTvSeries
                .execute()
        );
      },
    );
}