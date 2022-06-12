//normal package
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
    'bloc_test'
    '/bloc_test.dart';



import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/commutils.dart';






//bloc package
import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/popular_movies'
    '/movie_popular_bloc.dart';

//dummy and mock package
import '../'
    '../'
    'dummy_data'
    '/dummy_objects.dart';


import '../../helpers/test_helper.mocks.dart';


void main(
    ) {
  late
  MockGetPopularMovies
  mockGetPopularMovies;


  late
  MoviePopularBloc
  moviePopularBloc;



  setUp((
      ) {
    mockGetPopularMovies
    = MockGetPopularMovies(
    );


    moviePopularBloc
    = MoviePopularBloc(
        mockGetPopularMovies
    );
  });





  test(
      "MoviePopularBloc must be initial state should be empty", (
      ) {
    expect(
        moviePopularBloc
            .state,
        MoviePopularEmpty()
    );
  });

    blocTest<
        MoviePopularBloc,
        MoviePopularState>(
        'MoviePopularBloc must be emit [loading, loaded] when data is loaded successfully',
        build: (
            ) {
          when(
              mockGetPopularMovies
                  .execute())
              .thenAnswer((_)
          async
          => Right(
              testMovieList)
          );


          return
            moviePopularBloc;

        },
        act: (
            bloc)
        => bloc
            .add(
            MoviePopularGetEvent()),
        expect: ()
        =>
        [
          MoviePopularLoading(),
          MoviePopularLoaded(
              testMovieList)
        ],

        verify: (
            bloc
            ) {
          verify(
              mockGetPopularMovies
                  .execute()
          );
        });


    blocTest<
        MoviePopularBloc,
        MoviePopularState>(
        'MoviePopularBloc must be emit [loading, error] when data is failed to loaded',
        build: (
            ) {
          when(
              mockGetPopularMovies
                  .execute()
          )
              .thenAnswer((_)
          async
          => Left(
              ServerFailure(
                  'Server Failure')
          )
          );


          return
            moviePopularBloc;
        },
        act: (
            bloc)
        => bloc
            .add(
            MoviePopularGetEvent()
        ),
        expect: ()
        =>
        [
          MoviePopularLoading(),
          MoviePopularError(
              'Server Failure')
        ],

        verify: (
            bloc
            ) {
          verify(
              mockGetPopularMovies
                  .execute(
          )
          );
        });
}
