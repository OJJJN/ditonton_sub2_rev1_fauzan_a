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
    '/movie_local_data_source.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/data'
    '/datasources'
    '/movie_remote_data_source.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/repositories'
    '/movie_repository.dart';


import 'package:'
    'mockito'
    '/annotations.dart';


import 'package:'
    'http'
    '/http.dart' as http;



@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<http
      .Client>(
      as: #MockHttpClient)
])
void main(
    ) {}
