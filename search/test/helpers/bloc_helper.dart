import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search/search.dart';

class MockMoviesSearchBloc
    extends MockBloc<MoviesSearchEvent, MoviesSearchState>
    implements MoviesSearchBloc {}

class MoviesSearchEventFake extends Fake implements MoviesSearchEvent {}

class MoviesSearchStateFake extends Fake implements MoviesSearchState {}

class MockTvSeriesSearchBloc
    extends MockBloc<TvSeriesSearchEvent, TvSeriesSearchState>
    implements TvSeriesSearchBloc {}

class TvSeriesSearchEventFake extends Fake implements TvSeriesSearchEvent {}

class TvSeriesSearchStateFake extends Fake implements TvSeriesSearchState {}
