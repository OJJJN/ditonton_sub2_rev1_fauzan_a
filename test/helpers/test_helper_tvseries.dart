
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



@GenerateMocks(
    [
  TvSeriesRepository,
  TvSeriesRemoteDataSource,
  TvSeriesLocalDataSource,
  DatabaseHelperTvSeries,
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
