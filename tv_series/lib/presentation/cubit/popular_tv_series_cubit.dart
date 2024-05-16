import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

part 'popular_tv_series_state.dart';

class PopularTvSeriesCubit extends Cubit<PopularTvSeriesState> {
  final GetPopularTvSeries getPopularTvSeries;

  PopularTvSeriesCubit({required this.getPopularTvSeries})
      : super(PopularTvSeriesInitial());

  void fetchPopularTvSeries() async {
    emit(PopularTvSeriesLoading());
    final result = await getPopularTvSeries.execute();
    result.fold((failure) async {
      emit(PopularTvSeriesError(failure.message));
    }, (data) async {
      emit(PopularTvSeriesLoaded(data));
    });
  }
}
