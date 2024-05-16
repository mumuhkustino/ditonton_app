import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movie.dart';
import 'package:watchlist/watchlist.dart';

part 'watchlist_movie_state.dart';

class WatchlistMovieCubit extends Cubit<WatchlistMovieState> {
  final GetWatchlistMovie getWatchlistMovies;
  final GetWatchlistMovieStatus getWatchlistMoviesStatus;
  final SaveWatchlistMovie saveWatchlistMovies;
  final RemoveWatchlistMovie removeWatchlistMovies;

  static const addWatchlistMessage = 'Added to Watchlist';
  static const removeWatchlistMessage = 'Removed from Watchlist';

  WatchlistMovieCubit(this.getWatchlistMovies, this.getWatchlistMoviesStatus,
      this.saveWatchlistMovies, this.removeWatchlistMovies)
      : super(WatchlistMovieInitial());

  void loadWatchlistMoviesStatus(int id) async {
    final result = await getWatchlistMoviesStatus.execute(id);
    emit(WatchlistMovieStatus(result));
  }

  void fetchWatchlistMovies() async {
    emit(WatchlistMovieLoading());

    final result = await getWatchlistMovies.execute();
    result.fold((failure) async {
      emit(WatchlistMovieError(failure.message));
    }, (data) async {
      emit(WatchlistMovieLoaded(data));
    });
  }

  void addWatchlistMovies(MovieDetail movie) async {
    // emit(WatchlistMovieLoading());

    final result = await saveWatchlistMovies.execute(movie);
    await result.fold((failure) async {
      emit(WatchlistMovieError(failure.message));
    }, (message) async {
      emit(WatchlistMovieMessage(message));
    });

    loadWatchlistMoviesStatus(movie.id);
  }

  void deleteWatchlistMovies(int id) async {
    // emit(WatchlistMovieLoading());

    final result = await removeWatchlistMovies.execute(id);
    await result.fold((failure) async {
      emit(WatchlistMovieError(failure.message));
    }, (message) async {
      emit(WatchlistMovieMessage(message));
    });

    loadWatchlistMoviesStatus(id);
  }
}
