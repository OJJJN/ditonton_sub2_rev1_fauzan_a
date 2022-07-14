part of 'movie_watchlist_bloc.dart';

abstract class MovieWatchlistState extends Equatable {
  const MovieWatchlistState();

  @override
  List<Object> get props => [];
}

class MovieWatchlistEmpty extends MovieWatchlistState {}

class MovieWatchlistLoading extends MovieWatchlistState {}

class MovieWatchlistError extends MovieWatchlistState {
  final String message;

  const MovieWatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieWatchlistSuccess extends MovieWatchlistState {
  final String message;

  const MovieWatchlistSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class MovieWatchlistLoaded extends MovieWatchlistState {
  final List<Movie> result;

  const MovieWatchlistLoaded(this.result);

  @override
  List<Object> get props => [result];
}

class MovieWatchlistStatusLoaded extends MovieWatchlistState {
  final bool result;

  const MovieWatchlistStatusLoaded(this.result);

  @override
  List<Object> get props => [result];
}
