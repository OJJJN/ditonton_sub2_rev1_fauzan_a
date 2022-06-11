part of 'tvseries_recommendations_bloc.dart';



abstract
class
TvseriesRecommendationsState
    extends
    Equatable {

  const
  TvseriesRecommendationsState(
      );


  @override
  List<
      Object>
  get props
  => [
  ];
}


class
TvseriesRecommendationsEmpty
    extends
    TvseriesRecommendationsState {
}



class
TvseriesRecommendationsLoading
    extends
    TvseriesRecommendationsState {
}



class
TvseriesRecommendationsError
    extends
    TvseriesRecommendationsState {


  final
  String
  message;



  const
  TvseriesRecommendationsError(
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
TvseriesRecommendationsLoaded
    extends
    TvseriesRecommendationsState {

  final
  List<
      TvSeries>
  tvSeries;



  const
  TvseriesRecommendationsLoaded(
      this
          .tvSeries
      );



  @override
  List<
      Object>
  get props
  => [
    tvSeries
  ];
}
