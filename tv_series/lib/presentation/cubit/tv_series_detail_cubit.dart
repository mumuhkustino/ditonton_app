import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_series_detail_state.dart';

class TvSeriesDetailCubit extends Cubit<TvSeriesDetailState> {
  final GetTvSeriesDetail getTvSeriesDetail;
  final GetTvSeriesRecommendations getTvSeriesRecommendations;

  TvSeriesDetailCubit(
      {required this.getTvSeriesDetail,
      required this.getTvSeriesRecommendations})
      : super(TvSeriesDetailInitial());

  void fetchTvSeriesDetail(int id) async {
    emit(TvSeriesDetailLoading());

    final detailResult = await getTvSeriesDetail.execute(id);
    final recommendationResult = await getTvSeriesRecommendations.execute(id);

    detailResult.fold((failure) async {
      emit(TvSeriesDetailError(failure.message));
    }, (detail) async {
      emit(TvSeriesRecommendationLoading());
      recommendationResult.fold(
        (failure) async {
          emit(TvSeriesRecommendationError(detail, const [], failure.message));
        },
        (recommendation) async {
          emit(TvSeriesDetailLoaded(detail, recommendation));
        },
      );
    });
  }
}
