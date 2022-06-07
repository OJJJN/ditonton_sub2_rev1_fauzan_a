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
    '/get_popular_tvseries.dart';


import 'package:'
    'flutter'
    '/foundation.dart';



class PopularTvSeriesNotifier
    extends
    ChangeNotifier {

  final
  GetPopularTvSeries
  getPopularTvSeries;



  PopularTvSeriesNotifier(
      this
          .getPopularTvSeries
      );

  RequestState _state = RequestState
      .Empty;

  RequestState get state
  => _state;



  List<
      TvSeries> _tvseries = [
  ];


  List<
      TvSeries> get tvseries
  => _tvseries;



  String _message = '';


  String
  get message => _message;



  Future<void> fetchPopularTvSeries()
  async {
    _state = RequestState
        .Loading;
    notifyListeners(
    );

    final
    result
    = await getPopularTvSeries
        .execute(
    );

    result.fold(
          (
          failure) {
        _message = failure
            .message;


        _state = RequestState
            .Error;

        notifyListeners(
        );
      },
          (tvSeriesData) {
        _tvseries =
            tvSeriesData;


        _state =
            RequestState
                .Loaded;

        notifyListeners(
        );
      },
    );
  }
}
