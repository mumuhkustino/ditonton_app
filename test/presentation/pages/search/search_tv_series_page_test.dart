import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/presentation/pages/search/search_tv_series_page.dart';
import 'package:ditonton/presentation/provider/search/tv_series_search_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../../dummy_data/tv_series/dummy_objects_tv_series.dart';
import 'search_tv_series_page_test.mocks.dart';

@GenerateMocks([TvSeriesSearchNotifier])
void main() {
  late MockTvSeriesSearchNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockTvSeriesSearchNotifier();
  });

  Widget makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvSeriesSearchNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display progress bar when loading',
      (widgetTester) async {
    when(mockNotifier.state).thenReturn(RequestState.loading);

    final loadingWidget = find.byType(CircularProgressIndicator);

    await widgetTester
        .pumpWidget(makeTestableWidget(const SearchTvSeriesPage()));

    expect(loadingWidget, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (widgetTester) async {
    when(mockNotifier.state).thenReturn(RequestState.loaded);
    when(mockNotifier.searchResult).thenReturn(<TvSeries>[testTvSeries]);

    final listViewFinder = find.byType(ListView);

    await widgetTester
        .pumpWidget(makeTestableWidget(const SearchTvSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display error message when error',
      (widgetTester) async {
    when(mockNotifier.state).thenReturn(RequestState.error);
    when(mockNotifier.message).thenReturn('Error message');

    final emptyMessage = find.byKey(const Key('error_message'));

    await widgetTester
        .pumpWidget(makeTestableWidget(const SearchTvSeriesPage()));

    expect(emptyMessage, findsOneWidget);
  });

  testWidgets('Page should only display blank', (widgetTester) async {
    when(mockNotifier.state).thenReturn(RequestState.empty);
    when(mockNotifier.searchResult).thenReturn([]);

    final expandedFinder = find.byType(Expanded);

    await widgetTester
        .pumpWidget(makeTestableWidget(const SearchTvSeriesPage()));

    expect(expandedFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when query id typed',
      (widgetTester) async {
    when(mockNotifier.state).thenReturn(RequestState.loaded);
    when(mockNotifier.searchResult).thenReturn(<TvSeries>[testTvSeries]);

    final textFieldFinder = find.byKey(const Key('query_input'));
    final listViewFinder = find.byType(ListView);

    await widgetTester
        .pumpWidget(makeTestableWidget(const SearchTvSeriesPage()));
    await widgetTester.enterText(textFieldFinder, 'Star Wars');
    await widgetTester.testTextInput.receiveAction(TextInputAction.done);

    expect(find.text('Star Wars'), findsOneWidget);
    expect(listViewFinder, findsOneWidget);
  });
}
