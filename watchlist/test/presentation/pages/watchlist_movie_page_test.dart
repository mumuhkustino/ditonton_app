import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchlist/watchlist.dart';

import '../../dummy_data/dummy_objects_movie.dart';
import 'watchlist_movie_page_test.mocks.dart';

@GenerateMocks([WatchlistMovieCubit])
void main() {
  late MockWatchlistMovieCubit mockCubit;

  setUp(() {
    mockCubit = MockWatchlistMovieCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<WatchlistMovieCubit>.value(
      value: mockCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('page should display center progress bar when loading',
      (widgetTester) async {
    when(mockCubit.stream)
        .thenAnswer((_) => Stream.value(WatchlistMovieLoading()));
    when(mockCubit.state).thenReturn(WatchlistMovieLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await widgetTester
        .pumpWidget(makeTestableWidget(const WatchlistMoviePage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('page should display ListView when domain is loaded',
      (widgetTester) async {
    when(mockCubit.stream)
        .thenAnswer((_) => Stream.value(WatchlistMovieLoaded(testMovieList)));
    when(mockCubit.state).thenReturn(WatchlistMovieLoaded(testMovieList));

    final listViewFinder = find.byType(ListView);

    await widgetTester
        .pumpWidget(makeTestableWidget(const WatchlistMoviePage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('page should display text with message when Error',
      (widgetTester) async {
    when(mockCubit.stream)
        .thenAnswer((_) => Stream.value(WatchlistMovieError('Error message')));
    when(mockCubit.state).thenReturn(WatchlistMovieError('Error message'));

    final textFinder = find.byKey(const Key('error_message'));

    await widgetTester
        .pumpWidget(makeTestableWidget(const WatchlistMoviePage()));

    expect(textFinder, findsOneWidget);
  });
}
