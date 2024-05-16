import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

part 'on_the_air_tv_series_state.dart';

class OnTheAirTvSeriesCubit extends Cubit<OnTheAirTvSeriesState> {
  final GetOnTheAirTvSeries getOnTheAirTvSeries;

  OnTheAirTvSeriesCubit({required this.getOnTheAirTvSeries})
      : super(OnTheAirTvSeriesInitial());

  void fetchOnTheAirTvSeries() async {
    emit(OnTheAirTvSeriesLoading());
    final result = await getOnTheAirTvSeries.execute();
    result.fold((failure) async {
      emit(OnTheAirTvSeriesError(failure.message));
    }, (data) async {
      emit(OnTheAirTvSeriesLoaded(data));
    });
  }
}
