import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchlist/watchlist.dart';

import 'watchlist_page_test.mocks.dart';

@GenerateMocks([
  WatchlistMovieCubit,
  WatchlistTvSeriesCubit,
])
void main() {
  late MockWatchlistMovieCubit mockWatchlistMovieCubit;
  late MockWatchlistTvSeriesCubit mockWatchlistTvSeriesCubit;

  setUp(() {
    mockWatchlistMovieCubit = MockWatchlistMovieCubit();
    mockWatchlistTvSeriesCubit = MockWatchlistTvSeriesCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<WatchlistMovieCubit>.value(
      value: mockWatchlistMovieCubit,
      child: BlocProvider<WatchlistTvSeriesCubit>.value(
        value: mockWatchlistTvSeriesCubit,
        child: MaterialApp(
          home: body,
        ),
      ),
    );
  }

  testWidgets('page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockWatchlistMovieCubit.stream)
        .thenAnswer((_) => Stream.value(WatchlistMovieLoading()));
    when(mockWatchlistMovieCubit.state).thenReturn(WatchlistMovieLoading());
    when(mockWatchlistTvSeriesCubit.stream)
        .thenAnswer((_) => Stream.value(WatchlistTvSeriesLoading()));
    when(mockWatchlistTvSeriesCubit.state)
        .thenReturn(WatchlistTvSeriesLoading());

    final tabFinder = find.byType(TabBar);
    final tabBarViewFinder = find.byType(TabBarView);

    await tester.pumpWidget(makeTestableWidget(const WatchlistPage()));

    expect(tabFinder, findsWidgets);
    expect(tabBarViewFinder, findsWidgets);
  });
}
