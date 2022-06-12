
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


import 'package'
    ':mockito'
    '/mockito.dart';


//bloc package

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/search_movies'
    '/movie_search_bloc.dart';

//dummy and mock package
import '../'
    '../'
    'dummy_data'
    '/dummy_objects.dart';



import '../../helpers/test_helper.mocks.dart';


void main(
    ) {
  late
  MockSearchMovies
  mockSearchMovies;


  late
  MovieSearchBloc
  movieSearchBloc;



  setUp((
      ) {
    mockSearchMovies
    = MockSearchMovies(
    );


    movieSearchBloc
    = MovieSearchBloc(
      searchMovies:
      mockSearchMovies,
    );
  });

  const
  query
  = "originalTitle";






  test(
      "MovieSearchBloc must be initial state should be empty", (
      ) {
    expect(
        movieSearchBloc
            .state,
        MovieSearchEmpty()
    );
  });


  blocTest<
      MovieSearchBloc,
      MovieSearchState>(
    'MovieSearchBloc must be emit [Loading, Loaded] when data is gotten successfully',
    build: (
        ) {
      when(
          mockSearchMovies
              .execute(
              query)
      )
          .thenAnswer((_)
      async
      => Right(
          testMovieList)
      );


      return
        movieSearchBloc;


    },

    act: (
        bloc)
    => bloc
        .add(
        const
        MovieSearchQueryEvent(
            query)
    ),


    expect: ()
    => [
      MovieSearchLoading(),
      MovieSearchLoaded(
          testMovieList)
    ],

    verify: (
        bloc) {
      verify(
          mockSearchMovies
              .execute(
              query)
      );
    },
  );




    blocTest<
        MovieSearchBloc,
        MovieSearchState>(
      'MovieSearchBloc must be emit [Loading, Error] when get search is unsuccessful',
      build: (
          ) {
        when(
            mockSearchMovies
                .execute(
                query))

            .thenAnswer((_)
        async =>
            Left(
                ServerFailure(
                    'Server Failure')
            )
        );


        return
          movieSearchBloc;
      },
      act: (
          bloc)
      => bloc
          .add(
          const
          MovieSearchQueryEvent(
              query)
      ),

      expect: ()
      =>
      [
        MovieSearchLoading(),
        const
        MovieSearchError(
            'Server Failure')
      ],


      verify: (
          bloc
          ) {
        verify(
            mockSearchMovies
                .execute(
                query)
        );
      },
    );
}