import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';
import 'package:watchlist/presentation/cubit/watchlist_movie_cubit.dart';
import 'package:watchlist/watchlist.dart';

import '../../dummy_data/dummy_objects_movie.dart';
import 'movie_detail_page_test.mocks.dart';

@GenerateMocks([
  MovieDetailCubit,
  WatchlistMovieCubit,
])
void main() {
  late MockMovieDetailCubit mockMovieDetailCubit;
  late MockWatchlistMovieCubit mockWatchlistMovieCubit;

  setUp(() {
    mockMovieDetailCubit = MockMovieDetailCubit();
    mockWatchlistMovieCubit = MockWatchlistMovieCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<MovieDetailCubit>.value(
      value: mockMovieDetailCubit,
      child: BlocProvider<WatchlistMovieCubit>.value(
        value: mockWatchlistMovieCubit,
        child: MaterialApp(
          home: body,
        ),
      ),
    );
  }

  testWidgets(
    'page should display progress bar when movie and recommendation loading',
    (WidgetTester tester) async {
      when(mockMovieDetailCubit.stream)
          .thenAnswer((_) => Stream.value(MovieDetailLoading()));
      when(mockMovieDetailCubit.state).thenReturn(MovieDetailLoading());
      when(mockWatchlistMovieCubit.stream)
          .thenAnswer((_) => Stream.value(WatchlistMovieStatus(false)));
      when(mockWatchlistMovieCubit.state)
          .thenReturn(WatchlistMovieStatus(false));

      final loadingFinder = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));
      expect(loadingFinder, findsOneWidget);
    },
  );

  testWidgets(
    'page should display text with message when Error',
    (WidgetTester tester) async {
      when(mockMovieDetailCubit.stream).thenAnswer(
          (_) => Stream.value(const MovieDetailError('Error Message')));
      when(mockMovieDetailCubit.state)
          .thenReturn(const MovieDetailError('Error Message'));
      when(mockWatchlistMovieCubit.stream)
          .thenAnswer((_) => Stream.value(WatchlistMovieStatus(false)));
      when(mockWatchlistMovieCubit.state)
          .thenReturn(WatchlistMovieStatus(false));

      final errorFinder = find.text('Error Message');

      await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));
      expect(errorFinder, findsOneWidget);
    },
  );

  testWidgets(
    'page should display text with message when Error on recommendations',
    (WidgetTester tester) async {
      when(mockMovieDetailCubit.stream).thenAnswer(
          (_) => Stream.value(const MovieRecommendationError(testMovieDetail, [], 'Error Message')));
      when(mockMovieDetailCubit.state)
          .thenReturn(const MovieRecommendationError(testMovieDetail, [], 'Error Message'));
      when(mockWatchlistMovieCubit.stream)
          .thenAnswer((_) => Stream.value(WatchlistMovieStatus(false)));
      when(mockWatchlistMovieCubit.state)
          .thenReturn(WatchlistMovieStatus(false));

      final errorFinder = find.text('Error Message');

      await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));
      expect(errorFinder, findsOneWidget);
    },
  );

  testWidgets(
      'watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(mockMovieDetailCubit.stream).thenAnswer((_) =>
        Stream.value(MovieDetailLoaded(testMovieDetailShort, testMovieList)));
    when(mockMovieDetailCubit.state)
        .thenReturn(MovieDetailLoaded(testMovieDetailShort, testMovieList));
    when(mockWatchlistMovieCubit.stream)
        .thenAnswer((_) => Stream.value(WatchlistMovieStatus(false)));
    when(mockWatchlistMovieCubit.state).thenReturn(WatchlistMovieStatus(false));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'watchlist button should display check icon when movie is added to watchlist',
      (WidgetTester tester) async {
    when(mockMovieDetailCubit.stream).thenAnswer((_) =>
        Stream.value(MovieDetailLoaded(testMovieDetail, testMovieList)));
    when(mockMovieDetailCubit.state)
        .thenReturn(MovieDetailLoaded(testMovieDetail, testMovieList));
    when(mockWatchlistMovieCubit.stream)
        .thenAnswer((_) => Stream.value(WatchlistMovieStatus(true)));
    when(mockWatchlistMovieCubit.state).thenReturn(WatchlistMovieStatus(true));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'watchlist button should display SnackBar when added to watchlist',
      (WidgetTester tester) async {
    when(mockMovieDetailCubit.stream).thenAnswer(
        (_) => Stream.value(MovieDetailLoaded(testMovieDetail, testMovieList)));
    when(mockMovieDetailCubit.state)
        .thenReturn(MovieDetailLoaded(testMovieDetail, testMovieList));
    when(mockWatchlistMovieCubit.stream)
        .thenAnswer((_) => Stream.value(WatchlistMovieStatus(false)));
    when(mockWatchlistMovieCubit.state).thenReturn(WatchlistMovieStatus(false));
    when(mockWatchlistMovieCubit.stream).thenAnswer(
        (_) => Stream.value(WatchlistMovieMessage('Added to Watchlist')));
    when(mockWatchlistMovieCubit.state)
        .thenReturn(WatchlistMovieMessage('Added to Watchlist'));

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'watchlist button should display SnackBar when removed to watchlist',
      (WidgetTester tester) async {
    when(mockMovieDetailCubit.stream).thenAnswer(
        (_) => Stream.value(MovieDetailLoaded(testMovieDetail, testMovieList)));
    when(mockMovieDetailCubit.state)
        .thenReturn(MovieDetailLoaded(testMovieDetail, testMovieList));
    when(mockWatchlistMovieCubit.stream)
        .thenAnswer((_) => Stream.value(WatchlistMovieStatus(true)));
    when(mockWatchlistMovieCubit.state).thenReturn(WatchlistMovieStatus(true));
    when(mockWatchlistMovieCubit.stream).thenAnswer(
        (_) => Stream.value(WatchlistMovieMessage('Removed from Watchlist')));
    when(mockWatchlistMovieCubit.state)
        .thenReturn(WatchlistMovieMessage('Removed from Watchlist'));

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Removed from Watchlist'), findsOneWidget);
  });

  testWidgets(
      'watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    when(mockWatchlistMovieCubit.stream)
        .thenAnswer((_) => Stream.value(WatchlistMovieStatus(false)));
    when(mockWatchlistMovieCubit.state).thenReturn(WatchlistMovieStatus(false));
    when(mockMovieDetailCubit.stream).thenAnswer(
        (_) => Stream.value(MovieDetailLoaded(testMovieDetail, testMovieList)));
    when(mockMovieDetailCubit.state)
        .thenReturn(MovieDetailLoaded(testMovieDetail, testMovieList));
    when(mockWatchlistMovieCubit.stream)
        .thenAnswer((_) => Stream.value(WatchlistMovieMessage('Failed')));
    when(mockWatchlistMovieCubit.state)
        .thenReturn(WatchlistMovieMessage('Failed'));

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });

  testWidgets(
      'watchlist button should display AlertDialog when remove from watchlist failed',
      (WidgetTester tester) async {
    when(mockWatchlistMovieCubit.stream)
        .thenAnswer((_) => Stream.value(WatchlistMovieStatus(true)));
    when(mockWatchlistMovieCubit.state).thenReturn(WatchlistMovieStatus(true));
    when(mockMovieDetailCubit.stream).thenAnswer(
        (_) => Stream.value(MovieDetailLoaded(testMovieDetail, testMovieList)));
    when(mockMovieDetailCubit.state)
        .thenReturn(MovieDetailLoaded(testMovieDetail, testMovieList));
    when(mockWatchlistMovieCubit.stream)
        .thenAnswer((_) => Stream.value(WatchlistMovieError('Failed')));
    when(mockWatchlistMovieCubit.state)
        .thenReturn(WatchlistMovieError('Failed'));

    await tester.pumpWidget(makeTestableWidget(const MovieDetailPage(id: 1)));
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });
}
