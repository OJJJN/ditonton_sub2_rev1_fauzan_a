import 'package:'
    'bloc'
    '/bloc.dart';


import 'package:'
    'equatable'
    '/equatable.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/search_tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/tvseries.dart';



part 'tvseries_search_event.dart';


part 'tvseries_search_state.dart';


class
TvseriesSearchBloc
    extends Bloc<
        TvseriesSearchEvent,
        TvseriesSearchState> {

  final
  SearchTvSeries
  _searchTvSeries;



  TvseriesSearchBloc(
     this
         ._searchTvSeries,

  ) : super(
      TvseriesSearchEmpty()
  ) {
    on<
        TvseriesSearchSetEmpty>(
            (event,
            emit)
        => emit(
            TvseriesSearchEmpty()
        )
    );


    on<
        TvseriesSearchQueryEvent>((
        event,
        emit)

    async {
      emit(
          TvseriesSearchLoading()
      );


      final
      result
      = await _searchTvSeries
          .execute(
          event
              .query
      );


      result
          .fold(
            (
            failure) {
          emit(
              TvseriesSearchError(
                  failure
                      .message)
          );
        },
            (
            data) {
          emit(
              TvseriesSearchLoaded(
                  data)
          );
        },
      );
    });
  }
}