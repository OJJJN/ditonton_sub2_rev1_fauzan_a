part of 'popular_tvseries_bloc.dart';


abstract
class
PopularTvseriesState
    extends
    Equatable {
  const
  PopularTvseriesState(
      );



  @override
  List<
      Object>
  get props
  => [
  ];
}



class
PopularTvseriesEmpty
    extends
    PopularTvseriesState {
}



class
PopularTvseriesLoading
    extends
    PopularTvseriesState {
}



class
PopularTvseriesError
    extends
    PopularTvseriesState {


  final
  String
  message;



  const
  PopularTvseriesError(
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
PopularTvseriesLoaded
    extends
    PopularTvseriesState {


  final
  List<
      TvSeries>
  result;



  const
  PopularTvseriesLoaded(
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
