part of 'watchlist_tv_series_cubit.dart';

abstract class WatchlistTvSeriesState extends Equatable {
  @override
  List<Object> get props => [];
}

class WatchlistTvSeriesInitial extends WatchlistTvSeriesState {}

class WatchlistTvSeriesLoading extends WatchlistTvSeriesState {}

class WatchlistTvSeriesLoaded extends WatchlistTvSeriesState {
  final List<TvSeries> watchlist;

  WatchlistTvSeriesLoaded(this.watchlist);

  @override
  List<Object> get props => [watchlist];
}

class WatchlistTvSeriesError extends WatchlistTvSeriesState {
  final String error;

  WatchlistTvSeriesError(this.error);

  @override
  List<Object> get props => [error];
}

class WatchlistTvSeriesStatus extends WatchlistTvSeriesState {
  final bool isAddedToWatchlist;

  WatchlistTvSeriesStatus(this.isAddedToWatchlist);

  @override
  List<Object> get props => [isAddedToWatchlist];
}

class WatchlistTvSeriesMessage extends WatchlistTvSeriesState {
  final String message;

  WatchlistTvSeriesMessage(this.message);

  @override
  List<Object> get props => [message];
}
