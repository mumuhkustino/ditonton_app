import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects_tv_series.dart';
import 'home_tv_series_page_test.mocks.dart';

@GenerateMocks([
  OnTheAirTvSeriesCubit,
  PopularTvSeriesCubit,
  TopRatedTvSeriesCubit,
])
void main() {
  late MockOnTheAirTvSeriesCubit mockOnTheAirTvSeriesCubit;
  late MockPopularTvSeriesCubit mockPopularTvSeriesCubit;
  late MockTopRatedTvSeriesCubit mockTopRatedTvSeriesCubit;

  setUp(() {
    mockOnTheAirTvSeriesCubit = MockOnTheAirTvSeriesCubit();
    mockPopularTvSeriesCubit = MockPopularTvSeriesCubit();
    mockTopRatedTvSeriesCubit = MockTopRatedTvSeriesCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<OnTheAirTvSeriesCubit>.value(
      value: mockOnTheAirTvSeriesCubit,
      child: BlocProvider<PopularTvSeriesCubit>.value(
        value: mockPopularTvSeriesCubit,
        child: BlocProvider<TopRatedTvSeriesCubit>.value(
          value: mockTopRatedTvSeriesCubit,
          child: MaterialApp(
            home: body,
          ),
        ),
      ),
    );
  }

  testWidgets('page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockOnTheAirTvSeriesCubit.stream)
        .thenAnswer((_) => Stream.value(OnTheAirTvSeriesLoading()));
    when(mockOnTheAirTvSeriesCubit.state).thenReturn(OnTheAirTvSeriesLoading());
    when(mockPopularTvSeriesCubit.stream)
        .thenAnswer((_) => Stream.value(PopularTvSeriesLoading()));
    when(mockPopularTvSeriesCubit.state).thenReturn(PopularTvSeriesLoading());
    when(mockTopRatedTvSeriesCubit.stream)
        .thenAnswer((_) => Stream.value(TopRatedTvSeriesLoading()));
    when(mockTopRatedTvSeriesCubit.state).thenReturn(TopRatedTvSeriesLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byKey(const Key('circular_progressbar'));

    await tester.pumpWidget(makeTestableWidget(const HomeTvSeriesPage()));

    expect(centerFinder, findsNWidgets(3));
    expect(progressBarFinder, findsNWidgets(3));
  });

  testWidgets('page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(mockOnTheAirTvSeriesCubit.stream).thenAnswer(
        (_) => Stream.value(OnTheAirTvSeriesLoaded(testTvSeriesList)));
    when(mockOnTheAirTvSeriesCubit.state)
        .thenReturn(OnTheAirTvSeriesLoaded(testTvSeriesList));
    when(mockPopularTvSeriesCubit.stream).thenAnswer(
        (_) => Stream.value(PopularTvSeriesLoaded(testTvSeriesList)));
    when(mockPopularTvSeriesCubit.state)
        .thenReturn(PopularTvSeriesLoaded(testTvSeriesList));
    when(mockTopRatedTvSeriesCubit.stream).thenAnswer(
        (_) => Stream.value(TopRatedTvSeriesLoaded(testTvSeriesList)));
    when(mockTopRatedTvSeriesCubit.state)
        .thenReturn(TopRatedTvSeriesLoaded(testTvSeriesList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const HomeTvSeriesPage()));

    expect(listViewFinder, findsNWidgets(3));
  });

  testWidgets('page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockOnTheAirTvSeriesCubit.stream)
        .thenAnswer((_) => Stream.value(const OnTheAirTvSeriesError('Failed')));
    when(mockOnTheAirTvSeriesCubit.state)
        .thenReturn(const OnTheAirTvSeriesError('Failed'));
    when(mockPopularTvSeriesCubit.stream)
        .thenAnswer((_) => Stream.value(const PopularTvSeriesError('Failed')));
    when(mockPopularTvSeriesCubit.state)
        .thenReturn(const PopularTvSeriesError('Failed'));
    when(mockTopRatedTvSeriesCubit.stream)
        .thenAnswer((_) => Stream.value(const TopRatedTvSeriesError('Failed')));
    when(mockTopRatedTvSeriesCubit.state)
        .thenReturn(const TopRatedTvSeriesError('Failed'));

    final textFinder = find.text('Failed');

    await tester.pumpWidget(makeTestableWidget(const HomeTvSeriesPage()));

    expect(textFinder, findsNWidgets(3));
  });
}
