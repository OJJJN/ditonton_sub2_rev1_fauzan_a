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
    '/get_popular_tvseries.dart';



part 'popular_tvseries_event.dart';


part 'popular_tvseries_state.dart';



class
PopularTvseriesBloc
    extends
    Bloc<
        PopularTvseriesEvent,
        PopularTvseriesState> {

  final
  GetPopularTvSeries
  _getPopularTvseries;



  PopularTvseriesBloc(
      this
          ._getPopularTvseries,
      ) : super(
      PopularTvseriesEmpty()
  ) {
    on<
        PopularTvseriesGetEvent>((
        event,
        emit)
    async {
      emit(
          PopularTvseriesLoading()
      );


      final
      result
      = await _getPopularTvseries
          .execute(
      );


      result
          .fold(
            (
            failure) {
          emit(
              PopularTvseriesError(
                  failure
                      .message)
          );

        },
            (
            data) {
          emit(
              PopularTvseriesLoaded(
                  data)
          );
        },
      );
    });
  }
}
