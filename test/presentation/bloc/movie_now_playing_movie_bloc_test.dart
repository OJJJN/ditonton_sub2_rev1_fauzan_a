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
    '/now_playing_movies'
    '/movie_now_playing_bloc.dart';


//dummy and mock package
import '../'
    '../'
    'dummy_data'
    '/dummy_objects.dart';



import '../../helpers/test_helper.mocks.dart';


void main(
    ) {
  late
  MockGetNowPlayingMovies
  mockGetNowPlayingMovies;


  late
  MovieNowPlayingBloc
  movieNowPlayingBloc;



  setUp((
      ) {
    mockGetNowPlayingMovies
    = MockGetNowPlayingMovies(
    );


    movieNowPlayingBloc
    = MovieNowPlayingBloc(
        mockGetNowPlayingMovies
    );
  });







  test(
      "MovieNowPlayingBloc must be initial state should be empty", (
      ) {
    expect(
        movieNowPlayingBloc
            .state,
        MovieNowPlayingEmpty()
    );
  });

    blocTest<
        MovieNowPlayingBloc,
        MovieNowPlayingState>(
      'MovieNowPlayingBloc must be emit [Loading, Loaded] when data is gotten successfully',
      build: (
          ) {
        when(
            mockGetNowPlayingMovies
                .execute())
            .thenAnswer((_)
        async
        => Right(
            testMovieList)
        );


        return
          movieNowPlayingBloc;


      },
      act:
          (
          bloc)
      => bloc
          .add(
          MovieNowPlayingGetEvent()
      ),
      expect: ()
      => [
        MovieNowPlayingLoading(),
        MovieNowPlayingLoaded(
            testMovieList)
      ],

      verify: (
          bloc
          ) {
        verify(
            mockGetNowPlayingMovies
                .execute()
        );
      },
    );



    blocTest<
        MovieNowPlayingBloc,
        MovieNowPlayingState>(

      'MovieNowPlayingBloc must be emit [Loading, Error] when get now playing is unsuccessful',
      build: (
          ) {
        when(
            mockGetNowPlayingMovies
                .execute())
            .thenAnswer((_)
        async =>
            Left(
                ServerFailure(
                    'Server Failure')
            )
        );


        return
          movieNowPlayingBloc;
      },
      act: (
          bloc)
      => bloc
          .add(
          MovieNowPlayingGetEvent()
      ),
      expect: ()
      => [
        MovieNowPlayingLoading(
        ),
        const
        MovieNowPlayingError(
            'Server Failure')
      ],
      verify: (
          bloc) {
        verify(
            mockGetNowPlayingMovies
                .execute()
        );
      },
    );
}