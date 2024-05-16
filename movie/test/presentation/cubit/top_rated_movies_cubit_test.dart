import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/movie.dart';

import '../../dummy_data/dummy_objects_movie.dart';
import 'top_rated_movies_cubit_test.mocks.dart';

@GenerateMocks([GetTopRatedMovies])
void main() {
  late TopRatedMoviesCubit cubit;
  late MockGetTopRatedMovies mockGetTopRatedMovies;

  setUp(() {
    mockGetTopRatedMovies = MockGetTopRatedMovies();
    cubit = TopRatedMoviesCubit(getTopRatedMovies: mockGetTopRatedMovies);
  });

  group('Top Rated Movies', () {
    test('initialState should be Empty', () {
      expect(cubit.state, TopRatedMoviesInitial());
    });
    blocTest<TopRatedMoviesCubit, TopRatedMoviesState>(
      'should execute movie list when function called',
      build: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async => Right(testMovieList));

        return cubit;
      },
      act: (cubit) => cubit.fetchTopRatedMovies(),
      verify: (cubit) => mockGetTopRatedMovies.execute(),
    );
    blocTest<TopRatedMoviesCubit, TopRatedMoviesState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedMovies.execute())
            .thenAnswer((_) async => Right(testMovieList));

        return cubit;
      },
      act: (cubit) => cubit.fetchTopRatedMovies(),
      expect: () => [
        TopRatedMoviesLoading(),
        TopRatedMoviesLoaded(testMovieList),
      ],
      verify: (cubit) => mockGetTopRatedMovies.execute(),
    );
    blocTest<TopRatedMoviesCubit, TopRatedMoviesState>(
      'should emit [Loading, Error] when data is gotten failed',
      build: () {
        when(mockGetTopRatedMovies.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));

        return cubit;
      },
      act: (cubit) => cubit.fetchTopRatedMovies(),
      expect: () => [
        TopRatedMoviesLoading(),
        const TopRatedMoviesError('Server Failure'),
      ],
      verify: (cubit) => mockGetTopRatedMovies.execute(),
    );
  });
}
