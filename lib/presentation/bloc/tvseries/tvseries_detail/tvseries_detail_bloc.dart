import 'package:'
    'bloc'
    '/bloc.dart';

import 'package:'
    'equatable'
    '/equatable.dart';

import 'package:'
    'ditonton_sub2_rev1_fauzan_a/'
    'domain'
    '/entities'
    '/tvseries_detail.dart';

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_tvseries_detail.dart';

part 'tvseries_detail_event.dart';

part 'tvseries_detail_state.dart';

class TvseriesDetailBloc
    extends Bloc<TvseriesDetailEvent, TvseriesDetailState> {
  final GetTvSeriesDetail _getTvseriesDetail;

  TvseriesDetailBloc(
    this._getTvseriesDetail,
  ) : super(TvseriesDetailEmpty()) {
    on<TvseriesDetailGetEvent>((event, emit) async {
      emit(TvseriesDetailLoading());

      final result = await _getTvseriesDetail.execute(event.id);

      result.fold((failure) => emit(TvseriesDetailError(failure.message)),
          (data) => emit(TvseriesDetailLoaded(data)));
    });
  }
}
