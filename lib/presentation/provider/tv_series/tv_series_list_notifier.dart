import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_now_playing_tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_popular_tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_top_rated_tv_series.dart';
import 'package:flutter/material.dart';

class TvSeriesListNotifier extends ChangeNotifier {
  var _onTheAirTvSeries = <TvSeries>[];
  List<TvSeries> get onTheAirTvSeries => _onTheAirTvSeries;

  RequestState _onTheAirState = RequestState.empty;
  RequestState get onTheAirState => _onTheAirState;

  var _popularTvSeries = <TvSeries>[];
  List<TvSeries> get popularTvSeries => _popularTvSeries;

  RequestState _popularTvSeriesState = RequestState.empty;
  RequestState get popularTvSeriesState => _popularTvSeriesState;

  var _topRatedTvSeries = <TvSeries>[];
  List<TvSeries> get topRatedTvSeries => _topRatedTvSeries;

  RequestState _topRatedTvSeriesState = RequestState.empty;
  RequestState get topRatedTvSeriesState => _topRatedTvSeriesState;

  String _message = '';
  String get message => _message;

  TvSeriesListNotifier({
    required this.getOnTheAirTvSeries,
    required this.getPopularTvSeries,
    required this.getTopRatedTvSeries,
  });

  final GetOnTheAirTvSeries getOnTheAirTvSeries;
  final GetPopularTvSeries getPopularTvSeries;
  final GetTopRatedTvSeries getTopRatedTvSeries;

  Future<void> fetchOnTheAirTvSeries() async {
    _onTheAirState = RequestState.loading;
    notifyListeners();

    final result = await getOnTheAirTvSeries.execute();
    result.fold((failure) {
      _onTheAirState = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (tvSeriesData) {
      _onTheAirState = RequestState.loaded;
      _onTheAirTvSeries = tvSeriesData;
      notifyListeners();
    });
  }

  Future<void> fetchPopularTvSeries() async {
    _popularTvSeriesState = RequestState.loading;
    notifyListeners();

    final result = await getPopularTvSeries.execute();
    result.fold((failure) {
      _popularTvSeriesState = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (tvSeriesData) {
      _popularTvSeriesState = RequestState.loaded;
      _popularTvSeries = tvSeriesData;
      notifyListeners();
    });
  }

  Future<void> fetchTopRatedTvSeries() async {
    _topRatedTvSeriesState = RequestState.loading;
    notifyListeners();

    final result = await getTopRatedTvSeries.execute();
    result.fold((failure) {
      _topRatedTvSeriesState = RequestState.error;
      _message = failure.message;
      notifyListeners();
    }, (tvSeriesData) {
      _topRatedTvSeriesState = RequestState.loaded;
      _topRatedTvSeries = tvSeriesData;
      notifyListeners();
    });
  }
}
