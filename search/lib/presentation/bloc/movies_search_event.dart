part of 'movies_search_bloc.dart';

abstract class MoviesSearchEvent extends Equatable {
  const MoviesSearchEvent();
}

class OnQueryMoviesChanged extends MoviesSearchEvent {
  final String query;

  const OnQueryMoviesChanged(this.query);

  @override
  List<Object> get props => [query];
}
