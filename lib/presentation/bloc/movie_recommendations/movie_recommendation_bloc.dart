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
    '/get_movie_recommendations.dart';


import 'package:'
    'equatable'
    '/equatable.dart';



part 'movie_recommendation_event.dart';


part 'movie_recommendation_state.dart';

class MovieRecommendationBloc
    extends
    Bloc<
        MovieRecommendationEvent,
        MovieRecommendationState
    > {
  final
  GetMovieRecommendations
  getMovieRecommendations;



  MovieRecommendationBloc({
    required
    this
        .getMovieRecommendations,
  }) : super(
      MovieRecommendationEmpty()){
    on<
        GetMovieRecommendationEvent>((
        event,
        emit)
    async {
      emit(
          MovieRecommendationLoading()
      );


      final
      result
      = await getMovieRecommendations
          .execute(
          event
              .id
      );


      result
          .fold(
            (
            failure) {
          emit(
              MovieRecommendationError(
                  failure
                      .message)
          );
        },
            (
            data) {
          emit(
              MovieRecommendationLoaded(
                  data)
          );
        },
      );
    });
  }
}