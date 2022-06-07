import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/data'
    '/models'
    '/tvseries_model.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/tvseries.dart';


import 'package:'
    'flutter_test'
    '/flutter_test.dart';



void main() {
  final
  tTvModel
  = TvSeriesModel(
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    id: 1,
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
  );



  final
  tTv
  = TvSeries(
    backdropPath: 'backdropPath',
    genreIds: const [1, 2, 3],
    id: 1,
    originalName: 'originalName',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    firstAirDate: 'firstAirDate',
    name: 'name',
    voteAverage: 1,
    voteCount: 1,
  );

  test(
      'should be a subclass of Tv entity', ()
  async {
    final
    result
    = tTvModel
        .toEntity(
    );

    expect(
        result,
        tTv
    );
  });
}
