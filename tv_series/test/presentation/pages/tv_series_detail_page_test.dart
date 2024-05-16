import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';
import 'package:watchlist/presentation/cubit/watchlist_tv_series_cubit.dart';
import 'package:watchlist/watchlist.dart';

import '../../dummy_data/dummy_objects_tv_series.dart';
import 'tv_series_detail_page_test.mocks.dart';

@GenerateMocks([
  TvSeriesDetailCubit,
  WatchlistTvSeriesCubit,
  TvSeriesEpisodeCubit,
])
void main() {
  late MockTvSeriesDetailCubit mockDetail;
  late MockWatchlistTvSeriesCubit mockWatchlist;
  late MockTvSeriesEpisodeCubit mockEpisode;

  setUp(() {
    mockDetail = MockTvSeriesDetailCubit();
    mockWatchlist = MockWatchlistTvSeriesCubit();
    mockEpisode = MockTvSeriesEpisodeCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<TvSeriesDetailCubit>.value(
      value: mockDetail,
      child: BlocProvider<WatchlistTvSeriesCubit>.value(
        value: mockWatchlist,
        child: BlocProvider<TvSeriesEpisodeCubit>.value(
          value: mockEpisode,
          child: MaterialApp(
            home: body,
          ),
        ),
      ),
    );
  }

  testWidgets(
    'page should display progress bar when movie and recommendation loading',
    (WidgetTester tester) async {
      when(mockDetail.stream)
          .thenAnswer((_) => Stream.value(TvSeriesDetailLoading()));
      when(mockDetail.state).thenReturn(TvSeriesDetailLoading());
      when(mockWatchlist.stream)
          .thenAnswer((_) => Stream.value(WatchlistTvSeriesInitial()));
      when(mockWatchlist.state).thenReturn(WatchlistTvSeriesInitial());

      final loadingFinder = find.byType(CircularProgressIndicator);

      await tester
          .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));
      expect(loadingFinder, findsOneWidget);
    },
  );

  testWidgets(
    'page should display error message when get data is error',
    (WidgetTester tester) async {
      when(mockDetail.stream).thenAnswer(
          (_) => Stream.value(const TvSeriesDetailError('Error Message')));
      when(mockDetail.state)
          .thenReturn(const TvSeriesDetailError('Error Message'));
      when(mockWatchlist.stream)
          .thenAnswer((_) => Stream.value(WatchlistTvSeriesInitial()));
      when(mockWatchlist.state).thenReturn(WatchlistTvSeriesInitial());

      final errorFinder = find.text('Error Message');

      await tester
          .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));
      expect(errorFinder, findsOneWidget);
    },
  );

  testWidgets(
    'page should display error message when get data is error on recommendations',
        (WidgetTester tester) async {
      when(mockDetail.stream).thenAnswer(
              (_) => Stream.value(const TvSeriesRecommendationError(testTvSeriesDetail, [], 'Error Message')));
      when(mockDetail.state)
          .thenReturn(const TvSeriesRecommendationError(testTvSeriesDetail, [], 'Error Message'));
      when(mockEpisode.stream).thenAnswer(
              (_) => Stream.value(const TvSeriesEpisodeLoaded([testTvSeriesEpisode])));
      when(mockEpisode.state)
          .thenReturn(const TvSeriesEpisodeLoaded([testTvSeriesEpisode]));
      when(mockWatchlist.stream)
          .thenAnswer((_) => Stream.value(WatchlistTvSeriesStatus(false)));
      when(mockWatchlist.state).thenReturn(WatchlistTvSeriesStatus(false));

      final errorFinder = find.text('Error Message');

      await tester
          .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));
      expect(errorFinder, findsOneWidget);
    },
  );

  testWidgets(
    "watchlist button should display add icon when tv series not added to watchlist",
    (WidgetTester tester) async {
      when(mockDetail.stream).thenAnswer((_) => Stream.value(
          TvSeriesDetailLoaded(testTvSeriesDetailShort, testTvSeriesList)));
      when(mockDetail.state).thenReturn(
          TvSeriesDetailLoaded(testTvSeriesDetailShort, testTvSeriesList));
      when(mockWatchlist.stream)
          .thenAnswer((_) => Stream.value(WatchlistTvSeriesStatus(false)));
      when(mockWatchlist.state).thenReturn(WatchlistTvSeriesStatus(false));
      when(mockEpisode.stream).thenAnswer((_) =>
          Stream.value(const TvSeriesEpisodeLoaded([testTvSeriesEpisode])));
      when(mockEpisode.state)
          .thenReturn(const TvSeriesEpisodeLoaded([testTvSeriesEpisode]));

      final watchlistButtonIcon = find.byIcon(Icons.add);

      await tester
          .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

      expect(watchlistButtonIcon, findsOneWidget);
    },
  );

  testWidgets(
    "watchlist button should display check icon when tv series added to watchlist",
    (WidgetTester tester) async {
      when(mockDetail.stream).thenAnswer((_) => Stream.value(
          TvSeriesDetailLoaded(testTvSeriesDetail, testTvSeriesList)));
      when(mockDetail.state).thenReturn(
          TvSeriesDetailLoaded(testTvSeriesDetail, testTvSeriesList));
      when(mockWatchlist.stream)
          .thenAnswer((_) => Stream.value(WatchlistTvSeriesStatus(true)));
      when(mockWatchlist.state).thenReturn(WatchlistTvSeriesStatus(true));
      when(mockEpisode.stream).thenAnswer((_) =>
          Stream.value(const TvSeriesEpisodeLoaded([testTvSeriesEpisode])));
      when(mockEpisode.state)
          .thenReturn(const TvSeriesEpisodeLoaded([testTvSeriesEpisode]));

      final watchlistButtonIcon = find.byIcon(Icons.check);

      await tester
          .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

      expect(watchlistButtonIcon, findsOneWidget);
    },
  );

  testWidgets(
      'watchlist button should display snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(mockDetail.stream).thenAnswer((_) => Stream.value(
        TvSeriesDetailLoaded(testTvSeriesDetailShort, testTvSeriesList)));
    when(mockDetail.state).thenReturn(
        TvSeriesDetailLoaded(testTvSeriesDetailShort, testTvSeriesList));
    when(mockWatchlist.stream)
        .thenAnswer((_) => Stream.value(WatchlistTvSeriesStatus(false)));
    when(mockWatchlist.state).thenReturn(WatchlistTvSeriesStatus(false));
    when(mockWatchlist.stream).thenAnswer(
        (_) => Stream.value(WatchlistTvSeriesMessage('Added to Watchlist')));
    when(mockWatchlist.state)
        .thenReturn(WatchlistTvSeriesMessage('Added to Watchlist'));

    await tester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'watchlist button should display snackbar when removed from watchlist',
      (WidgetTester tester) async {
    when(mockDetail.stream).thenAnswer((_) => Stream.value(
        TvSeriesDetailLoaded(testTvSeriesDetailShort, testTvSeriesList)));
    when(mockDetail.state).thenReturn(
        TvSeriesDetailLoaded(testTvSeriesDetailShort, testTvSeriesList));
    when(mockWatchlist.stream)
        .thenAnswer((_) => Stream.value(WatchlistTvSeriesStatus(true)));
    when(mockWatchlist.state).thenReturn(WatchlistTvSeriesStatus(true));
    when(mockWatchlist.stream).thenAnswer((_) =>
        Stream.value(WatchlistTvSeriesMessage('Removed from Watchlist')));
    when(mockWatchlist.state)
        .thenReturn(WatchlistTvSeriesMessage('Removed from Watchlist'));

    await tester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Removed from Watchlist'), findsOneWidget);
  });

  testWidgets(
      'watchlist button should display AlertDialog when add to watchlist failed',
      (WidgetTester tester) async {
    when(mockDetail.stream).thenAnswer((_) => Stream.value(
        TvSeriesDetailLoaded(testTvSeriesDetailShort, testTvSeriesList)));
    when(mockDetail.state).thenReturn(
        TvSeriesDetailLoaded(testTvSeriesDetailShort, testTvSeriesList));
    when(mockWatchlist.stream)
        .thenAnswer((_) => Stream.value(WatchlistTvSeriesStatus(false)));
    when(mockWatchlist.state).thenReturn(WatchlistTvSeriesStatus(false));
    when(mockWatchlist.stream)
        .thenAnswer((_) => Stream.value(WatchlistTvSeriesMessage('Failed')));
    when(mockWatchlist.state).thenReturn(WatchlistTvSeriesMessage('Failed'));

    await tester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });

  testWidgets(
      'watchlist button should display AlertDialog when removed from watchlist failed',
      (WidgetTester tester) async {
    when(mockDetail.stream).thenAnswer((_) => Stream.value(
        TvSeriesDetailLoaded(testTvSeriesDetailShort, testTvSeriesList)));
    when(mockDetail.state).thenReturn(
        TvSeriesDetailLoaded(testTvSeriesDetailShort, testTvSeriesList));
    when(mockWatchlist.stream)
        .thenAnswer((_) => Stream.value(WatchlistTvSeriesStatus(true)));
    when(mockWatchlist.state).thenReturn(WatchlistTvSeriesStatus(true));
    when(mockWatchlist.stream)
        .thenAnswer((_) => Stream.value(WatchlistTvSeriesError('Failed')));
    when(mockWatchlist.state).thenReturn(WatchlistTvSeriesError('Failed'));

    await tester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });

  testWidgets(
    "page should display Episode Card List Widget",
    (WidgetTester tester) async {
      when(mockDetail.stream).thenAnswer((_) => Stream.value(
          TvSeriesDetailLoaded(testTvSeriesDetailShort, testTvSeriesList)));
      when(mockDetail.state).thenReturn(
          TvSeriesDetailLoaded(testTvSeriesDetailShort, testTvSeriesList));
      when(mockWatchlist.stream)
          .thenAnswer((_) => Stream.value(WatchlistTvSeriesStatus(false)));
      when(mockWatchlist.state).thenReturn(WatchlistTvSeriesStatus(false));
      when(mockEpisode.stream).thenAnswer((_) =>
          Stream.value(const TvSeriesEpisodeLoaded([testTvSeriesEpisode])));
      when(mockEpisode.state)
          .thenReturn(const TvSeriesEpisodeLoaded([testTvSeriesEpisode]));

      final seasonTabBar = find.byType(TabBarView);
      final detailEpisodeCard = find.byType(EpisodeCardList);

      await tester
          .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

      expect(seasonTabBar, findsOneWidget);
      await tester.pump();

      expect(detailEpisodeCard, findsOneWidget);
    },
  );
}
