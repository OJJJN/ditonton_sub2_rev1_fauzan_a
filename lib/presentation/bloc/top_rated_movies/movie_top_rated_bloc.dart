import 'package:'
    'bloc'
    '/bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/movie.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/get_top_rated_movies.dart';


import 'package:'
    'equatable'
    '/equatable.dart';



part 'movie_top_rated_event.dart';


part 'movie_top_rated_state.dart';



class MovieTopRatedBloc
    extends Bloc<
        MovieTopRatedEvent,
        MovieTopRatedState> {

  final
  GetTopRatedMovies
  getTopRatedMovies;



  MovieTopRatedBloc(
      this
          .getTopRatedMovies,
      ) : super(
      MovieTopRatedEmpty()) {
    on<
        MovieTopRatedGetEvent>((
        event,
        emit)
    async {
      emit(
          MovieTopRatedLoading(
          )
      );


      final
      result
      = await getTopRatedMovies
          .execute(
      );


      result
          .fold(
            (
            failure) {
          emit(
              MovieTopRatedError(
                  failure
                      .message)
          );
        },
            (
            data) {
          emit(
              MovieTopRatedLoaded(
                  data)
          );
        },
      );
    });
  }
}