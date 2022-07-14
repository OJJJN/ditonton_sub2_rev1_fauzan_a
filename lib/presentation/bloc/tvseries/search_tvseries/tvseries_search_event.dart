part of 'tvseries_search_bloc.dart';

abstract class TvseriesSearchEvent extends Equatable {
  const TvseriesSearchEvent();

  @override
  List<Object> get props => [];
}

class TvseriesSearchSetEmpty extends TvseriesSearchEvent {}

class TvseriesSearchQueryEvent extends TvseriesSearchEvent {
  final String query;

  const TvseriesSearchQueryEvent(this.query);

  @override
  List<Object> get props => [];
}
