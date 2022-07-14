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
    '/entities'
    '/tvseries_detail.dart';

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_watchlist_tvseries.dart';

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_watchlist_tvseries_status.dart';

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/remove_tvseries_watchlist.dart';

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/save_tvseries_watchlist.dart';

part 'watchlist_tvseries_event.dart';

part 'watchlist_tvseries_state.dart';

class WatchlistTvseriesBloc
    extends Bloc<WatchlistTvseriesEvent, WatchlistTvseriesState> {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';

  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetWatchlistTvSeries _getWatchlistTvseries;

  final GetWatchListStatusTvSeries _getWatchListStatusTvseries;

  final SaveWatchlistTvSeries _saveWatchlistTvseries;

  final RemoveWatchlistTvSeries _removeWatchlistTvseries;

  WatchlistTvseriesBloc(
    this._getWatchlistTvseries,
    this._getWatchListStatusTvseries,
    this._saveWatchlistTvseries,
    this._removeWatchlistTvseries,
  ) : super(WatchlistTvseriesEmpty()) {
    on<WatchlistTvseriesGetEvent>((event, emit) async {
      emit(WatchlistTvseriesLoading());

      final result = await _getWatchlistTvseries.execute();

      result.fold(
        (failure) {
          emit(WatchlistTvseriesError(failure.message));
        },
        (data) {
          emit(WatchlistTvseriesLoaded(data));
        },
      );
    });

    on<WatchlistTvseriesGetStatusEvent>((event, emit) async {
      final id = event.id;

      final result = await _getWatchListStatusTvseries.execute(id);

      emit(WatchlistTvseriesStatusLoaded(result));
    });

    on<WatchlistTvseriesTambahItemEvent>((event, emit) async {
      final tvSeriesDetail = event.tvSeriesDetail;

      final result = await _saveWatchlistTvseries.execute(tvSeriesDetail);

      result.fold(
        (failure) {
          emit(WatchlistTvseriesError(failure.message));
        },
        (successMessage) {
          emit(WatchlistTvseriesSuccess(successMessage));
        },
      );
    });

    on<WatchlistTvseriesHapusItemEvent>((event, emit) async {
      final tvSeriesDetail = event.tvSeriesDetail;

      final result = await _removeWatchlistTvseries.execute(tvSeriesDetail);

      result.fold(
        (failure) {
          emit(WatchlistTvseriesError(failure.message));
        },
        (successMessage) {
          emit(WatchlistTvseriesSuccess(successMessage));
        },
      );
    });
  }
}
