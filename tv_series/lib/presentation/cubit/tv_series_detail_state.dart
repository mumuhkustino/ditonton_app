part of 'tv_series_detail_cubit.dart';

abstract class TvSeriesDetailState extends Equatable {
  const TvSeriesDetailState();

  @override
  List<Object?> get props => [];
}

class TvSeriesDetailInitial extends TvSeriesDetailState {}

class TvSeriesDetailLoading extends TvSeriesDetailState {}

class TvSeriesDetailLoaded extends TvSeriesDetailState {
  final TvSeriesDetail tvSeriesDetail;
  final List<TvSeries> recommendationTvSeries;

  const TvSeriesDetailLoaded(this.tvSeriesDetail, this.recommendationTvSeries);
  @override
  List<Object?> get props => [TvSeriesDetail, recommendationTvSeries];
}

class TvSeriesDetailError extends TvSeriesDetailState {
  final String message;

  const TvSeriesDetailError(this.message);

  @override
  List<Object?> get props => [message];
}

class TvSeriesRecommendationLoading extends TvSeriesDetailState {}

class TvSeriesRecommendationError extends TvSeriesDetailState {
  final TvSeriesDetail tvSeriesDetail;
  final List<TvSeries> recommendationTvSeries;
  final String message;

  const TvSeriesRecommendationError(this.tvSeriesDetail, this.recommendationTvSeries, this.message);

  @override
  List<Object?> get props => [tvSeriesDetail, recommendationTvSeries, message];
}
