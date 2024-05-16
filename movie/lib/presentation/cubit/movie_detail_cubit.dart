import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movie.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final GetMovieRecommendations getMovieRecommendations;

  MovieDetailCubit({
    required this.getMovieDetail,
    required this.getMovieRecommendations,
  }) : super(MovieDetailInitial());

  void fetchMovieDetail(int id) async {
    emit(MovieDetailLoading());

    final detailResult = await getMovieDetail.execute(id);
    final recommendationResult = await getMovieRecommendations.execute(id);

    detailResult.fold((failure) async {
      emit(MovieDetailError(failure.message));
    }, (detail) async {
      emit(MovieRecommendationLoading());
      recommendationResult.fold(
        (failure) async {
          emit(MovieRecommendationError(detail, const [], failure.message));
        },
        (recommendation) async {
          emit(MovieDetailLoaded(detail, recommendation));
        },
      );
    });
  }
}
