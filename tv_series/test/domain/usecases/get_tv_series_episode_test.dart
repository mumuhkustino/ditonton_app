import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../helpers/test_helper.mocks.dart';

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
