
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
    '/tvseries_local_data_source.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/data'
    '/datasources'
    '/tvseries_remote_data_source.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/repositories'
    '/tvseries_repository.dart';


import 'package:'
    'mockito'
    '/annotations.dart';


import 'package:'
    'http'
    '/http.dart' as http;


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
    '/search_tvseries.dart';



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



//bloc package
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
    '/top_rated_tvseries'
    '/top_rated_tvseries_bloc.dart';


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
    '/tvseries_watchlist'
    '/watchlist_tvseries_bloc.dart';


@GenerateMocks(
    [
  TvSeriesRepository,
  TvSeriesRemoteDataSource,
  TvSeriesLocalDataSource,
  DatabaseHelperTvSeries,
      OnTheAirTvseriesBloc,
      GetNowPlayingTvSeries,
      GetPopularTvSeries,
      PopularTvseriesBloc,
      GetTopRatedTvSeries,
      TopRatedTvseriesBloc,
      GetTvSeriesDetail,
      TvseriesDetailBloc,
      TvseriesRecommendationsBloc,
      GetTvSeriesRecommendations,
      TvseriesSearchBloc,
      SearchTvSeries,
      WatchlistTvseriesBloc,
      GetWatchlistTvSeries,
      GetWatchListStatusTvSeries,
      RemoveWatchlistTvSeries,
      SaveWatchlistTvSeries
], customMocks: [
  MockSpec<
      http
          .Client>(
      as: #MockHttpClient
  )
]
)
void main(
    ) {}
