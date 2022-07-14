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
    '/get_top_rated_tvseries.dart';

part 'top_rated_tvseries_event.dart';

part 'top_rated_tvseries_state.dart';

class TopRatedTvseriesBloc
    extends Bloc<TopRatedTvseriesEvent, TopRatedTvseriesState> {
  final GetTopRatedTvSeries _getTopRatedTvseries;

  TopRatedTvseriesBloc(
    this._getTopRatedTvseries,
  ) : super(TopRatedTvseriesEmpty()) {
    on<TopRatedTvseriesGetEvent>((event, emit) async {
      emit(TopRatedTvseriesLoading());

      final result = await _getTopRatedTvseries.execute();

      result.fold(
        (failure) {
          emit(TopRatedTvseriesError(failure.message));
        },
        (data) {
          emit(TopRatedTvseriesLoaded(data));
        },
      );
    });
  }
}
