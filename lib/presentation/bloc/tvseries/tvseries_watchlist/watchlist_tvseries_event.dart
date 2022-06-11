part of 'watchlist_tvseries_bloc.dart';


abstract
class
WatchlistTvseriesEvent
    extends
    Equatable {

  const
  WatchlistTvseriesEvent(
      );



  @override
  List<
      Object>
  get props
  => [
  ];
}



class
WatchlistTvseriesGetEvent
    extends
    WatchlistTvseriesEvent {
}



class
WatchlistTvseriesGetStatusEvent
    extends
    WatchlistTvseriesEvent {


  final
  int
  id;



  const
  WatchlistTvseriesGetStatusEvent(
      this
          .id
      );



  @override
  List<
      Object>
  get props
  => [
    id
  ];

}



class
WatchlistTvseriesTambahItemEvent
    extends
    WatchlistTvseriesEvent {

  final
  TvSeriesDetail
  tvSeriesDetail;



  const
  WatchlistTvseriesTambahItemEvent(
      this
          .tvSeriesDetail
      );



  @override
  List<
      Object>
  get props
  => [
    tvSeriesDetail
  ];

}



class
WatchlistTvseriesHapusItemEvent
    extends
    WatchlistTvseriesEvent {

  final
  TvSeriesDetail
  tvSeriesDetail;



  const
  WatchlistTvseriesHapusItemEvent(
      this
          .tvSeriesDetail
      );



  @override
  List<
      Object>
  get props
  => [
    tvSeriesDetail
  ];
}
