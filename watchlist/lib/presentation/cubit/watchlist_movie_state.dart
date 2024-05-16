part of 'watchlist_movie_cubit.dart';

abstract class WatchlistMovieState extends Equatable {
  @override
  List<Object> get props => [];
}

class WatchlistMovieInitial extends WatchlistMovieState {}

class WatchlistMovieLoading extends WatchlistMovieState {}

class WatchlistMovieLoaded extends WatchlistMovieState {
  final List<Movie> watchlist;

  WatchlistMovieLoaded(this.watchlist);

  @override
  List<Object> get props => [watchlist];
}

class WatchlistMovieError extends WatchlistMovieState {
  final String error;

  WatchlistMovieError(this.error);

  @override
  List<Object> get props => [error];
}

class WatchlistMovieStatus extends WatchlistMovieState {
  final bool isAddedToWatchlist;

  WatchlistMovieStatus(this.isAddedToWatchlist);

  @override
  List<Object> get props => [isAddedToWatchlist];
}

class WatchlistMovieMessage extends WatchlistMovieState {
  final String message;

  WatchlistMovieMessage(this.message);

  @override
  List<Object> get props => [message];
}
