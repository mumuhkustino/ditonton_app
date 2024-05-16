import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:search/search.dart';
import 'package:tv_series/tv_series.dart';

import '../../../../tv_series/test/dummy_data/dummy_objects_tv_series.dart';
import '../../helpers/bloc_helper.dart';

void main() {
  late MockTvSeriesSearchBloc mockTvSeriesSearchBlock;

  setUpAll(() {
    registerFallbackValue(TvSeriesSearchStateFake());
    registerFallbackValue(TvSeriesSearchEventFake());
  });

  setUp(() {
    mockTvSeriesSearchBlock = MockTvSeriesSearchBloc();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<TvSeriesSearchBloc>.value(
      value: mockTvSeriesSearchBlock,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('page should display progress bar when loading',
      (widgetTester) async {
    when(() => mockTvSeriesSearchBlock.stream)
        .thenAnswer((_) => Stream.value(TvSeriesSearchLoading()));
    when(() => mockTvSeriesSearchBlock.state)
        .thenReturn(TvSeriesSearchLoading());

    final loadingWidget = find.byType(CircularProgressIndicator);

    await widgetTester
        .pumpWidget(makeTestableWidget(const SearchTvSeriesPage()));

    expect(loadingWidget, findsOneWidget);
  });

  testWidgets('page should display ListView when domain is loaded',
      (widgetTester) async {
    when(() => mockTvSeriesSearchBlock.state)
        .thenReturn(const TvSeriesSearchHasData(<TvSeries>[testTvSeries]));

    final listViewFinder = find.byType(ListView);

    await widgetTester
        .pumpWidget(makeTestableWidget(const SearchTvSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('page should display error message when error',
      (widgetTester) async {
    when(() => mockTvSeriesSearchBlock.state)
        .thenReturn(const TvSeriesSearchError('Error message'));

    final emptyMessage = find.byKey(const Key('error_message'));

    await widgetTester
        .pumpWidget(makeTestableWidget(const SearchTvSeriesPage()));

    expect(emptyMessage, findsOneWidget);
  });

  testWidgets('page should only display blank', (widgetTester) async {
    when(() => mockTvSeriesSearchBlock.state).thenReturn(TvSeriesSearchEmpty());

    final expandedFinder = find.byType(Expanded);

    await widgetTester
        .pumpWidget(makeTestableWidget(const SearchTvSeriesPage()));

    expect(expandedFinder, findsOneWidget);
  });

  testWidgets('page should display ListView when query id typed',
      (widgetTester) async {
    when(() => mockTvSeriesSearchBlock.state)
        .thenReturn(const TvSeriesSearchHasData(<TvSeries>[testTvSeries]));

    final textFieldFinder = find.byKey(const Key('query_input'));

    await widgetTester
        .pumpWidget(makeTestableWidget(const SearchTvSeriesPage()));
    await widgetTester.enterText(textFieldFinder, 'Star Wars');
    await widgetTester.testTextInput.receiveAction(TextInputAction.done);

    verify(
      () => mockTvSeriesSearchBlock
          .add(const OnQueryTvSeriesChanged('Star Wars')),
    );
  });
}
