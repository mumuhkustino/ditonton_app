import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_on_the_air_tv_series.dart';
import 'package:flutter/material.dart';

class OnTheAirTvSeriesNotifier extends ChangeNotifier {
  final GetOnTheAirTvSeries getOnTheAirTvSeries;

  OnTheAirTvSeriesNotifier({required this.getOnTheAirTvSeries});

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  List<TvSeries> _tvSeries = [];
  List<TvSeries> get tvSeries => _tvSeries;

  String _message = '';
  String get message => _message;

  Future<void> fetchOnTheAirTvSeries() async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await getOnTheAirTvSeries.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.error;
        notifyListeners();
      },
      (tvSeriesData) {
        _tvSeries = tvSeriesData;
        _state = RequestState.loaded;
        notifyListeners();
      },
    );
  }
}
