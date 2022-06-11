part of 'watchlist_tvseries_bloc.dart';


abstract
class
WatchlistTvseriesState
    extends
    Equatable {

  const
  WatchlistTvseriesState(
      );



  @override
  List<
      Object>
  get props
  => [
  ];
}



class
WatchlistTvseriesEmpty
    extends
    WatchlistTvseriesState {

}



class
WatchlistTvseriesLoading
    extends
    WatchlistTvseriesState {
}



class
WatchlistTvseriesError
    extends
    WatchlistTvseriesState {


  final
  String
  message;



  const
  WatchlistTvseriesError(
      this
          .message
      );



  @override
  List<
      Object>
  get props
  => [
    message
  ];
}

class
WatchlistTvseriesSuccess
    extends
    WatchlistTvseriesState {


  final
  String
  message;



  const
  WatchlistTvseriesSuccess(
      this
          .message
      );



  @override
  List<
      Object>
  get props
  => [
    message
  ];
}



class
WatchlistTvseriesLoaded
    extends
    WatchlistTvseriesState {


  final
  List<
      TvSeries>
  result;



  const
  WatchlistTvseriesLoaded(
      this
          .result
      );



  @override
  List<
      Object>
  get props
  => [
    result
  ];
}



class
WatchlistTvseriesStatusLoaded
    extends
    WatchlistTvseriesState {


  final
  bool
  result;


  const
  WatchlistTvseriesStatusLoaded(
      this
          .result
      );



  @override
  List<
      Object>
  get props
  => [
    result
  ];

}
