import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects_tv_series.dart';
import 'on_the_air_tv_series_page_test.mocks.dart';

@GenerateMocks([OnTheAirTvSeriesCubit])
void main() {
  late MockOnTheAirTvSeriesCubit mockCubit;

  setUp(() {
    mockCubit = MockOnTheAirTvSeriesCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<OnTheAirTvSeriesCubit>.value(
      value: mockCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockCubit.stream)
        .thenAnswer((_) => Stream.value(OnTheAirTvSeriesLoading()));
    when(mockCubit.state).thenReturn(OnTheAirTvSeriesLoading());

    final loadingWidget = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(makeTestableWidget(const OnTheAirTvSeriesPage()));

    expect(centerFinder, findsOneWidget);
    expect(loadingWidget, findsOneWidget);
  });

  testWidgets('page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(mockCubit.stream).thenAnswer(
        (_) => Stream.value(OnTheAirTvSeriesLoaded(testTvSeriesList)));
    when(mockCubit.state).thenReturn(OnTheAirTvSeriesLoaded(testTvSeriesList));

    final listViewWidget = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const OnTheAirTvSeriesPage()));

    expect(listViewWidget, findsOneWidget);
  });

  testWidgets('page should display error message when Error',
      (WidgetTester tester) async {
    when(mockCubit.stream).thenAnswer(
        (_) => Stream.value(const OnTheAirTvSeriesError('Error Message')));
    when(mockCubit.state)
        .thenReturn(const OnTheAirTvSeriesError('Error Message'));

    final textWidget = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const OnTheAirTvSeriesPage()));

    expect(textWidget, findsOneWidget);
  });
}
