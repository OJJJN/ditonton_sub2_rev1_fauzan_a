import 'package:'
    'equatable'
    '/equatable.dart';


import 'package:'
    'flutter_bloc'
    '/flutter_bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_now_playing_tvseries.dart';



part 'on_the_air_tvseries_event.dart';


part 'on_the_air_tvseries_state.dart';

class OnTheAirTvseriesBloc
    extends Bloc<
        OnTheAirTvseriesEvent,
        OnTheAirTvseriesState> {


  final
  GetNowPlayingTvSeries
  _getOnAirTvseries;




  OnTheAirTvseriesBloc(
      this
          ._getOnAirTvseries,
      ) : super(
      OnTheAirTvseriesEmpty(
      )
  ) {
    on<
        OnTheAirTvseriesGetEvent>(
            (event,
            emit)
        async {
      emit(
          OnTheAirTvseriesLoading(
          )
      );


      final
      result
      = await
      _getOnAirTvseries
          .execute(
      );


      result
          .fold(
            (
              failure) =>
          emit(
              OnTheAirTvseriesError(
                  failure
                      .message)
          ),

            (
              data
              )
          =>
          emit(
              OnTheAirTvseriesLoaded(
                  data
              )
          )
      );
    });
  }
}
