
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
    '/tvseries_watchlist'
    '/watchlist_tvseries_bloc.dart';


//dummy data and mock package
import '../'
    '../'
    'dummy_data'
    '/dummy_objects_tvseries.dart';


import '../../helpers/test_helper_tvseries.mocks.dart';


void main(
    ) {

  late
  MockGetWatchlistTvSeries
  mockGetWatchlistTvSeries;


  late
  MockGetWatchListStatusTvSeries
  mockGetWatchListStatusTvSeries;


  late
  MockSaveWatchlistTvSeries
  mockSaveWatchlistTvSeries;


  late
  MockRemoveWatchlistTvSeries
  mockRemoveWatchlistTvSeries;


  late
  WatchlistTvseriesBloc
  watchlistTvseriesBloc;



  setUp((
      ) {
    mockGetWatchlistTvSeries
    = MockGetWatchlistTvSeries(
    );


    mockGetWatchListStatusTvSeries
    = MockGetWatchListStatusTvSeries(
    );


    mockSaveWatchlistTvSeries
    = MockSaveWatchlistTvSeries(
    );


    mockRemoveWatchlistTvSeries
    = MockRemoveWatchlistTvSeries(
    );


    watchlistTvseriesBloc
    = WatchlistTvseriesBloc(
      mockGetWatchlistTvSeries,
      mockGetWatchListStatusTvSeries,
      mockSaveWatchlistTvSeries,
      mockRemoveWatchlistTvSeries
    );
  });



  const
  revtvseriesId
  = 1;

  test(
      "WatchlistTvseriesBloc must be initial state should be empty", (
      ) {
    expect(
        watchlistTvseriesBloc
            .state,
        WatchlistTvseriesEmpty()
    );
  });



  blocTest<
      WatchlistTvseriesBloc,
      WatchlistTvseriesState>(
    'WatchlistTvseriesBloc must be emit [Loading, Loaded] when data is gotten successfully',
    build: (
        ) {
      when(
          mockGetWatchlistTvSeries
              .execute())
          .thenAnswer((_)
      async
      =>
          Right(
              testWatchlistTvseriesList)
      );


      return
        watchlistTvseriesBloc;


    },
    act: (
        bloc)
    => bloc
        .add(
        WatchlistTvseriesGetEvent()
    ),
    expect: ()
    =>
    [
      WatchlistTvseriesLoading(),
      WatchlistTvseriesLoaded(
          testWatchlistTvseriesList)
    ],
    verify: (
        bloc) {
      verify(
          mockGetWatchlistTvSeries
              .execute()
      );
    },
  );

  blocTest<
      WatchlistTvseriesBloc,
      WatchlistTvseriesState>(
    'WatchlistTvseriesBloc must be emit [Loading, Error] when get watchlist is unsuccessful',
    build: (
        ) {
      when(
          mockGetWatchlistTvSeries
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
        watchlistTvseriesBloc;


    },
    act: (
        bloc)
    => bloc
        .add(
        WatchlistTvseriesGetEvent()
    ),
    expect: ()
    =>
    [
      WatchlistTvseriesLoading(),
      const
      WatchlistTvseriesError(
          "Can't get data"
      )
    ],


    verify: (
        bloc
        ) {
      verify(
          mockGetWatchlistTvSeries
              .execute()
      );
    },
  );



  blocTest<
      WatchlistTvseriesBloc,
      WatchlistTvseriesState>(
    'WatchlistTvseriesBloc must be emit [Loaded] when get status tv watchlist is successful',
    build: (
        ) {
      when(
          mockGetWatchListStatusTvSeries
              .execute(
              revtvseriesId)
      )
          .thenAnswer((_)
      async
      => true
      );


      return
        watchlistTvseriesBloc;


    },
    act: (
        bloc)
    => bloc
        .add(
        const
        WatchlistTvseriesGetStatusEvent(
            revtvseriesId)
    ),

    expect: ()
    => [
      const
      WatchlistTvseriesStatusLoaded(
          true
      )
    ],

    verify:
        (
        bloc
        ) {

      verify(
          mockGetWatchListStatusTvSeries
              .execute(
              revtvseriesId)
      );
    },
  );



  blocTest<
      WatchlistTvseriesBloc,
      WatchlistTvseriesState>(
    'WatchlistTvseriesBloc must be emit [success] when add tv item to watchlist is successful',
    build: (
        ) {
      when(
          mockSaveWatchlistTvSeries
              .execute(
              testTvSeriesDetail)
      )
          .thenAnswer((_)
      async
      =>
      const
      Right(
          "Success")
      );


      return
        watchlistTvseriesBloc;

    },
    act: (
        bloc)
    => bloc
        .add(
        WatchlistTvseriesTambahItemEvent(
            testTvSeriesDetail)
    ),
    expect: ()
    => [
      const
      WatchlistTvseriesSuccess(
          "Success")
    ],

    verify: (
        bloc
        ) {
      verify(
          mockSaveWatchlistTvSeries
              .execute(
              testTvSeriesDetail)
      );
    },
  );



  blocTest<
      WatchlistTvseriesBloc,
      WatchlistTvseriesState>(
    'WatchlistTvseriesBloc must be emit [success] when remove tv item to watchlist is successful',
    build: (
        ) {
      when(
          mockRemoveWatchlistTvSeries
              .execute(
              testTvSeriesDetail))
          .thenAnswer((_)
      async
      =>
      const
      Right(
          "Removed")
      );


      return
        watchlistTvseriesBloc;

    },
    act: (
        bloc)
    => bloc
        .add(
        WatchlistTvseriesHapusItemEvent(
            testTvSeriesDetail)
    ),
    expect: ()
    => [
      const
      WatchlistTvseriesSuccess(
          "Removed"
      )
    ],
    verify: (
        bloc
        ) {
      verify(
          mockRemoveWatchlistTvSeries
              .execute(
              testTvSeriesDetail)
      );
    },
  );



  blocTest<
      WatchlistTvseriesBloc,
      WatchlistTvseriesState>(
    'WatchlistTvseriesBloc must be emit [error] when add tv item to watchlist is unsuccessful',
    build: (
        ) {

      when(
          mockSaveWatchlistTvSeries
              .execute(
              testTvSeriesDetail)
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
        watchlistTvseriesBloc;

    },
    act: (
        bloc)
    => bloc
        .add(
        WatchlistTvseriesTambahItemEvent(
            testTvSeriesDetail)
    ),

    expect: ()
    => [
      const
      WatchlistTvseriesError(
          "Failed"
      )
    ],
    verify: (
        bloc
        ) {
      verify(
          mockSaveWatchlistTvSeries
              .execute(
              testTvSeriesDetail)
      );
    },
  );



  blocTest<
      WatchlistTvseriesBloc,
      WatchlistTvseriesState>(
    'WatchlistTvseriesBloc must be emit [error] when remove tv item to watchlist is unsuccessful',
    build: (
        ) {
      when(
          mockRemoveWatchlistTvSeries
              .execute(
              testTvSeriesDetail)
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
        watchlistTvseriesBloc;
    },
    act: (
        bloc)
    => bloc
        .add(
        WatchlistTvseriesHapusItemEvent(
            testTvSeriesDetail)
    ),
    expect: ()
    => [
      const
      WatchlistTvseriesError(
          "Failed"
      )
    ],
    verify:
        (
        bloc
        ) {
      verify(
          mockRemoveWatchlistTvSeries
              .execute(
              testTvSeriesDetail)
      );
    },
  );
}