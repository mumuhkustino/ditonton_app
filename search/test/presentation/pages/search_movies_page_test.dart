import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie/movie.dart';
import 'package:search/search.dart';

import '../../../../movie/test/dummy_data/dummy_objects_movie.dart';
import '../../helpers/bloc_helper.dart';

void main() {
  late MockMoviesSearchBloc mockMoviesSearchBloc;

  setUpAll(() {
    registerFallbackValue(MoviesSearchEventFake());
    registerFallbackValue(MoviesSearchStateFake());
  });

  setUp(() {
    mockMoviesSearchBloc = MockMoviesSearchBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<MoviesSearchBloc>.value(
      value: mockMoviesSearchBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('page should display progress bar when loading',
      (widgetTester) async {
    when(() => mockMoviesSearchBloc.stream)
        .thenAnswer((_) => Stream.value(MoviesSearchLoading()));
    when(() => mockMoviesSearchBloc.state).thenReturn(MoviesSearchLoading());

    final loadingWidget = find.byType(CircularProgressIndicator);

    await widgetTester.pumpWidget(makeTestableWidget(const SearchMoviesPage()));

    expect(loadingWidget, findsOneWidget);
  });

  testWidgets('page should display ListView when domain is loaded',
      (widgetTester) async {
    when(() => mockMoviesSearchBloc.state)
        .thenReturn(const MoviesSearchHasData(<Movie>[testMovie]));

    final listViewFinder = find.byType(ListView);

    await widgetTester.pumpWidget(makeTestableWidget(const SearchMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('page should display error message when error',
      (widgetTester) async {
    when(() => mockMoviesSearchBloc.state)
        .thenReturn(const MoviesSearchError('Error message'));

    final emptyMessage = find.byKey(const Key('error_message'));

    await widgetTester.pumpWidget(makeTestableWidget(const SearchMoviesPage()));

    expect(emptyMessage, findsOneWidget);
  });

  testWidgets('page should only display blank', (widgetTester) async {
    when(() => mockMoviesSearchBloc.state).thenReturn(MoviesSearchEmpty());

    final expandedFinder = find.byType(Expanded);

    await widgetTester.pumpWidget(makeTestableWidget(const SearchMoviesPage()));

    expect(expandedFinder, findsOneWidget);
  });

  testWidgets('page should display ListView when query id typed',
      (widgetTester) async {
    when(() => mockMoviesSearchBloc.state)
        .thenReturn(const MoviesSearchHasData(<Movie>[]));

    final textFieldFinder = find.byKey(const Key('query_input'));

    await widgetTester.pumpWidget(makeTestableWidget(const SearchMoviesPage()));
    await widgetTester.enterText(textFieldFinder, 'Spiderman');
    await widgetTester.testTextInput.receiveAction(TextInputAction.done);

    verify(() =>
        mockMoviesSearchBloc.add(const OnQueryMoviesChanged('Spiderman')));
  });
}
