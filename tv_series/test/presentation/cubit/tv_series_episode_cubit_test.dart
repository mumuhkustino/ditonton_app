import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects_tv_series.dart';
import 'tv_series_episode_cubit_test.mocks.dart';

@GenerateMocks([GetTvSeriesEpisode])
void main() {
  late TvSeriesEpisodeCubit cubit;
  late MockGetTvSeriesEpisode mockGetTvSeriesEpisode;

  setUp(() {
    mockGetTvSeriesEpisode = MockGetTvSeriesEpisode();
    cubit = TvSeriesEpisodeCubit(
      tvSeriesEpisode: mockGetTvSeriesEpisode,
    );
  });

  group('Get Episode Tv Series', () {
    blocTest<TvSeriesEpisodeCubit, TvSeriesEpisodeState>(
      'should get data from the usecase',
      build: () {
        when(mockGetTvSeriesEpisode.execute(1, 1))
            .thenAnswer((_) async => const Right(<Episode>[]));
        return cubit;
      },
      act: (cubit) => cubit.fetchEpisodeTv(1, 1),
      verify: (cubit) => mockGetTvSeriesEpisode.execute(1, 1),
    );
    blocTest<TvSeriesEpisodeCubit, TvSeriesEpisodeState>(
      'should emit [Loading, Loaded] when data is gotten successfuly',
      build: () {
        when(mockGetTvSeriesEpisode.execute(1, 1))
            .thenAnswer((_) async => const Right([testTvSeriesEpisode]));

        return cubit;
      },
      act: (cubit) => cubit.fetchEpisodeTv(1, 1),
      expect: () => [
        TvSeriesEpisodeLoading(),
        const TvSeriesEpisodeLoaded([testTvSeriesEpisode]),
      ],
      verify: (cubit) => mockGetTvSeriesEpisode.execute(1, 1),
    );

    blocTest<TvSeriesEpisodeCubit, TvSeriesEpisodeState>(
      'should emit [Loading, Initial] when data is gotten successfuly',
      build: () {
        when(mockGetTvSeriesEpisode.execute(1, 1))
            .thenAnswer((_) async => const Right([]));

        return cubit;
      },
      act: (cubit) => cubit.fetchEpisodeTv(1, 1),
      expect: () => [
        TvSeriesEpisodeLoading(),
        TvSeriesEpisodeInitial(),
      ],
      verify: (cubit) => mockGetTvSeriesEpisode.execute(1, 1),
    );
    blocTest<TvSeriesEpisodeCubit, TvSeriesEpisodeState>(
      'should emit [Loading, Error] when data is gotten unsuccessfully',
      build: () {
        when(mockGetTvSeriesEpisode.execute(1, 1)).thenAnswer(
                (_) async => const Left(ServerFailure('Server Failure')));

        return cubit;
      },
      act: (cubit) => cubit.fetchEpisodeTv(1, 1),
      expect: () => [
        TvSeriesEpisodeLoading(),
        const TvSeriesEpisodeError('Server Failure'),
      ],
      verify: (cubit) => mockGetTvSeriesEpisode.execute(1, 1),
    );
  });
}
