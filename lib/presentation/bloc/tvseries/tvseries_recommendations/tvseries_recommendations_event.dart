part of 'tvseries_recommendations_bloc.dart';

abstract class TvseriesRecommendationsEvent extends Equatable {
  const TvseriesRecommendationsEvent();

  @override
  List<Object> get props => [];
}

class TvseriesRecommendationsGetEvent extends TvseriesRecommendationsEvent {
  final int id;

  const TvseriesRecommendationsGetEvent(this.id);

  @override
  List<Object> get props => [];
}
