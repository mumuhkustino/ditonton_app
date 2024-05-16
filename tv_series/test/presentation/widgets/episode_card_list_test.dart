import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects_tv_series.dart';
import 'episode_card_list_test.mocks.dart';

@GenerateMocks([TvSeriesEpisodeCubit])
void main() {
  late MockTvSeriesEpisodeCubit mockCubit;

  setUp(() {
    mockCubit = MockTvSeriesEpisodeCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<TvSeriesEpisodeCubit>.value(
      value: mockCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
    "page should display message when data is empty",
    (WidgetTester tester) async {
      when(mockCubit.stream)
          .thenAnswer((_) => Stream.value(TvSeriesEpisodeInitial()));
      when(mockCubit.state).thenReturn(TvSeriesEpisodeInitial());

      final messageFinder = find.byKey(const Key('empty_message'));

      await tester.pumpWidget(
          makeTestableWidget(const EpisodeCardList(id: 1, seasonId: 1)));

      expect(messageFinder, findsOneWidget);
    },
  );

  testWidgets(
    "page should display progress bar when loading",
    (WidgetTester tester) async {
      when(mockCubit.stream)
          .thenAnswer((_) => Stream.value(TvSeriesEpisodeLoading()));
      when(mockCubit.state).thenReturn(TvSeriesEpisodeLoading());

      final progressBarFinder = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(
          makeTestableWidget(const EpisodeCardList(id: 1, seasonId: 1)));

      expect(progressBarFinder, findsOneWidget);
    },
  );

  testWidgets(
    "page should display episode list when data is loaded",
    (WidgetTester tester) async {
      when(mockCubit.stream).thenAnswer((_) =>
          Stream.value(const TvSeriesEpisodeLoaded([testTvSeriesEpisode])));
      when(mockCubit.state)
          .thenReturn(const TvSeriesEpisodeLoaded([testTvSeriesEpisode]));

      final listFinder = find.byKey(const Key('episode_list'));

      await tester.pumpWidget(
          makeTestableWidget(const EpisodeCardList(id: 1, seasonId: 1)));

      expect(listFinder, findsOneWidget);
    },
  );

  testWidgets('page should display error message when Error',
      (WidgetTester tester) async {
    when(mockCubit.stream).thenAnswer(
        (_) => Stream.value(const TvSeriesEpisodeError('Error Episode')));
    when(mockCubit.state)
        .thenReturn(const TvSeriesEpisodeError('Error Episode'));

    final textWidget = find.byKey(const Key('error_episode'));

    await tester.pumpWidget(makeTestableWidget(const EpisodeCardList(
      id: 1,
      seasonId: 1,
    )));

    expect(textWidget, findsOneWidget);
  });
}
