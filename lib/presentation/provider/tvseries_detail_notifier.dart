import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/state_enum.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/tvseries_detail.dart';


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
    '/remove_tvseries_watchlist.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/save_tvseries_watchlist.dart';


import 'package:'
    'flutter'
    '/foundation.dart';


import 'package:'
    'flutter'
    '/material.dart';




class TvSeriesDetailNotifier
    extends
    ChangeNotifier {

  static const
  watchlistAddSuccessMessage =
      'Added to Watchlist';


  static const
  watchlistRemoveSuccessMessage =
      'Removed from Watchlist';

  final
  GetTvSeriesDetail
  getTvSeriesDetail;


  final
  GetTvSeriesRecommendations
  getTvSeriesRecommendations;


  final
  GetWatchListStatusTvSeries
  getWatchListTvSeriesStatus;


  final
  SaveWatchlistTvSeries
  saveWatchlistTvSeries;


  final
  RemoveWatchlistTvSeries
  removeWatchlistTvSeries;



  TvSeriesDetailNotifier({
    required this
        .getTvSeriesDetail,
    required this
        .getTvSeriesRecommendations,
    required this
        .getWatchListTvSeriesStatus,
    required this
        .saveWatchlistTvSeries,
    required this
        .removeWatchlistTvSeries,
  });

  late
  TvSeriesDetail
  _tv;


  TvSeriesDetail
  get tvseries
  => _tv;


  RequestState _tvSeriesState =
      RequestState
          .Empty;


  RequestState get tvSeriesState
  => _tvSeriesState;



  List<
      TvSeries>
  _tvSeriesRecommendations = [
  ];


  List<
      TvSeries> get tvSeriesRecommendations
  => _tvSeriesRecommendations;


  RequestState
  _recommendationState =
      RequestState
          .Empty;


  RequestState
  get recommendationState
  => _recommendationState;



  String _message = '';


  String get message => _message;



  bool
  _isAddedtoWatchlist
  = false;


  bool
  get isAddedToWatchlist
  => _isAddedtoWatchlist;



  Future<
      void> fetchTvSeriesDetail(
      int id)
  async {
    _tvSeriesState = RequestState
        .Loading;


    notifyListeners();
    final
    detailResult
    = await getTvSeriesDetail
        .execute(
        id);


    final
    recommendationResult
    = await getTvSeriesRecommendations
        .execute(
        id
    );


    detailResult.fold(
          (failure) {
        _tvSeriesState = RequestState
            .Error;


        _message = failure
            .message;


        notifyListeners(
        );
      },
          (tvseries) {
        _recommendationState =
            RequestState.Loading;


        _tv =
            tvseries;


        notifyListeners(
        );


        recommendationResult.fold(
              (failure) {
            _recommendationState =
                RequestState.Error;


            _message =
                failure
                    .message;

          },
              (tvseries) {
            _recommendationState
            = RequestState
                .Loaded;


            _tvSeriesRecommendations =
                tvseries;
          },
        );
        _tvSeriesState
        = RequestState
            .Loaded;


        notifyListeners(
        );
      },
    );
  }

  String
  _watchlistMessage = '';


  String
  get watchlistMessage
  => _watchlistMessage;



  Future<
      void> addWatchlistTvSeries(
      TvSeriesDetail tvseries)
  async {
    final
    result
    = await saveWatchlistTvSeries
        .execute(
        tvseries
    );

    await result
        .fold(
          (failure)
      async {
        _watchlistMessage = failure
            .message;
      },
          (successMessage)
      async {
        _watchlistMessage
        = successMessage;
      },
    );

    await loadWatchlistTvSeriesStatus(
        tvseries
            .id
    );
  }

  Future<void> removeFromWatchlistTvSeries(
      TvSeriesDetail tvseries)
  async {
    final
    result
    = await removeWatchlistTvSeries
        .execute(
        tvseries
    );



    await result
        .fold(
          (failure)
      async {
        _watchlistMessage = failure
            .message;

      },
          (successMessage)
      async {
        _watchlistMessage
        = successMessage;

      },
    );

    await loadWatchlistTvSeriesStatus(
        tvseries.
        id
    );
  }

  Future<
      void> loadWatchlistTvSeriesStatus(
      int id)
  async {
    final
    result
    = await getWatchListTvSeriesStatus
        .execute(
        id);


    _isAddedtoWatchlist
    = result;

    notifyListeners(
    );
  }
}
