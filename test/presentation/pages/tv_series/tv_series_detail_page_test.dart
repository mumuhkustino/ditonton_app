import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/episode.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/presentation/pages/tv_series/tv_series_detail_page.dart';
import 'package:ditonton/presentation/provider/tv_series/tv_series_detail_notifier.dart';
import 'package:ditonton/presentation/provider/tv_series/tv_series_episode_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../../dummy_data/tv_series/dummy_objects_tv_series.dart';
import 'tv_series_detail_page_test.mocks.dart';

@GenerateMocks([TvSeriesDetailNotifier, TvSeriesEpisodeNotifier])
void main() {
  late MockTvSeriesDetailNotifier mockNotifier;
  late MockTvSeriesEpisodeNotifier mockEpisodeNotifier;

  setUp(() {
    mockNotifier = MockTvSeriesDetailNotifier();
    mockEpisodeNotifier = MockTvSeriesEpisodeNotifier();
  });

  Widget makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvSeriesDetailNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(
        home: ChangeNotifierProvider<TvSeriesEpisodeNotifier>.value(
          value: mockEpisodeNotifier,
          child: body,
        ),
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when tv series not added to watchlist',
      (widgetTester) async {
    when(mockNotifier.tvSeriesState).thenReturn(RequestState.loaded);
    when(mockNotifier.tvSeries).thenReturn(testTvSeriesDetailShort);
    when(mockNotifier.recommendationState).thenReturn(RequestState.loaded);
    when(mockNotifier.tvSeriesRecommendations)
        .thenReturn(<TvSeries>[testTvSeries]);
    when(mockEpisodeNotifier.tvSeriesState).thenReturn(RequestState.loaded);
    when(mockEpisodeNotifier.tvSeriesEpisode)
        .thenReturn(<Episode>[testTvSeriesEpisode]);
    when(mockNotifier.isAddedToWatchlist).thenReturn(false);

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await widgetTester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display check icon when tv series is added to watchlist',
      (widgetTester) async {
    when(mockNotifier.tvSeriesState).thenReturn(RequestState.loaded);
    when(mockNotifier.tvSeries).thenReturn(testTvSeriesDetailShort);
    when(mockNotifier.recommendationState).thenReturn(RequestState.loaded);
    when(mockNotifier.tvSeriesRecommendations)
        .thenReturn(<TvSeries>[testTvSeries]);
    when(mockEpisodeNotifier.tvSeriesState).thenReturn(RequestState.loaded);
    when(mockEpisodeNotifier.tvSeriesEpisode)
        .thenReturn(<Episode>[testTvSeriesEpisode]);
    when(mockNotifier.isAddedToWatchlist).thenReturn(true);

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await widgetTester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (widgetTester) async {
    when(mockNotifier.tvSeriesState).thenReturn(RequestState.loaded);
    when(mockNotifier.tvSeries).thenReturn(testTvSeriesDetail);
    when(mockNotifier.recommendationState).thenReturn(RequestState.loaded);
    when(mockNotifier.tvSeriesRecommendations)
        .thenReturn(<TvSeries>[testTvSeries]);
    when(mockEpisodeNotifier.tvSeriesState).thenReturn(RequestState.loaded);
    when(mockEpisodeNotifier.tvSeriesEpisode)
        .thenReturn(<Episode>[testTvSeriesEpisode]);
    when(mockNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockNotifier.watchlistMessage)
        .thenReturn('Added to Watchlist Tv Series');

    final watchlistButton = find.byType(ElevatedButton);

    await widgetTester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await widgetTester.tap(watchlistButton);
    await widgetTester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist Tv Series'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
      (widgetTester) async {
    when(mockNotifier.tvSeriesState).thenReturn(RequestState.loaded);
    when(mockNotifier.tvSeries).thenReturn(testTvSeriesDetail);
    when(mockNotifier.recommendationState).thenReturn(RequestState.loaded);
    when(mockNotifier.tvSeriesRecommendations)
        .thenReturn(<TvSeries>[testTvSeries]);
    when(mockEpisodeNotifier.tvSeriesState).thenReturn(RequestState.loaded);
    when(mockEpisodeNotifier.tvSeriesEpisode)
        .thenReturn(<Episode>[testTvSeriesEpisode]);
    when(mockNotifier.isAddedToWatchlist).thenReturn(false);
    when(mockNotifier.watchlistMessage).thenReturn('Failed');

    final watchlistButton = find.byType(ElevatedButton);

    await widgetTester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await widgetTester.tap(watchlistButton);
    await widgetTester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Failed'), findsOneWidget);
  });

  testWidgets('Page should display text with message when Error',
      (widgetTester) async {
    when(mockNotifier.tvSeriesState).thenReturn(RequestState.error);
    when(mockNotifier.message).thenReturn('Error message');

    final textFinder = find.byType(Text);

    await widgetTester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(textFinder, findsOneWidget);
  });

  testWidgets(
      'Page should display text with message when Error on recommendations',
      (widgetTester) async {
    when(mockNotifier.tvSeriesState).thenReturn(RequestState.loaded);
    when(mockNotifier.tvSeries).thenReturn(testTvSeriesDetail);
    when(mockNotifier.recommendationState).thenReturn(RequestState.error);
    when(mockNotifier.tvSeriesRecommendations).thenReturn(<TvSeries>[]);
    when(mockNotifier.message).thenReturn("Error Message");
    when(mockEpisodeNotifier.tvSeriesState).thenReturn(RequestState.error);
    when(mockEpisodeNotifier.message).thenReturn("Error Message");
    when(mockNotifier.isAddedToWatchlist).thenReturn(false);

    final errorFinder = find.byKey(const Key("error_message"));
    final errorEpisodeFinder = find.byKey(const Key("error_episode"));

    await widgetTester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(errorFinder, findsOneWidget);
    expect(errorEpisodeFinder, findsOneWidget);
  });

  testWidgets(
      'Page should only display container on recommendations and display text with message when Error on Episode',
      (widgetTester) async {
    when(mockNotifier.tvSeriesState).thenReturn(RequestState.loaded);
    when(mockNotifier.tvSeries).thenReturn(testTvSeriesDetailNoSeason);
    when(mockNotifier.recommendationState).thenReturn(RequestState.empty);
    when(mockNotifier.tvSeriesRecommendations).thenReturn(<TvSeries>[]);
    when(mockEpisodeNotifier.tvSeriesState).thenReturn(RequestState.error);
    when(mockEpisodeNotifier.message).thenReturn("Error Message");
    when(mockNotifier.isAddedToWatchlist).thenReturn(false);

    final containerFinder = find.byKey(const Key("error_recommendations"));

    await widgetTester
        .pumpWidget(makeTestableWidget(const TvSeriesDetailPage(id: 1)));

    expect(containerFinder, findsOneWidget);
  });
}
