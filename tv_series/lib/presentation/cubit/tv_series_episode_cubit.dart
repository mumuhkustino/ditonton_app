import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_series_episode_state.dart';

class TvSeriesEpisodeCubit extends Cubit<TvSeriesEpisodeState> {
  final GetTvSeriesEpisode tvSeriesEpisode;

  TvSeriesEpisodeCubit({required this.tvSeriesEpisode})
      : super(TvSeriesEpisodeInitial());

  void fetchEpisodeTv(int id, int season) async {
    emit(TvSeriesEpisodeLoading());

    final episode = await tvSeriesEpisode.execute(id, season);
    episode.fold(
      (failure) async {
        emit(TvSeriesEpisodeError(failure.message));
      },
      (data) async {
        if (data.isNotEmpty) {
          emit(TvSeriesEpisodeLoaded(data));
        } else {
          if (data.isEmpty) {
            emit(TvSeriesEpisodeInitial());
          }
        }
      },
    );
  }
}
