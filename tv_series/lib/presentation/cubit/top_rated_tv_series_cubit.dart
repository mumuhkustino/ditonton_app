import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

part 'top_rated_tv_series_state.dart';

class TopRatedTvSeriesCubit extends Cubit<TopRatedTvSeriesState> {
  final GetTopRatedTvSeries getTopRatedTvSeries;

  TopRatedTvSeriesCubit({required this.getTopRatedTvSeries})
      : super(TopRatedTvSeriesInitial());

  void fetchTopRatedTvSeries() async {
    emit(TopRatedTvSeriesLoading());
    final result = await getTopRatedTvSeries.execute();
    result.fold((failure) async {
      emit(TopRatedTvSeriesError(failure.message));
    }, (data) async {
      emit(TopRatedTvSeriesLoaded(data));
    });
  }
}
