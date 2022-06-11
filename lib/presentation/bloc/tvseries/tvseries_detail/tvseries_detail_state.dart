part of 'tvseries_detail_bloc.dart';


abstract
class
TvseriesDetailState
    extends
    Equatable {


  const
  TvseriesDetailState(
      );

  @override
  List<
      Object>
  get props
  => [
  ];
}



class
TvseriesDetailEmpty
    extends
    TvseriesDetailState {
}



class
TvseriesDetailLoading
    extends
    TvseriesDetailState {
}



class
TvseriesDetailError
    extends
    TvseriesDetailState {


  final
  String
  message;



  const
  TvseriesDetailError(
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
TvseriesDetailLoaded
    extends
    TvseriesDetailState {


  final
  TvSeriesDetail
  tvSeriesDetail;



  const
  TvseriesDetailLoaded(
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