//normal package

import 'package:'
    'bloc_test'
    '/bloc_test.dart';


import 'package:'
    'dartz'
    '/dartz.dart';


import 'package'
    ':ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/commutils.dart';




import 'package:flutter_test'
    '/flutter_test.dart';

import 'package:'
    'mockito'
    '/mockito.dart';



import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/top_rated_movies'
    '/movie_top_rated_bloc.dart';



//dummy and mock package
import '../'
    '../'
    'dummy_data'
    '/dummy_objects.dart';

import '../../helpers/test_helper.mocks.dart';


void main(
    ) {
  late
  MockGetTopRatedMovies
  mockGetTopRatedMovies;


  late
  MovieTopRatedBloc
  movieTopRatedBloc;



  setUp((
      ) {
    mockGetTopRatedMovies
    = MockGetTopRatedMovies(
    );


    movieTopRatedBloc
    = MovieTopRatedBloc(
        mockGetTopRatedMovies
    );
  });







  test(
      "MovieTopRatedBloc must be initial state should be empty", (
      ) {
    expect(
        movieTopRatedBloc
            .state,
        MovieTopRatedEmpty()
    );
  });

    blocTest<
        MovieTopRatedBloc,
        MovieTopRatedState>(
      'MovieTopRatedBloc must be emit [Loading, Loaded] when data is gotten successfully',
      build: (
          ) {
        when(
            mockGetTopRatedMovies
                .execute())
            .thenAnswer((_)
        async
        =>
            Right(
                testMovieList)
        );


        return
          movieTopRatedBloc;


      },
      act: (
          bloc)
      => bloc
          .add(
          MovieTopRatedGetEvent()
      ),

      expect: ()
      => [
        MovieTopRatedLoading(),
        MovieTopRatedLoaded(
            testMovieList
        )
      ],
      verify: (
          bloc
          ) {
        verify(
            mockGetTopRatedMovies
                .execute()
        );
      },
    );



    blocTest<
        MovieTopRatedBloc,
        MovieTopRatedState>(
      'MovieTopRatedBloc must be emit [Loading, Error] when get top rated is unsuccessful',
      build: (
          ) {
        when(
            mockGetTopRatedMovies
                .execute())
            .thenAnswer((_)
        async =>
            Left(
                ServerFailure(
                    'Server Failure')
            )
        );


        return
          movieTopRatedBloc;


      },
      act: (
          bloc)
      => bloc
          .add(
          MovieTopRatedGetEvent()
      ),


      expect: ()
      =>
      [
        MovieTopRatedLoading(),
        MovieTopRatedError(
            'Server Failure')
      ],

      verify: (
          bloc
          ) {

        verify(
            mockGetTopRatedMovies
                .execute()
        );
      },
    );
}