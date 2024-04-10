import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/episode.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_series_episode.dart';
import 'package:ditonton/presentation/provider/tv_series/tv_series_episode_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tv_series_episode_notifier_test.mocks.dart';

@GenerateMocks([GetTvSeriesEpisode])
void main() {
  late TvSeriesEpisodeNotifier provider;
  late MockGetTvSeriesEpisode mockGetTvSeriesEpisode;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTvSeriesEpisode = MockGetTvSeriesEpisode();
    provider =
        TvSeriesEpisodeNotifier(getTvSeriesEpisode: mockGetTvSeriesEpisode)
          ..addListener(() {
            listenerCallCount += 1;
          });
  });

  const tId = 1;
  const tSeasonId = 1;
  const tTvSeriesEpisode = Episode(
    airDate: "airDate",
    episodeNumber: 1,
    id: 1,
    name: "name",
    overview: "overview",
    seasonNumber: 1,
    stillPath: "stillPath",
    voteAverage: 1.0,
    voteCount: 1,
  );
  final tTvSeriesEpisodeList = <Episode>[tTvSeriesEpisode];

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetTvSeriesEpisode.execute(tId, tSeasonId))
        .thenAnswer((_) async => Right(tTvSeriesEpisodeList));
    // act
    provider.fetchTvSeriesEpisode(tId, tSeasonId);
    // assert
    expect(provider.tvSeriesState, RequestState.loading);
    expect(listenerCallCount, 1);
  });

  test('should change tv series episode data when data is gotten successfully',
      () async {
    // arrange
    when(mockGetTvSeriesEpisode.execute(tId, tSeasonId))
        .thenAnswer((_) async => Right(tTvSeriesEpisodeList));
    // act
    await provider.fetchTvSeriesEpisode(tId, tSeasonId);
    // assert
    expect(provider.tvSeriesState, RequestState.loaded);
    expect(provider.tvSeriesEpisode, tTvSeriesEpisodeList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetTvSeriesEpisode.execute(tId, tSeasonId))
        .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
    // act
    await provider.fetchTvSeriesEpisode(tId, tSeasonId);
    // assert
    expect(provider.tvSeriesState, RequestState.error);
    expect(provider.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}
