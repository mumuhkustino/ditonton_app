import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series_detail.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_series_recommendations.dart';
import 'package:ditonton/domain/usecases/watchlist/get_watchlist_tv_series_status.dart';
import 'package:ditonton/domain/usecases/watchlist/remove_watchlist_tv_series.dart';
import 'package:ditonton/domain/usecases/watchlist/save_watchlist_tv_series.dart';
import 'package:flutter/foundation.dart';

class TvSeriesDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to Watchlist Tv Series';
  static const watchlistRemoveSuccessMessage =
      'Removed from Watchlist Tv Series';

  final GetTvSeriesDetail getTvSeriesDetail;
  final GetTvSeriesRecommendations getTvSeriesRecommendations;
  final GetWatchlistTvSeriesStatus getWatchlistTvSeriesStatus;
  final SaveWatchlistTvSeries saveWatchlistTvSeries;
  final RemoveWatchlistTvSeries removeWatchlistTvSeries;

  TvSeriesDetailNotifier({
    required this.getTvSeriesDetail,
    required this.getTvSeriesRecommendations,
    required this.getWatchlistTvSeriesStatus,
    required this.saveWatchlistTvSeries,
    required this.removeWatchlistTvSeries,
  });

  late TvSeriesDetail _tvSeries;
  TvSeriesDetail get tvSeries => _tvSeries;

  RequestState _tvSeriesState = RequestState.empty;
  RequestState get tvSeriesState => _tvSeriesState;

  List<TvSeries> _tvSeriesRecommendations = [];
  List<TvSeries> get tvSeriesRecommendations => _tvSeriesRecommendations;

  RequestState _recommendationState = RequestState.empty;
  RequestState get recommendationState => _recommendationState;

  String _message = '';
  String get message => _message;

  bool _isAddedToWatchlist = false;
  bool get isAddedToWatchlist => _isAddedToWatchlist;

  Future<void> fetchTvSeriesDetail(int id) async {
    _tvSeriesState = RequestState.loading;
    notifyListeners();
    final detailResult = await getTvSeriesDetail.execute(id);
    final recommendationResult = await getTvSeriesRecommendations.execute(id);
    detailResult.fold((failure) {
      _tvSeriesState = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (tvSeries) {
      _recommendationState = RequestState.loading;
      _tvSeries = tvSeries;
      notifyListeners();
      recommendationResult.fold(
        (failure) {
          _recommendationState = RequestState.error;
          _message = failure.message;
        },
        (tvSeries) {
          _recommendationState = RequestState.loaded;
          _tvSeriesRecommendations = tvSeries;
        },
      );
      _tvSeriesState = RequestState.loaded;
      notifyListeners();
    });
  }

  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;

  Future<void> addWatchlistTvSeries(TvSeriesDetail tvSeries) async {
    final result = await saveWatchlistTvSeries.execute(tvSeries);

    await result.fold((failure) async {
      _watchlistMessage = failure.message;
    }, (successMessage) async {
      _watchlistMessage = watchlistAddSuccessMessage;
    });

    await loadWatchlistStatusTvSeries(tvSeries.id);
  }

  Future<void> removeFromWatchlistTvSeries(int id) async {
    final result = await removeWatchlistTvSeries.execute(id);

    await result.fold((failure) async {
      _watchlistMessage = failure.message;
    }, (successMessage) async {
      _watchlistMessage = watchlistRemoveSuccessMessage;
    });

    await loadWatchlistStatusTvSeries(id);
  }

  Future<void> loadWatchlistStatusTvSeries(int id) async {
    final result = await getWatchlistTvSeriesStatus.execute(id);
    _isAddedToWatchlist = result;
    notifyListeners();
  }
}
