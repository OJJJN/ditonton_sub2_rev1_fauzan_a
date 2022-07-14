import 'package:'
    'bloc'
    '/bloc.dart';

import 'package:'
    'equatable'
    '/equatable.dart';

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/tvseries.dart';

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_tvseries_recommendations.dart';

part 'tvseries_recommendations_event.dart';

part 'tvseries_recommendations_state.dart';

class TvseriesRecommendationsBloc
    extends Bloc<TvseriesRecommendationsEvent, TvseriesRecommendationsState> {
  final GetTvSeriesRecommendations _getTvseriesRecommendations;

  TvseriesRecommendationsBloc(
    this._getTvseriesRecommendations,
  ) : super(TvseriesRecommendationsEmpty()) {
    on<TvseriesRecommendationsGetEvent>((event, emit) async {
      emit(TvseriesRecommendationsLoading());

      final result = await _getTvseriesRecommendations.execute(event.id);

      result.fold(
        (failure) {
          emit(TvseriesRecommendationsError(failure.message));
        },
        (data) {
          emit(TvseriesRecommendationsLoaded(data));
        },
      );
    });
  }
}
