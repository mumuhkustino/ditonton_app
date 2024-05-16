import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search/search.dart';
import 'package:tv_series/tv_series.dart';

import 'tv_series_search_bloc_test.mocks.dart';

@GenerateMocks([SearchTvSeries])
void main() {
  late TvSeriesSearchBloc tvSeriesSearchBloc;
  late MockSearchTvSeries mockSearchTvSeries;

  setUp(() {
    mockSearchTvSeries = MockSearchTvSeries();
    tvSeriesSearchBloc = TvSeriesSearchBloc(mockSearchTvSeries);
  });

  const tTvSeriesModel = TvSeries(
    adult: false,
    backdropPath: '/xs2v0K7iKAuR4YtKOw7TEcDIX63.jpg',
    genreIds: [16, 10759, 10765],
    id: 105971,
    originCountry: ["US"],
    originalLanguage: "en",
    originalName: "Star Wars: The Bad Batch",
    overview:
        "The 'Bad Batch' of elite and experimental clones make their way through an ever-changing galaxy in the immediate aftermath of the Clone Wars.",
    popularity: 531.528,
    posterPath: "/5mHus672nuinyaE0FtqvD0AddcY.jpg",
    firstAirDate: "2021-05-04",
    name: "Star Wars: The Bad Batch",
    voteAverage: 8.247,
    voteCount: 881,
  );

  final tTvSeriesList = <TvSeries>[tTvSeriesModel];
  const tQuery = 'star wars';

  test('initial state should be empty', () {
    expect(tvSeriesSearchBloc.state, TvSeriesSearchEmpty());
  });

  blocTest(
    'should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockSearchTvSeries.execute(tQuery))
          .thenAnswer((_) async => Right(tTvSeriesList));
      return tvSeriesSearchBloc;
    },
    act: (bloc) => bloc.add(const OnQueryTvSeriesChanged(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      TvSeriesSearchLoading(),
      TvSeriesSearchHasData(tTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockSearchTvSeries.execute(tQuery));
    },
  );

  blocTest(
    'should emit [Loading, Error] when get search is unsuccessful',
    build: () {
      when(mockSearchTvSeries.execute(tQuery))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      return tvSeriesSearchBloc;
    },
    act: (bloc) => bloc.add(const OnQueryTvSeriesChanged(tQuery)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      TvSeriesSearchLoading(),
      const TvSeriesSearchError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockSearchTvSeries.execute(tQuery));
    },
  );
}
