part of 'movie_detail_cubit.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object?> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail movieDetail;
  final List<Movie> recommendationMovie;

  const MovieDetailLoaded(this.movieDetail, this.recommendationMovie);
  @override
  List<Object?> get props => [movieDetail, recommendationMovie];
}

class MovieDetailError extends MovieDetailState {
  final String message;

  const MovieDetailError(this.message);

  @override
  List<Object?> get props => [message];
}

class MovieRecommendationLoading extends MovieDetailState {}

class MovieRecommendationError extends MovieDetailState {
  final MovieDetail movieDetail;
  final List<Movie> recommendationMovie;
  final String message;

  const MovieRecommendationError(this.movieDetail, this.recommendationMovie, this.message);

  @override
  List<Object?> get props => [message];
}
