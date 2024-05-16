import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';
import 'package:search/search.dart';

part 'tv_series_search_event.dart';
part 'tv_series_search_state.dart';

class TvSeriesSearchBloc
    extends Bloc<TvSeriesSearchEvent, TvSeriesSearchState> {
  final SearchTvSeries _searchTvSeries;
  TvSeriesSearchBloc(this._searchTvSeries) : super(TvSeriesSearchEmpty()) {
    on<OnQueryTvSeriesChanged>(
      (event, emit) async {
        final query = event.query;

        emit(TvSeriesSearchLoading());
        final result = await _searchTvSeries.execute(query);

        result.fold((failure) {
          emit(TvSeriesSearchError(failure.message));
        }, (data) {
          emit(TvSeriesSearchHasData(data));
        });
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}
