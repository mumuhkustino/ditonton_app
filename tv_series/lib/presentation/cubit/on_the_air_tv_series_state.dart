part of 'on_the_air_tv_series_cubit.dart';

abstract class OnTheAirTvSeriesState extends Equatable {
  const OnTheAirTvSeriesState();

  @override
  List<Object?> get props => [];
}

class OnTheAirTvSeriesInitial extends OnTheAirTvSeriesState {}

class OnTheAirTvSeriesLoading extends OnTheAirTvSeriesState {}

class OnTheAirTvSeriesLoaded extends OnTheAirTvSeriesState {
  final List<TvSeries> onTheAirTvSeries;

  const OnTheAirTvSeriesLoaded(this.onTheAirTvSeries);

  @override
  List<Object?> get props => [onTheAirTvSeries];
}

class OnTheAirTvSeriesError extends OnTheAirTvSeriesState {
  final String error;

  const OnTheAirTvSeriesError(this.error);

  @override
  List<Object?> get props => [error];
}
