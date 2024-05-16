import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects_movie.dart';
import 'popular_movies_cubit_test.mocks.dart';

@GenerateMocks([GetPopularMovies])
void main() {
  late PopularMoviesCubit cubit;
  late MockGetPopularMovies mockGetPopularMovies;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    cubit = PopularMoviesCubit(getPopularMovies: mockGetPopularMovies);
  });

  group('Popular Movies', () {
    test('initialState should be Empty', () {
      expect(cubit.state, PopularMoviesInitial());
    });
    blocTest<PopularMoviesCubit, PopularMoviesState>(
      'should execute movie list when function called',
      build: () {
        when(mockGetPopularMovies.execute())
            .thenAnswer((_) async => Right(testMovieList));

        return cubit;
      },
      act: (cubit) => cubit.fetchPopularMovies(),
      verify: (cubit) => mockGetPopularMovies.execute(),
    );
    blocTest<PopularMoviesCubit, PopularMoviesState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetPopularMovies.execute())
            .thenAnswer((_) async => Right(testMovieList));

        return cubit;
      },
      act: (cubit) => cubit.fetchPopularMovies(),
      expect: () => [
        PopularMoviesLoading(),
        PopularMoviesLoaded(testMovieList),
      ],
      verify: (cubit) => mockGetPopularMovies.execute(),
    );
    blocTest<PopularMoviesCubit, PopularMoviesState>(
      'should emit [Loading, Error] when data is gotten failed',
      build: () {
        when(mockGetPopularMovies.execute()).thenAnswer(
                (_) async => const Left(ServerFailure('Server Failure')));

        return cubit;
      },
      act: (cubit) => cubit.fetchPopularMovies(),
      expect: () => [
        PopularMoviesLoading(),
        const PopularMoviesError('Server Failure'),
      ],
      verify: (cubit) => mockGetPopularMovies.execute(),
    );
  });
}