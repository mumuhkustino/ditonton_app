import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects_movie.dart';
import 'now_playing_movies_cubit_test.mocks.dart';

@GenerateMocks([GetNowPlayingMovies])
void main() {
  late NowPlayingMoviesCubit cubit;
  late MockGetNowPlayingMovies mockGetNowPlayingMovies;

  setUp(() {
    mockGetNowPlayingMovies = MockGetNowPlayingMovies();
    cubit = NowPlayingMoviesCubit(getNowPlayingMovies: mockGetNowPlayingMovies);
  });

  group('Now Playing Movies', () {
    test('initialState should be Empty', () {
      expect(cubit.state, NowPlayingMoviesInitial());
    });
    blocTest<NowPlayingMoviesCubit, NowPlayingMoviesState>(
      'should execute movie list when function called',
      build: () {
        when(mockGetNowPlayingMovies.execute())
            .thenAnswer((_) async => Right(testMovieList));

        return cubit;
      },
      act: (cubit) => cubit.fetchNowPlayingMovies(),
      verify: (cubit) => mockGetNowPlayingMovies.execute(),
    );
    blocTest<NowPlayingMoviesCubit, NowPlayingMoviesState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetNowPlayingMovies.execute())
            .thenAnswer((_) async => Right(testMovieList));

        return cubit;
      },
      act: (cubit) => cubit.fetchNowPlayingMovies(),
      expect: () => [
        NowPlayingMoviesLoading(),
        NowPlayingMoviesLoaded(testMovieList),
      ],
      verify: (cubit) => mockGetNowPlayingMovies.execute(),
    );
    blocTest<NowPlayingMoviesCubit, NowPlayingMoviesState>(
      'should emit [Loading, Error] when data is gotten failed',
      build: () {
        when(mockGetNowPlayingMovies.execute()).thenAnswer(
                (_) async => const Left(ServerFailure('Server Failure')));

        return cubit;
      },
      act: (cubit) => cubit.fetchNowPlayingMovies(),
      expect: () => [
        NowPlayingMoviesLoading(),
        const NowPlayingMoviesError('Server Failure'),
      ],
      verify: (cubit) => mockGetNowPlayingMovies.execute(),
    );
  });
}