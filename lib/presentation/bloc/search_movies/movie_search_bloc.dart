import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/movie.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/usecases'
    '/search_movies.dart';


import 'package:'
    'equatable'
    '/equatable.dart';


import 'package:'
    'flutter_bloc'
    '/flutter_bloc.dart';



part 'movie_search_event.dart';


part 'movie_search_state.dart';

class MovieSearchBloc
    extends Bloc<
        MovieSearchEvent,
        MovieSearchState> {

  final
  SearchMovies
  searchMovies;



  MovieSearchBloc({
    required this
        .searchMovies,
  }) : super(
      MovieSearchEmpty()) {
    on<
        MovieSearchSetEmpty>((
        event,
        emit)
    => emit(
        MovieSearchEmpty())
    );


    on<
        MovieSearchQueryEvent>((
        event,
        emit)
    async {
      emit(
          MovieSearchLoading()
      );


      final
      result
      = await searchMovies
          .execute(
          event
              .query
      );


      result
          .fold(
            (
            failure) {
          emit(
              MovieSearchError(
                  failure
                      .message)
          );

        },
            (
            data) {
          emit(
              MovieSearchLoaded(
                  data)
          );
        },
      );
    });
  }
}