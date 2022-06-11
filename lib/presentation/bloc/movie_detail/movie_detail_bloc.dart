import 'package:'
    'bloc'
    '/bloc'
    '.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/movie_detail.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_movie_detail.dart';


import 'package:'
    'equatable'
    '/equatable.dart';





part 'movie_detail_event.dart';


part 'movie_detail_state.dart';

class MovieDetailBloc
    extends
    Bloc<
        MovieDetailEvent,
        MovieDetailState> {

  final
  GetMovieDetail
  getMovieDetail;



  MovieDetailBloc({
    required
    this
        .getMovieDetail,
  }) : super(
      MovieDetailEmpty()) {
    on<
        GetMovieDetailEvent>((
        event,
        emit)
    async {
      emit(
          MovieDetailLoading()
      );


      final
      result
      = await getMovieDetail
          .execute(
          event
              .id
      );


      result
          .fold(
            (
            failure) {
          emit(
              MovieDetailError(
                  failure
                      .message)
          );
        },
            (
            data) {
          emit(
              MovieDetailLoaded(
                  data)
          );
        },
      );
    });
  }
}