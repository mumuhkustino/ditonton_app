import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects_movie.dart';
import 'now_playing_movies_page_test.mocks.dart';

@GenerateMocks([NowPlayingMoviesCubit])
void main() {
  late MockNowPlayingMoviesCubit mockCubit;

  setUp(() {
    mockCubit = MockNowPlayingMoviesCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<NowPlayingMoviesCubit>.value(
      value: mockCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('page should display progress bar when loading',
      (WidgetTester tester) async {
    when(mockCubit.stream)
        .thenAnswer((_) => Stream.value(NowPlayingMoviesLoading()));
    when(mockCubit.state).thenReturn(NowPlayingMoviesLoading());

    final progressFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(makeTestableWidget(const NowPlayingMoviesPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressFinder, findsOneWidget);
  });

  testWidgets('page should display when data is loaded',
      (WidgetTester tester) async {
    when(mockCubit.stream)
        .thenAnswer((_) => Stream.value(NowPlayingMoviesLoaded(testMovieList)));
    when(mockCubit.state).thenReturn(NowPlayingMoviesLoaded(testMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const NowPlayingMoviesPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockCubit.stream).thenAnswer((realInvocation) =>
        Stream.value(const NowPlayingMoviesError('Error Message')));
    when(mockCubit.state)
        .thenReturn(const NowPlayingMoviesError('Error Message'));

    final textFinder = find.byKey(const Key('error_message'));

    await tester.pumpWidget(makeTestableWidget(const NowPlayingMoviesPage()));

    expect(textFinder, findsOneWidget);
  });
}
