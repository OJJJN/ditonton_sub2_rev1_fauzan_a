part of 'tvseries_detail_bloc.dart';

abstract class TvseriesDetailEvent extends Equatable {
  const TvseriesDetailEvent();

  @override
  List<Object> get props => [];
}

class TvseriesDetailGetEvent extends TvseriesDetailEvent {
  final int id;

  const TvseriesDetailGetEvent(this.id);

  @override
  List<Object> get props => [];
}
