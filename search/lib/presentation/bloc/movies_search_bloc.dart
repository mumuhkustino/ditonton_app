import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movie.dart';
import 'package:search/search.dart';

part 'movies_search_event.dart';
part 'movies_search_state.dart';

class MoviesSearchBloc extends Bloc<MoviesSearchEvent, MoviesSearchState> {
  final SearchMovies _searchMovies;
  MoviesSearchBloc(this._searchMovies) : super(MoviesSearchEmpty()) {
    on<OnQueryMoviesChanged>(
      (event, emit) async {
        final query = event.query;

        emit(MoviesSearchLoading());
        final result = await _searchMovies.execute(query);

        result.fold((failure) {
          emit(MoviesSearchError(failure.message));
        }, (data) {
          emit(MoviesSearchHasData(data));
        });
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}
