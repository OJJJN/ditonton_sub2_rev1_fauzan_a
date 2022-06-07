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
    '/usecases'
    '/get_watchlist_tvseries.dart';


import 'package:'
    'flutter'
    '/foundation.dart';



class WatchlistTvSeriesNotifier
    extends
    ChangeNotifier {

  var _watchlistTvSeries = <
      TvSeries>[];


  List<
      TvSeries> get watchlistTvSeries
  => _watchlistTvSeries;



  var _watchlistState =
      RequestState
          .Empty;


  RequestState
  get watchlistTvState =>
      _watchlistState;



  String
  _message =
      '';


  String
  get message
  => _message;



  WatchlistTvSeriesNotifier(
      {required this
          .getWatchlistTvSeries}
      );

  final
  GetWatchlistTvSeries
  getWatchlistTvSeries;



  Future<
      void> fetchWatchlistTvSeries()
  async {
    _watchlistState =
        RequestState
            .Loading;

    notifyListeners(
    );

    final
    result
    = await getWatchlistTvSeries
        .execute(
    );
    result.fold(
          (failure) {
        _watchlistState =
            RequestState
                .Error;


        _message = failure
            .message;


        notifyListeners(
        );
      },
          (tvSeriesData) {
        _watchlistState =
            RequestState
                .Loaded;


        _watchlistTvSeries
        = tvSeriesData;

        notifyListeners(
        );
      },
    );
  }
}
