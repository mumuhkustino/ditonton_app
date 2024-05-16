import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchlist/watchlist.dart';

import '../../dummy_data/dummy_objects_tv_series.dart';
import 'watchlist_tv_series_page_test.mocks.dart';

@GenerateMocks([WatchlistTvSeriesCubit])
void main() {
  late MockWatchlistTvSeriesCubit mockCubit;

  setUp(() {
    mockCubit = MockWatchlistTvSeriesCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<WatchlistTvSeriesCubit>.value(
      value: mockCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('page should display center progress bar when loading',
      (widgetTester) async {
    when(mockCubit.stream)
        .thenAnswer((_) => Stream.value(WatchlistTvSeriesLoading()));
    when(mockCubit.state).thenReturn(WatchlistTvSeriesLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await widgetTester
        .pumpWidget(makeTestableWidget(const WatchlistTvSeriesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('page should display ListView when domain is loaded',
      (widgetTester) async {
    when(mockCubit.stream).thenAnswer(
        (_) => Stream.value(WatchlistTvSeriesLoaded(testTvSeriesList)));
    when(mockCubit.state).thenReturn(WatchlistTvSeriesLoaded(testTvSeriesList));

    final listViewFinder = find.byType(ListView);

    await widgetTester
        .pumpWidget(makeTestableWidget(const WatchlistTvSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('page should display text with message when Error',
      (widgetTester) async {
    when(mockCubit.stream).thenAnswer(
        (_) => Stream.value(WatchlistTvSeriesError('Error message')));
    when(mockCubit.state).thenReturn(WatchlistTvSeriesError('Error message'));

    final textFinder = find.byKey(const Key('error_message'));

    await widgetTester
        .pumpWidget(makeTestableWidget(const WatchlistTvSeriesPage()));

    expect(textFinder, findsOneWidget);
  });
}
