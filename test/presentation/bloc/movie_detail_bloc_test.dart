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
    '/movie_detail'
    '/movie_detail_bloc.dart';


//dummy and mock package
import '../'
    '../'
    'dummy_data'
    '/dummy_objects.dart';


import '../../helpers/test_helper.mocks.dart';


void main(
    ) {
  late
  MockGetMovieDetail
  mockGetMovieDetail;


  late
  MovieDetailBloc
  movieDetailBloc;


  const
  revId
  = 1;

  setUp((
      ) {
    mockGetMovieDetail
    = MockGetMovieDetail(
    );


    movieDetailBloc
    = MovieDetailBloc(
        getMovieDetail:
        mockGetMovieDetail
    );
  });



  test(
      "MovieDetailBloc must be initial state should be empty",
          (
          ) {
    expect(
        movieDetailBloc
            .state,
        MovieDetailEmpty(
        )
    );
  });



    blocTest<
        MovieDetailBloc,
        MovieDetailState>(
      'MovieDetailBloc must be emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(
            mockGetMovieDetail
                .execute(
                revId)
        )
            .thenAnswer((_)
        async
        => Right(
            testMovieDetail)
        );


        return
          movieDetailBloc;

      },
      act: (bloc)
      => bloc
          .add(
          const
          GetMovieDetailEvent(
              revId)
      ),

      expect: ()
      =>
      [
        MovieDetailLoading(),
        MovieDetailLoaded(
            testMovieDetail
        )
      ],
      verify: (
          bloc
          ) {
        verify(
            mockGetMovieDetail
                .execute(
                revId)
        );
      },
    );

    blocTest<
        MovieDetailBloc,
        MovieDetailState>(
      'MovieDetailBloc must be emit [Loading, Error] when get detail is unsuccessful',
      build: (
          ) {
        when(
            mockGetMovieDetail
                .execute(
                revId))
            .thenAnswer((_)
        async
        => Left(
            ServerFailure(
                'Server Failure')
        )
        );


        return
          movieDetailBloc;

      },
      act: (
          bloc)
      => bloc
          .add(
          const
          GetMovieDetailEvent(
              revId)
      ),

      expect: (
          ) =>
      [
        MovieDetailLoading(),
        const
        MovieDetailError(
            'Server Failure')
      ],

      verify: (
          bloc
          ) {
        verify(
            mockGetMovieDetail
                .execute(
                revId)
        );
      },
    );
}



