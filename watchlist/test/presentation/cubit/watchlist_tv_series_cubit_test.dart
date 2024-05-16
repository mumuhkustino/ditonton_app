import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:watchlist/watchlist.dart';

import '../../dummy_data/dummy_objects_tv_series.dart';
import 'watchlist_tv_series_cubit_test.mocks.dart';

@GenerateMocks([
  GetWatchlistTvSeries,
  GetWatchlistTvSeriesStatus,
  SaveWatchlistTvSeries,
  RemoveWatchlistTvSeries,
])
void main() {
  late WatchlistTvSeriesCubit cubit;
  late MockGetWatchlistTvSeries mockGetWatchlistTvSeries;
  late MockGetWatchlistTvSeriesStatus mockGetWatchlistTvSeriesStatus;
  late MockSaveWatchlistTvSeries mockSaveWatchlistTvSeries;
  late MockRemoveWatchlistTvSeries mockRemoveWatchlistTvSeries;

  setUp(() {
    mockGetWatchlistTvSeries = MockGetWatchlistTvSeries();
    mockGetWatchlistTvSeriesStatus = MockGetWatchlistTvSeriesStatus();
    mockSaveWatchlistTvSeries = MockSaveWatchlistTvSeries();
    mockRemoveWatchlistTvSeries = MockRemoveWatchlistTvSeries();
    cubit = WatchlistTvSeriesCubit(
      mockGetWatchlistTvSeries,
      mockGetWatchlistTvSeriesStatus,
      mockSaveWatchlistTvSeries,
      mockRemoveWatchlistTvSeries,
    );
  });

  group('Get Watchlist Tv Series', () {
    test('should emit initial state', () {
      expect(cubit.state, WatchlistTvSeriesInitial());
    });
    blocTest<WatchlistTvSeriesCubit, WatchlistTvSeriesState>(
      'should execute watchlist when function is called',
      build: () {
        when(mockGetWatchlistTvSeries.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));

        return cubit;
      },
      act: (cubit) => cubit.fetchWatchlistTvSeries(),
      verify: (cubit) => mockGetWatchlistTvSeries.execute(),
    );
    blocTest<WatchlistTvSeriesCubit, WatchlistTvSeriesState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetWatchlistTvSeries.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));
        return cubit;
      },
      act: (cubit) => cubit.fetchWatchlistTvSeries(),
      expect: () => [
        WatchlistTvSeriesLoading(),
        WatchlistTvSeriesLoaded(testTvSeriesList),
      ],
      verify: (cubit) => mockGetWatchlistTvSeries.execute(),
    );
    blocTest<WatchlistTvSeriesCubit, WatchlistTvSeriesState>(
      'should emit [Loading, Error] when data is gotten successfully',
      build: () {
        when(mockGetWatchlistTvSeries.execute()).thenAnswer(
            (_) async => const Left(DatabaseFailure('Can\'t get data')));
        return cubit;
      },
      act: (cubit) => cubit.fetchWatchlistTvSeries(),
      expect: () => [
        WatchlistTvSeriesLoading(),
        WatchlistTvSeriesError('Can\'t get data'),
      ],
      verify: (cubit) => mockGetWatchlistTvSeries.execute(),
    );
  });

  group('Watchlist Tv Series Status', () {
    blocTest<WatchlistTvSeriesCubit, WatchlistTvSeriesState>(
      'should get the watchlist status',
      build: () {
        when(mockGetWatchlistTvSeriesStatus.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => true);
        return cubit;
      },
      act: (cubit) => cubit.loadWatchlistTvSeriesStatus(testTvSeriesDetail.id),
      expect: () => [WatchlistTvSeriesStatus(true)],
    );
  });

  group('Save Watchlist Tv Series', () {
    blocTest<WatchlistTvSeriesCubit, WatchlistTvSeriesState>(
      'should execute save watchlist when function is called',
      build: () {
        when(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail)).thenAnswer(
            (_) async => const Right('Added to Watchlist Tv Series'));
        when(mockGetWatchlistTvSeriesStatus.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => true);

        return cubit;
      },
      act: (cubit) => cubit.addWatchlistTvSeries(testTvSeriesDetail),
      verify: (cubit) => mockSaveWatchlistTvSeries.execute(testTvSeriesDetail),
    );
    blocTest<WatchlistTvSeriesCubit, WatchlistTvSeriesState>(
      'should update watchlist message when add watchlist success',
      build: () {
        when(mockGetWatchlistTvSeriesStatus.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => true);
        when(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail)).thenAnswer(
            (_) async => const Right('Added to Watchlist Tv Series'));

        return cubit;
      },
      act: (cubit) => cubit.addWatchlistTvSeries(testTvSeriesDetail),
      expect: () => [
        WatchlistTvSeriesMessage('Added to Watchlist Tv Series'),
        WatchlistTvSeriesStatus(true),
      ],
      verify: (cubit) => mockSaveWatchlistTvSeries.execute(testTvSeriesDetail),
    );
    blocTest<WatchlistTvSeriesCubit, WatchlistTvSeriesState>(
      'should update watchlist message when add watchlist failed',
      build: () {
        when(mockGetWatchlistTvSeriesStatus.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => false);
        when(mockSaveWatchlistTvSeries.execute(testTvSeriesDetail))
            .thenAnswer((_) async => const Left(DatabaseFailure('Failed')));

        return cubit;
      },
      act: (cubit) => cubit.addWatchlistTvSeries(testTvSeriesDetail),
      expect: () => [
        WatchlistTvSeriesError('Failed'),
        WatchlistTvSeriesStatus(false),
      ],
      verify: (cubit) => mockSaveWatchlistTvSeries.execute(testTvSeriesDetail),
    );
  });

  group('Remove Watchlist Tv Series', () {
    blocTest<WatchlistTvSeriesCubit, WatchlistTvSeriesState>(
      'should execute remove watchlist when function called',
      build: () {
        when(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer(
                (_) async => const Right('Removed from Watchlist Tv Series'));
        when(mockGetWatchlistTvSeriesStatus.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => false);

        return cubit;
      },
      act: (cubit) => cubit.deleteWatchlistTvSeries(testTvSeriesDetail.id),
      verify: (cubit) =>
          verify(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail.id)),
    );

    blocTest<WatchlistTvSeriesCubit, WatchlistTvSeriesState>(
      'should update watchlist message when remove watchlist success',
      build: () {
        when(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer(
                (_) async => const Right('Removed from Watchlist Tv Series'));
        when(mockGetWatchlistTvSeriesStatus.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => false);

        return cubit;
      },
      act: (cubit) => cubit.deleteWatchlistTvSeries(testTvSeriesDetail.id),
      expect: () => [
        WatchlistTvSeriesMessage('Removed from Watchlist Tv Series'),
        WatchlistTvSeriesStatus(false),
      ],
      verify: (cubit) {
        verify(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail.id));
        verify(mockGetWatchlistTvSeriesStatus.execute(testTvSeriesDetail.id));
      },
    );

    blocTest<WatchlistTvSeriesCubit, WatchlistTvSeriesState>(
      'should update watchlist message when Removed from Watchlist failed',
      build: () {
        when(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
        when(mockGetWatchlistTvSeriesStatus.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => false);

        return cubit;
      },
      act: (cubit) => cubit.deleteWatchlistTvSeries(testTvSeriesDetail.id),
      expect: () => [
        WatchlistTvSeriesError('Failed'),
        WatchlistTvSeriesStatus(false),
      ],
      verify: (cubit) {
        verify(mockRemoveWatchlistTvSeries.execute(testTvSeriesDetail.id));
        verify(mockGetWatchlistTvSeriesStatus.execute(testTvSeriesDetail.id));
      },
    );
  });
}
