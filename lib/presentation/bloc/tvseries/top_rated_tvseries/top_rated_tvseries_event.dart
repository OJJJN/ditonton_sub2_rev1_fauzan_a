part of 'top_rated_tvseries_bloc.dart';

abstract class TopRatedTvseriesEvent extends Equatable {
  const TopRatedTvseriesEvent();

  @override
  List<Object> get props => [];
}

class TopRatedTvseriesGetEvent extends TopRatedTvseriesEvent {}
