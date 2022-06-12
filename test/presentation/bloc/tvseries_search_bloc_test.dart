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
    '/search_tvseries'
    '/tvseries_search_bloc.dart';


//dummy data and mock package
import '../'
    '../'
    'dummy_data'
    '/dummy_objects_tvseries.dart';


import '../../helpers/test_helper_tvseries.mocks.dart';


void main(
    ) {
  late
  MockSearchTvSeries
  mockSearchTvSeries;


  late
  TvseriesSearchBloc
  tvseriesSearchBloc;



  setUp((
      ) {
    mockSearchTvSeries
    = MockSearchTvSeries(
    );


    tvseriesSearchBloc
    = TvseriesSearchBloc(
      mockSearchTvSeries
    );
  });



  const
  query
  = "originalTitle";




  test(
      "TvseriesSearchBloc must be initial state should be empty", (
      ) {
    expect(
        tvseriesSearchBloc
            .state,
        TvseriesSearchEmpty(
        )
    );
  });



  blocTest<
      TvseriesSearchBloc,
      TvseriesSearchState>(
    'TvseriesSearchBloc must be emit [Loading, Loaded] when data is gotten successfully',
    build: (
        ) {
      when(
          mockSearchTvSeries
              .execute(
              query)
      )
          .thenAnswer((_)
      async
      => Right(
          testTvSeriesList)
      );


      return
        tvseriesSearchBloc;


    },
    act: (
        bloc)
    => bloc
        .add(
        const
        TvseriesSearchQueryEvent(
            query)
    ),
    expect: ()
    => [
      TvseriesSearchLoading(),
      TvseriesSearchLoaded(
          testTvSeriesList
      )
    ],

    verify: (
        bloc
        ) {
      verify(
          mockSearchTvSeries
              .execute(
              query)
      );
    },
  );



    blocTest<
        TvseriesSearchBloc,
        TvseriesSearchState>(
      'TvseriesSearchBloc must be [Loading, Error] when get search is unsuccessful',
      build: (
          ) {
        when(
            mockSearchTvSeries
                .execute(
                query)
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
          tvseriesSearchBloc;
      },

      act: (
          bloc)
      => bloc
          .add(
          const
          TvseriesSearchQueryEvent(
              query)
      ),
      expect: ()
      =>
      [
        TvseriesSearchLoading(),
        const
        TvseriesSearchError(
            'Server Failure')
      ],


      verify: (
          bloc
          ) {
        verify(
            mockSearchTvSeries
                .execute(
                query)
        );
      },
    );
}