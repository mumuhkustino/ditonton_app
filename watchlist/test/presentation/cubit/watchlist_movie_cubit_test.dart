import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:watchlist/watchlist.dart';

import '../../dummy_data/dummy_objects_movie.dart';
import 'watchlist_movie_cubit_test.mocks.dart';

@GenerateMocks([
  GetWatchlistMovie,
  GetWatchlistMovieStatus,
  SaveWatchlistMovie,
  RemoveWatchlistMovie,
])
void main() {
  late WatchlistMovieCubit cubit;
  late MockGetWatchlistMovie mockGetWatchlistMovie;
  late MockGetWatchlistMovieStatus mockGetWatchlistMovieStatus;
  late MockSaveWatchlistMovie mockSaveWatchlistMovie;
  late MockRemoveWatchlistMovie mockRemoveWatchlistMovie;

  setUp(() {
    mockGetWatchlistMovie = MockGetWatchlistMovie();
    mockGetWatchlistMovieStatus = MockGetWatchlistMovieStatus();
    mockSaveWatchlistMovie = MockSaveWatchlistMovie();
    mockRemoveWatchlistMovie = MockRemoveWatchlistMovie();
    cubit = WatchlistMovieCubit(
      mockGetWatchlistMovie,
      mockGetWatchlistMovieStatus,
      mockSaveWatchlistMovie,
      mockRemoveWatchlistMovie,
    );
  });

  group('Get Watchlist Movie', () {
    test('should emit initial state', () {
      expect(cubit.state, WatchlistMovieInitial());
    });
    blocTest<WatchlistMovieCubit, WatchlistMovieState>(
      'should execute watchlist when function is called',
      build: () {
        when(mockGetWatchlistMovie.execute())
            .thenAnswer((_) async => Right(testMovieList));

        return cubit;
      },
      act: (cubit) => cubit.fetchWatchlistMovies(),
      verify: (cubit) => mockGetWatchlistMovie.execute(),
    );
    blocTest<WatchlistMovieCubit, WatchlistMovieState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetWatchlistMovie.execute())
            .thenAnswer((_) async => Right(testMovieList));
        return cubit;
      },
      act: (cubit) => cubit.fetchWatchlistMovies(),
      expect: () => [
        WatchlistMovieLoading(),
        WatchlistMovieLoaded(testMovieList),
      ],
      verify: (cubit) => mockGetWatchlistMovie.execute(),
    );
    blocTest<WatchlistMovieCubit, WatchlistMovieState>(
      'should emit [Loading, Error] when data is gotten successfully',
      build: () {
        when(mockGetWatchlistMovie.execute()).thenAnswer(
            (_) async => const Left(DatabaseFailure('Can\'t get data')));
        return cubit;
      },
      act: (cubit) => cubit.fetchWatchlistMovies(),
      expect: () => [
        WatchlistMovieLoading(),
        WatchlistMovieError('Can\'t get data'),
      ],
      verify: (cubit) => mockGetWatchlistMovie.execute(),
    );
  });

  group('Watchlist Movie Status', () {
    blocTest<WatchlistMovieCubit, WatchlistMovieState>(
      'should get the watchlist status',
      build: () {
        when(mockGetWatchlistMovieStatus.execute(testMovie.id))
            .thenAnswer((_) async => true);
        return cubit;
      },
      act: (cubit) => cubit.loadWatchlistMoviesStatus(testMovie.id),
      expect: () => [WatchlistMovieStatus(true)],
    );
  });

  group('Save Watchlist Movie', () {
    blocTest<WatchlistMovieCubit, WatchlistMovieState>(
      'should execute save watchlist when function is called',
      build: () {
        when(mockSaveWatchlistMovie.execute(testMovieDetail))
            .thenAnswer((_) async => const Right('Added to Watchlist Movies'));
        when(mockGetWatchlistMovieStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => true);

        return cubit;
      },
      act: (cubit) => cubit.addWatchlistMovies(testMovieDetail),
      verify: (cubit) => mockSaveWatchlistMovie.execute(testMovieDetail),
    );
    blocTest<WatchlistMovieCubit, WatchlistMovieState>(
      'should update watchlist message when add watchlist movie success',
      build: () {
        when(mockGetWatchlistMovieStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => true);
        when(mockSaveWatchlistMovie.execute(testMovieDetail))
            .thenAnswer((_) async => const Right('Added to Watchlist Movies'));

        return cubit;
      },
      act: (cubit) => cubit.addWatchlistMovies(testMovieDetail),
      expect: () => [
        WatchlistMovieMessage('Added to Watchlist Movies'),
        WatchlistMovieStatus(true),
      ],
      verify: (cubit) => mockSaveWatchlistMovie.execute(testMovieDetail),
    );
    blocTest<WatchlistMovieCubit, WatchlistMovieState>(
      'should update watchlist message when add watchlist movie failed',
      build: () {
        when(mockGetWatchlistMovieStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => false);
        when(mockSaveWatchlistMovie.execute(testMovieDetail))
            .thenAnswer((_) async => const Left(DatabaseFailure('Failed')));

        return cubit;
      },
      act: (cubit) => cubit.addWatchlistMovies(testMovieDetail),
      expect: () => [
        WatchlistMovieError('Failed'),
        WatchlistMovieStatus(false),
      ],
      verify: (cubit) => mockSaveWatchlistMovie.execute(testMovieDetail),
    );
  });

  group('Remove Watchlist Movie', () {
    blocTest<WatchlistMovieCubit, WatchlistMovieState>(
      'should execute remove watchlist when function called',
      build: () {
        when(mockRemoveWatchlistMovie.execute(testMovieDetail.id)).thenAnswer(
            (_) async => const Right('Removed from Watchlist Movies'));
        when(mockGetWatchlistMovieStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => false);

        return cubit;
      },
      act: (cubit) => cubit.deleteWatchlistMovies(testMovieDetail.id),
      verify: (cubit) =>
          verify(mockRemoveWatchlistMovie.execute(testMovieDetail.id)),
    );

    blocTest<WatchlistMovieCubit, WatchlistMovieState>(
      'should update watchlist message when remove watchlist success',
      build: () {
        when(mockRemoveWatchlistMovie.execute(testMovieDetail.id)).thenAnswer(
            (_) async => const Right('Removed from Watchlist Movies'));
        when(mockGetWatchlistMovieStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => false);

        return cubit;
      },
      act: (cubit) => cubit.deleteWatchlistMovies(testMovieDetail.id),
      expect: () => [
        WatchlistMovieMessage('Removed from Watchlist Movies'),
        WatchlistMovieStatus(false),
      ],
      verify: (cubit) {
        verify(mockRemoveWatchlistMovie.execute(testMovieDetail.id));
        verify(mockGetWatchlistMovieStatus.execute(testMovieDetail.id));
      },
    );

    blocTest<WatchlistMovieCubit, WatchlistMovieState>(
      'should update watchlist message when Removed from Watchlist failed',
      build: () {
        when(mockRemoveWatchlistMovie.execute(testMovieDetail.id))
            .thenAnswer((_) async => const Left(DatabaseFailure('Failed')));
        when(mockGetWatchlistMovieStatus.execute(testMovieDetail.id))
            .thenAnswer((_) async => false);

        return cubit;
      },
      act: (cubit) => cubit.deleteWatchlistMovies(testMovieDetail.id),
      expect: () => [
        WatchlistMovieError('Failed'),
        WatchlistMovieStatus(false),
      ],
      verify: (cubit) {
        verify(mockRemoveWatchlistMovie.execute(testMovieDetail.id));
        verify(mockGetWatchlistMovieStatus.execute(testMovieDetail.id));
      },
    );
  });
}
