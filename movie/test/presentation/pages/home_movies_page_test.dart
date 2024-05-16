import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects_movie.dart';
import 'home_movies_page_test.mocks.dart';

@GenerateMocks([
  NowPlayingMoviesCubit,
  PopularMoviesCubit,
  TopRatedMoviesCubit,
])
void main() {
  late MockNowPlayingMoviesCubit mockNowPlayingMoviesCubit;
  late MockPopularMoviesCubit mockPopularMoviesCubit;
  late MockTopRatedMoviesCubit mockTopRatedMoviesCubit;

  setUp(() {
    mockNowPlayingMoviesCubit = MockNowPlayingMoviesCubit();
    mockPopularMoviesCubit = MockPopularMoviesCubit();
    mockTopRatedMoviesCubit = MockTopRatedMoviesCubit();
  });

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<NowPlayingMoviesCubit>.value(
      value: mockNowPlayingMoviesCubit,
      child: BlocProvider<PopularMoviesCubit>.value(
        value: mockPopularMoviesCubit,
        child: BlocProvider<TopRatedMoviesCubit>.value(
          value: mockTopRatedMoviesCubit,
          child: MaterialApp(
            home: body,
          ),
        ),
      ),
    );
  }

  testWidgets('page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(mockNowPlayingMoviesCubit.stream)
        .thenAnswer((_) => Stream.value(NowPlayingMoviesLoading()));
    when(mockNowPlayingMoviesCubit.state).thenReturn(NowPlayingMoviesLoading());
    when(mockPopularMoviesCubit.stream)
        .thenAnswer((_) => Stream.value(PopularMoviesLoading()));
    when(mockPopularMoviesCubit.state).thenReturn(PopularMoviesLoading());
    when(mockTopRatedMoviesCubit.stream)
        .thenAnswer((_) => Stream.value(TopRatedMoviesLoading()));
    when(mockTopRatedMoviesCubit.state).thenReturn(TopRatedMoviesLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byKey(const Key('circular_progress_bar'));

    await tester.pumpWidget(makeTestableWidget(const HomeMoviesPage()));

    expect(centerFinder, findsNWidgets(3));
    expect(progressBarFinder, findsNWidgets(3));
  });

  testWidgets('page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(mockNowPlayingMoviesCubit.stream)
        .thenAnswer((_) => Stream.value(NowPlayingMoviesLoaded(testMovieList)));
    when(mockNowPlayingMoviesCubit.state)
        .thenReturn(NowPlayingMoviesLoaded(testMovieList));
    when(mockPopularMoviesCubit.stream)
        .thenAnswer((_) => Stream.value(PopularMoviesLoaded(testMovieList)));
    when(mockPopularMoviesCubit.state)
        .thenReturn(PopularMoviesLoaded(testMovieList));
    when(mockTopRatedMoviesCubit.stream)
        .thenAnswer((_) => Stream.value(TopRatedMoviesLoaded(testMovieList)));
    when(mockTopRatedMoviesCubit.state)
        .thenReturn(TopRatedMoviesLoaded(testMovieList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(makeTestableWidget(const HomeMoviesPage()));

    expect(listViewFinder, findsNWidgets(3));
  });

  testWidgets('page should display text with message when Error',
      (WidgetTester tester) async {
    when(mockNowPlayingMoviesCubit.stream)
        .thenAnswer((_) => Stream.value(const NowPlayingMoviesError('Failed')));
    when(mockNowPlayingMoviesCubit.state)
        .thenReturn(const NowPlayingMoviesError('Failed'));
    when(mockPopularMoviesCubit.stream)
        .thenAnswer((_) => Stream.value(const PopularMoviesError('Failed')));
    when(mockPopularMoviesCubit.state)
        .thenReturn(const PopularMoviesError('Failed'));
    when(mockTopRatedMoviesCubit.stream)
        .thenAnswer((_) => Stream.value(const TopRatedMoviesError('Failed')));
    when(mockTopRatedMoviesCubit.state)
        .thenReturn(const TopRatedMoviesError('Failed'));

    final textFinder = find.text('Failed');

    await tester.pumpWidget(makeTestableWidget(const HomeMoviesPage()));

    expect(textFinder, findsNWidgets(3));
  });
}
