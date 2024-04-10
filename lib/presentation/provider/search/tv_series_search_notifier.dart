import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/usecases/search/search_tv_series.dart';
import 'package:flutter/foundation.dart';

class TvSeriesSearchNotifier extends ChangeNotifier {
  final SearchTvSeries searchTvSeries;

  TvSeriesSearchNotifier({required this.searchTvSeries});

  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  List<TvSeries> _searchResult = [];
  List<TvSeries> get searchResult => _searchResult;

  String _message = '';
  String get message => _message;

  Future<void> fetchTvSeriesSearch(String query) async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await searchTvSeries.execute(query);
    result.fold((failure) {
      _message = failure.message;
      _state = RequestState.error;
      notifyListeners();
    }, (successData) {
      _searchResult = successData;
      _state = RequestState.loaded;
      notifyListeners();
    });
  }
}
