part of 'tv_series_episode_cubit.dart';

abstract class TvSeriesEpisodeState extends Equatable {
  const TvSeriesEpisodeState();

  @override
  List<Object?> get props => [];
}

class TvSeriesEpisodeInitial extends TvSeriesEpisodeState {}

class TvSeriesEpisodeLoading extends TvSeriesEpisodeState {}

class TvSeriesEpisodeLoaded extends TvSeriesEpisodeState {
  final List<Episode> episode;

  const TvSeriesEpisodeLoaded(this.episode);

  @override
  List<Object?> get props => [episode];
}

class TvSeriesEpisodeError extends TvSeriesEpisodeState {
  final String message;

  const TvSeriesEpisodeError(this.message);

  @override
  List<Object?> get props => [message];
}
