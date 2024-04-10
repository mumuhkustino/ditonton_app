import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series/episode.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_series_episode.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetTvSeriesEpisode usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetTvSeriesEpisode(mockTvSeriesRepository);
  });

  const tId = 1;
  const tSeasonId = 1;
  final tEpisodeList = <Episode>[];

  test('should get list of episode of tv series from the repository', () async {
    // arrange
    when(mockTvSeriesRepository.getTvSeriesEpisode(tId, tSeasonId))
        .thenAnswer((_) async => Right(tEpisodeList));
    // act
    final result = await usecase.execute(tId, tSeasonId);
    // assert
    expect(result, Right(tEpisodeList));
  });
}
