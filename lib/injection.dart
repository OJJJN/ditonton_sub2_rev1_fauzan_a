
//normal package
import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/data'
    '/datasources'
    '/db'
    '/database_helper.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/data'
    '/datasources'
    '/db'
    '/database_helper_tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/data'
    '/datasources'
    '/movie_local_data_source.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/data'
    '/datasources'
    '/movie_remote_data_source.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/data'
    '/datasources'
    '/tvseries_local_data_source.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/data'
    '/datasources'
    '/tvseries_remote_data_source.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/data'
    '/repositories'
    '/movie_repository_impl.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/data'
    '/repositories'
    '/tvseries_repository_impl.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/repositories'
    '/movie_repository.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/repositories'
    '/tvseries_repository.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_movie_detail.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_movie_recommendations.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_now_playing_movies.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases/'
    'get_popular_movies.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_top_rated_movies.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_watchlist_movies.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_watchlist_status.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/remove_watchlist.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a/'
    'domain'
    '/usecases'
    '/save_watchlist.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/search_movies.dart';



import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_now_playing_tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_popular_tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_top_rated_tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_tvseries_detail.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_tvseries_recommendations.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_watchlist_tvseries_status.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_watchlist_tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/remove_tvseries_watchlist.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/save_tvseries_watchlist.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/search_tvseries.dart';




import 'package:'
    'http/http.dart' as http;


import 'package:'
    'get_it'
    '/get_it.dart';

//bloc package movies

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/movie_detail'
    '/movie_detail_bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/now_playing_movies'
    '/movie_now_playing_bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/popular_movies'
    '/movie_popular_bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/movie_recommendations'
    '/movie_recommendation_bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/search_movies'
    '/movie_search_bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/top_rated_movies'
    '/movie_top_rated_bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/movie_watchlist'
    '/movie_watchlist_bloc.dart';



//bloc package tvseries
import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/tvseries_detail'
    '/tvseries_detail_bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/on_the_air_tvseries'
    '/on_the_air_tvseries_bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/popular_tvseries'
    '/popular_tvseries_bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/tvseries_recommendations'
    '/tvseries_recommendations_bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/search_tvseries'
    '/tvseries_search_bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/top_rated_tvseries'
    '/top_rated_tvseries_bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/tvseries_watchlist'
    '/watchlist_tvseries_bloc.dart';




final
locator
= GetIt
    .instance;


//void init() {
  //provider
  //locator
  //.registerFactory(
  //() => MovieListNotifier(
  // getNowPlayingMovies:
  //locator(),
  //getPopularMovies:
      //locator(),
  //getTopRatedMovies:
  //locator(),
      //),
  //);
  //locator
      //.registerFactory(
      //() => TvSeriesListNotifier(
      //getNowPlayingTvSeries:
      //locator(),
  //getPopularTvSeries:
      //locator(),
  //getTopRatedTvSeries:
  //locator(),
  //),
      //);
  //locator
      //.registerFactory(
      //() => MovieDetailNotifier(
  //getMovieDetail:
      //locator(),
  //getMovieRecommendations:
      //locator(),
  //getWatchListStatus:
      //locator(),
  //saveWatchlist:
      //locator(),
  //removeWatchlist:
  //locator(),
  //),
  //);
  //locator
  //.registerFactory(
  //() => TvSeriesDetailNotifier(
  //getTvSeriesDetail:
  //locator(),
  //getTvSeriesRecommendations:
      //locator(),
  //getWatchListTvSeriesStatus:
      //locator(),
      //saveWatchlistTvSeries:
      //locator(),
  //removeWatchlistTvSeries:
  //locator(),
  //),
  //);
  //locator
  //.registerFactory(
  //() => MovieSearchNotifier(
  //searchMovies:
  //locator(),
            //),
      //);
  //locator
  //.registerFactory(
    //() => TvSeriesSearchNotifier(
          //searchTvSeries:
      //locator(),
            //),
      //);
  //locator
  //.registerFactory(
  // ()
      //=> PopularMoviesNotifier(
      //locator(),
        // ),
      //);
  //locator
  //.registerFactory(
  //()
      // => PopularTvSeriesNotifier(
      //locator(),
        //),
      //);
  //locator
  //.registerFactory(
  //()
      //=> TopRatedMoviesNotifier(
      //getTopRatedMovies:
      //locator(),
        //),
      //);
  // locator
  //.registerFactory(
  //()
      //=> TopRatedTvSeriesNotifier(
      //getTopRatedTvSeries:
      //locator(),
        //),
      //);
  //locator
      //.registerFactory(
  //()
      //=> WatchlistMovieNotifier(
      //getWatchlistMovies:
  //locator(),
  //),
  //);
  //locator
      //.registerFactory(
      //() => WatchlistTvSeriesNotifier(
  //getWatchlistTvSeries:
  //locator(),
      //),
      // );

//migrate from provider into bloc
void init(
    )
async {
  locator
      .registerFactory(()
  => MovieDetailBloc(
    getMovieDetail:
    locator(),
  )
  );


  locator
      .registerFactory(
        ()
    => MovieNowPlayingBloc(
        locator()
    ),
  );


  locator
      .registerFactory(
        ()
    => MoviePopularBloc(
        locator()
    ),
  );


  locator
      .registerFactory(()
  => MovieRecommendationBloc(
    getMovieRecommendations:
    locator(

    ),
  )
  );


  locator
      .registerFactory(()
  => MovieSearchBloc(
    searchMovies:
    locator(

    ),
  )
  );


  locator
      .registerFactory(
        ()
    => MovieTopRatedBloc(
        locator()
    ),
  );


  locator
      .registerFactory(()
  => MovieWatchlistBloc(
    getWatchlistMovies:
    locator(
    ),
    getWatchListStatus:
    locator(
    ),
    saveWatchlist:
    locator(
    ),
    removeWatchlist:
    locator(
    ),
  )
  );



  locator
      .registerFactory(()
  => TvseriesDetailBloc(
     locator(
     ),
  )
  );



  locator
      .registerFactory(
        ()
    => OnTheAirTvseriesBloc(
        locator()
    ),
  );


  locator
      .registerFactory(
        ()
    => PopularTvseriesBloc(
        locator()
    ),
  );


  locator
      .registerFactory(
          ()
  => TvseriesRecommendationsBloc(
    locator(
    ),
  )
  );



  locator
      .registerFactory(()
  => TvseriesSearchBloc(
    locator(),
  ));
  locator.registerFactory(
        ()
    => TopRatedTvseriesBloc(
        locator()
    ),
  );


  locator
      .registerFactory(()
  => WatchlistTvseriesBloc(
    locator(
    ),
    locator(
    ),
    locator(
    ),
    locator(
    ),
  )
  );



  // use case
  locator
      .registerLazySingleton(()
  => GetNowPlayingMovies(
      locator()
  )
  );


  locator
      .registerLazySingleton(()
  => GetPopularMovies(
      locator()
  )
  );


  locator
      .registerLazySingleton(()
  => GetTopRatedMovies(
      locator()
  )
  );


  locator
      .registerLazySingleton(()
  => GetMovieDetail(
      locator()
  )
  );


  locator
      .registerLazySingleton(()
  => GetMovieRecommendations(
      locator()
  )
  );


  locator
      .registerLazySingleton(()
  => SearchMovies(
      locator()
  )
  );


  locator
      .registerLazySingleton(()
  => GetWatchListStatus(
      locator()
  )
  );


  locator
      .registerLazySingleton(()
  => SaveWatchlist(
      locator()
  )
  );


  locator
      .registerLazySingleton(() =>
      RemoveWatchlist(
          locator()
      )
  );


  locator
      .registerLazySingleton(() =>
      GetWatchlistMovies(
          locator()
      )
  );



  locator
      .registerLazySingleton(()
  => GetNowPlayingTvSeries(
      locator()
  )
  );


  locator
      .registerLazySingleton(()
  => GetPopularTvSeries(
      locator()
  )
  );


  locator
      .registerLazySingleton(()
  => GetTopRatedTvSeries(
      locator()
  )
  );


  locator
      .registerLazySingleton(()
  => GetTvSeriesDetail(
      locator()
  )
  );


  locator
      .registerLazySingleton(()
  => GetTvSeriesRecommendations(
      locator()
  )
  );


  locator
      .registerLazySingleton(()
  => SearchTvSeries(
      locator()
  )
  );


  locator
      .registerLazySingleton(()
  => GetWatchListStatusTvSeries(
      locator()
  )
  );


  locator
      .registerLazySingleton(()
  => SaveWatchlistTvSeries(
      locator()
  )
  );


  locator
      .registerLazySingleton(()
  => RemoveWatchlistTvSeries(
      locator()
  )
  );


  locator
      .registerLazySingleton(()
  => GetWatchlistTvSeries(
      locator()
  )
  );



  // repository
  locator
      .registerLazySingleton<
      MovieRepository>(
        () => MovieRepositoryImpl(
      remoteDataSource:
      locator(
      ),
      localDataSource:
      locator(
      ),
    ),
  );

  locator
      .registerLazySingleton<
      TvSeriesRepository>(
        () => TvSeriesRepositoryImpl(
      remoteDataSource:
      locator(
      ),
      localDataSource:
      locator(
      ),
    ),
  );

  // data sources
  locator
      .registerLazySingleton<
      MovieRemoteDataSource>(
          () => MovieRemoteDataSourceImpl(
              client:
              locator(

              )
          )
  );



  locator
      .registerLazySingleton<
      MovieLocalDataSource>(
          () => MovieLocalDataSourceImpl(
              databaseHelper:
              locator()
          )
  );





  locator
      .registerLazySingleton<
      TvSeriesRemoteDataSource>(
          () => TvSeriesRemoteDataSourceImpl(
              client:
              locator()
          )
  );




  locator.
  registerLazySingleton<
      TvSeriesLocalDataSource>(
          () => TvSeriesLocalDataSourceImpl(
              databaseHelper:
              locator()
          )
  );



  // helper
  locator.
  registerLazySingleton<DatabaseHelper>(()
  => DatabaseHelper(
  )
  );


  locator.
  registerLazySingleton<DatabaseHelperTvSeries>(()
  => DatabaseHelperTvSeries(
  )
  );



  // external
  locator.
  registerLazySingleton(()
  => http.Client()
  );

}
