part of 'top_rated_tv_series_cubit.dart';

abstract class TopRatedTvSeriesState extends Equatable {
  const TopRatedTvSeriesState();

  @override
  List<Object?> get props => [];
}

class TopRatedTvSeriesInitial extends TopRatedTvSeriesState {}

class TopRatedTvSeriesLoading extends TopRatedTvSeriesState {}

class TopRatedTvSeriesLoaded extends TopRatedTvSeriesState {
  final List<TvSeries> topRatedTvSeries;

  const TopRatedTvSeriesLoaded(this.topRatedTvSeries);

  @override
  List<Object?> get props => [topRatedTvSeries];
}

class TopRatedTvSeriesError extends TopRatedTvSeriesState {
  final String error;

  const TopRatedTvSeriesError(this.error);

  @override
  List<Object?> get props => [error];
}
