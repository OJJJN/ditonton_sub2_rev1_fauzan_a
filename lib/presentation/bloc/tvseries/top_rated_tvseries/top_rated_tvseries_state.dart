part of 'top_rated_tvseries_bloc.dart';


abstract
class
TopRatedTvseriesState
    extends
    Equatable {

  const
  TopRatedTvseriesState(
      );



  @override
  List<
      Object>
  get props
  => [
  ];
}



class
TopRatedTvseriesEmpty
    extends
    TopRatedTvseriesState {
}



class
TopRatedTvseriesLoading
    extends
    TopRatedTvseriesState {
}



class
TopRatedTvseriesError
    extends
    TopRatedTvseriesState {


  final
  String
  message;



  const
  TopRatedTvseriesError(
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
TopRatedTvseriesLoaded
    extends
    TopRatedTvseriesState {


  final
  List<
      TvSeries>
  result;



  const
  TopRatedTvseriesLoaded(
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
