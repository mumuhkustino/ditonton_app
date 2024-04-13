import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/presentation/pages/tv_series/on_the_air_tv_series_page.dart';
import 'package:ditonton/presentation/provider/tv_series/on_the_air_tv_series_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../../dummy_data/tv_series/dummy_objects_tv_series.dart';
import 'on_the_air_tv_series_page_test.mocks.dart';

@GenerateMocks([OnTheAirTvSeriesNotifier])
void main() {
  late MockOnTheAirTvSeriesNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockOnTheAirTvSeriesNotifier();
  });

  Widget makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<OnTheAirTvSeriesNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display progress bar when loading',
      (widgetTester) async {
    when(mockNotifier.state).thenReturn(RequestState.loading);

    final progressFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await widgetTester
        .pumpWidget(makeTestableWidget(const OnTheAirTvSeriesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressFinder, findsOneWidget);
  });

  testWidgets('Page should display when data is loaded', (widgetTester) async {
    when(mockNotifier.state).thenReturn(RequestState.loaded);
    when(mockNotifier.tvSeries).thenReturn(<TvSeries>[testTvSeries]);

    final listViewFinder = find.byType(ListView);

    await widgetTester
        .pumpWidget(makeTestableWidget(const OnTheAirTvSeriesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (widgetTester) async {
    when(mockNotifier.state).thenReturn(RequestState.error);
    when(mockNotifier.message).thenReturn('Error message');

    final textFinder = find.byKey(const Key('error_message'));

    await widgetTester
        .pumpWidget(makeTestableWidget(const OnTheAirTvSeriesPage()));

    expect(textFinder, findsOneWidget);
  });
}
