part of 'on_the_air_tvseries_bloc.dart';

abstract class OnTheAirTvseriesState extends Equatable {
  const OnTheAirTvseriesState();

  @override
  List<Object> get props => [];
}

class OnTheAirTvseriesEmpty extends OnTheAirTvseriesState {}

class OnTheAirTvseriesLoading extends OnTheAirTvseriesState {}

class OnTheAirTvseriesError extends OnTheAirTvseriesState {
  final String message;

  const OnTheAirTvseriesError(this.message);

  @override
  List<Object> get props => [message];
}

class OnTheAirTvseriesLoaded extends OnTheAirTvseriesState {
  final List<TvSeries> result;

  const OnTheAirTvseriesLoaded(this.result);

  @override
  List<Object> get props => [result];
}
