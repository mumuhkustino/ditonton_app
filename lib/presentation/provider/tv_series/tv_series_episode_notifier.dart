import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/episode.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_series_episode.dart';
import 'package:flutter/foundation.dart';

class TvSeriesEpisodeNotifier extends ChangeNotifier {
  final GetTvSeriesEpisode getTvSeriesEpisode;

  TvSeriesEpisodeNotifier({required this.getTvSeriesEpisode});

  List<Episode> _tvSeriesEpisode = [];
  List<Episode> get tvSeriesEpisode => _tvSeriesEpisode;

  RequestState _tvSeriesState = RequestState.empty;
  RequestState get tvSeriesState => _tvSeriesState;

  String _message = '';
  String get message => _message;

  Future<void> fetchTvSeriesEpisode(int id, int seasonId) async {
    _tvSeriesState = RequestState.loading;
    notifyListeners();

    final episodeResult = await getTvSeriesEpisode.execute(id, seasonId);
    episodeResult.fold((failure) {
      _tvSeriesState = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (episodeData) {
      _tvSeriesState = RequestState.loaded;
      _tvSeriesEpisode = episodeData;
      notifyListeners();
    });
  }
}
