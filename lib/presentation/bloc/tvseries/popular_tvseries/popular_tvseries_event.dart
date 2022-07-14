part of 'popular_tvseries_bloc.dart';

abstract class PopularTvseriesEvent extends Equatable {
  const PopularTvseriesEvent();

  @override
  List<Object> get props => [];
}

class PopularTvseriesGetEvent extends PopularTvseriesEvent {}
