import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';
import 'package:watchlist/watchlist.dart';

part 'watchlist_tv_series_state.dart';

class WatchlistTvSeriesCubit extends Cubit<WatchlistTvSeriesState> {
  final GetWatchlistTvSeries getWatchlistTvSeries;
  final GetWatchlistTvSeriesStatus getWatchlistTvSeriesStatus;
  final SaveWatchlistTvSeries saveWatchlistTvSeries;
  final RemoveWatchlistTvSeries removeWatchlistTvSeries;

  static const addWatchlistMessage = 'Added to Watchlist';
  static const removeWatchlistMessage = 'Removed from Watchlist';

  WatchlistTvSeriesCubit(
      this.getWatchlistTvSeries,
      this.getWatchlistTvSeriesStatus,
      this.saveWatchlistTvSeries,
      this.removeWatchlistTvSeries)
      : super(WatchlistTvSeriesInitial());

  void loadWatchlistTvSeriesStatus(int id) async {
    final result = await getWatchlistTvSeriesStatus.execute(id);
    emit(WatchlistTvSeriesStatus(result));
  }

  void fetchWatchlistTvSeries() async {
    emit(WatchlistTvSeriesLoading());

    final result = await getWatchlistTvSeries.execute();
    result.fold((failure) async {
      emit(WatchlistTvSeriesError(failure.message));
    }, (data) async {
      emit(WatchlistTvSeriesLoaded(data));
    });
  }

  void addWatchlistTvSeries(TvSeriesDetail tvSeries) async {
    // emit(WatchlistTvSeriesLoading());

    final result = await saveWatchlistTvSeries.execute(tvSeries);
    result.fold((failure) async {
      emit(WatchlistTvSeriesError(failure.message));
    }, (message) async {
      emit(WatchlistTvSeriesMessage(message));
    });

    loadWatchlistTvSeriesStatus(tvSeries.id);
  }

  void deleteWatchlistTvSeries(int id) async {
    // emit(WatchlistTvSeriesLoading());

    final result = await removeWatchlistTvSeries.execute(id);
    result.fold((failure) async {
      emit(WatchlistTvSeriesError(failure.message));
    }, (message) async {
      emit(WatchlistTvSeriesMessage(message));
    });

    loadWatchlistTvSeriesStatus(id);
  }
}
