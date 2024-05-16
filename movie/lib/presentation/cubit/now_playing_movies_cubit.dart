import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movie.dart';

part 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  final GetNowPlayingMovies getNowPlayingMovies;

  NowPlayingMoviesCubit({required this.getNowPlayingMovies})
      : super(NowPlayingMoviesInitial());

  void fetchNowPlayingMovies() async {
    emit(NowPlayingMoviesLoading());
    final result = await getNowPlayingMovies.execute();
    result.fold((failure) async {
      emit(NowPlayingMoviesError(failure.message));
    }, (data) async {
      emit(NowPlayingMoviesLoaded(data));
    });
  }
}
