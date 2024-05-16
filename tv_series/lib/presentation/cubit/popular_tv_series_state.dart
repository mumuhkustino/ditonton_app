part of 'popular_tv_series_cubit.dart';

abstract class PopularTvSeriesState extends Equatable {
  const PopularTvSeriesState();

  @override
  List<Object?> get props => [];
}

class PopularTvSeriesInitial extends PopularTvSeriesState {}

class PopularTvSeriesLoading extends PopularTvSeriesState {}

class PopularTvSeriesLoaded extends PopularTvSeriesState {
  final List<TvSeries> popularTvSeries;

  const PopularTvSeriesLoaded(this.popularTvSeries);

  @override
  List<Object?> get props => [popularTvSeries];
}

class PopularTvSeriesError extends PopularTvSeriesState {
  final String error;

  const PopularTvSeriesError(this.error);

  @override
  List<Object?> get props => [error];
}
