
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



import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/movie_watchlist'
    '/movie_watchlist_bloc.dart';



//dummy and mock package
import '../'
    '../'
    'dummy_data'
    '/dummy_objects.dart';



import '../../helpers/test_helper.mocks.dart';

void main(
    ) {
  late
  MockGetWatchlistMovies
  mockGetWatchlistMovies;


  late
  MockGetWatchListStatus
  mockGetWatchListStatus;


  late
  MockSaveWatchlist
  mockSaveWatchlist;


  late
  MockRemoveWatchlist
  mockRemoveWatchlist;


  late
  MovieWatchlistBloc
  movieWatchlistBloc;



  setUp((
      ) {
    mockGetWatchlistMovies
    = MockGetWatchlistMovies(
    );


    mockGetWatchListStatus
    = MockGetWatchListStatus(
    );


    mockSaveWatchlist
    = MockSaveWatchlist(
    );


    mockRemoveWatchlist
    = MockRemoveWatchlist(
    );


    movieWatchlistBloc
    = MovieWatchlistBloc(
      getWatchlistMovies:
      mockGetWatchlistMovies,
      getWatchListStatus:
      mockGetWatchListStatus,
      saveWatchlist:
      mockSaveWatchlist,
      removeWatchlist:
      mockRemoveWatchlist,
    );
  });



  const
  revId =
  1;

  test(
      "MovieWatchlistBloc must be initial state should be empty", (
      ) {
    expect(
        movieWatchlistBloc
            .state,
        MovieWatchlistEmpty()
    );
  });



  blocTest<
      MovieWatchlistBloc,
      MovieWatchlistState>(

    'MovieWatchlistBloc must be emit [Loading, Loaded] when data is gotten successfully',
    build: (
        ) {
      when(
          mockGetWatchlistMovies
              .execute()
      )
          .thenAnswer((_)
      async
      => Right(
          testWatchlistMovieList)
      );


      return
        movieWatchlistBloc;


    },
    act: (
        bloc)
    => bloc
        .add(
        GetListEvent()
    ),

    expect: (
        ) =>
    [
      MovieWatchlistLoading(),
      MovieWatchlistLoaded(
          testWatchlistMovieList)
    ],


    verify: (
        bloc
        ) {
      verify(
          mockGetWatchlistMovies
              .execute()
      );
    },
  );



  blocTest<
      MovieWatchlistBloc,
      MovieWatchlistState>(
    'MovieWatchlistBloc must be emit [Loading, Error] when get watchlist is unsuccessful',
    build: (
        ) {
      when(
          mockGetWatchlistMovies
              .execute()
      )
          .thenAnswer((_)
      async
      =>
          Left(
              ServerFailure(
                  "Can't get data")
          )
      );


      return
        movieWatchlistBloc;


    },
    act: (
        bloc)
    => bloc
        .add(
        GetListEvent()
    ),

    expect: (
        ) =>
    [
      MovieWatchlistLoading(),
      const
      MovieWatchlistError(
          "Can't get data")
    ],


    verify: (
        bloc
        ) {
      verify(
          mockGetWatchlistMovies
              .execute()
      );
    },
  );



  blocTest<
      MovieWatchlistBloc,
      MovieWatchlistState>(
    'MovieWatchlistBloc must emit [Loaded] when get status movie watchlist is successful',
    build: (
        ) {
      when(
          mockGetWatchListStatus
              .execute(
              revId)
      )
          .thenAnswer((_)
      async
      => true
      );


      return
        movieWatchlistBloc;

    },
    act: (
        bloc)
    => bloc
        .add(
        const
        GetStatusMovieEvent(
            revId)
    ),


    expect: ()
    => [
      const
      MovieWatchlistStatusLoaded(
          true
      )
    ],


    verify: (
        bloc
        ) {
      verify(
          mockGetWatchListStatus
              .execute(
              revId)
      );
    },
  );



  blocTest<
      MovieWatchlistBloc,
      MovieWatchlistState>(
    'MovieWatchlistBloc must be emit [success] when add movie item to watchlist is successful',
    build: (
        ) {
      when(
          mockSaveWatchlist
              .execute(
              testMovieDetail)
      )
          .thenAnswer((_)
      async =>
      const
      Right(
          "Success")
      );



      return
        movieWatchlistBloc;


    },
    act: (
        bloc)
    => bloc
        .add(
        AddItemMovieEvent(
            testMovieDetail)
    ),

    expect: ()
    => [
      const
      MovieWatchlistSuccess(
          "Success"
      )
    ],
    verify: (
        bloc
        ) {
      verify(
          mockSaveWatchlist
              .execute(
              testMovieDetail)
      );
    },
  );



  blocTest<
      MovieWatchlistBloc,
      MovieWatchlistState>(
    'MovieWatchlistBloc must be emit [success] when remove movie item to watchlist is successful',
    build: (
        ) {
      when(
          mockRemoveWatchlist
              .execute(
              testMovieDetail)
      )
          .thenAnswer((_)
      async
      => const
      Right(
          "Removed")
      );


      return
        movieWatchlistBloc;
    },

    act: (
        bloc)
    => bloc
        .add(
        RemoveItemMovieEvent(
            testMovieDetail)
    ),


    expect: ()
    => [
      const
      MovieWatchlistSuccess(
          "Removed"
      )
    ],


    verify: (
        bloc
        ) {
      verify(
          mockRemoveWatchlist
              .execute(
              testMovieDetail)
      );
    },
  );



  blocTest<
      MovieWatchlistBloc,
      MovieWatchlistState>(
    'MovieWatchlistBloc must be emit [error] when add movie item to watchlist is unsuccessful',
    build: (
        ) {
      when(
          mockSaveWatchlist
              .execute(
              testMovieDetail)
      )
          .thenAnswer((_)
      async
      =>
          Left(
              DatabaseFailure(
                  'Failed')
          )
      );


      return
        movieWatchlistBloc;


    },
    act: (
        bloc)
    => bloc
        .add(
        AddItemMovieEvent(
            testMovieDetail)
    ),

    expect: ()
    => [
      const MovieWatchlistError(
          "Failed"
      )
    ],


    verify: (
        bloc
        ) {
      verify(
          mockSaveWatchlist
              .execute(
              testMovieDetail)
      );
    },
  );



  blocTest<
      MovieWatchlistBloc,
      MovieWatchlistState>(
    'MovieWatchlistBloc must be emit [error] when remove movie item to watchlist is unsuccessful',
    build: (
        ) {
      when(
          mockRemoveWatchlist
              .execute(
              testMovieDetail)
      )
          .thenAnswer((_)
      async =>
          Left(
              DatabaseFailure(
                  'Failed')
          )
      );


      return
        movieWatchlistBloc;


    },
    act: (
        bloc)
    => bloc
        .add(
        RemoveItemMovieEvent(
            testMovieDetail)
    ),

    expect: ()
    => [
      const
      MovieWatchlistError(
          "Failed"
      )
    ],

    verify: (
        bloc
        ) {
      verify(
          mockRemoveWatchlist
              .execute(
              testMovieDetail)
      );
    },
  );
}