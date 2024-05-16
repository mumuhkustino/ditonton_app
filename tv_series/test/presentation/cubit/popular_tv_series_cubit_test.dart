import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects_tv_series.dart';
import 'popular_tv_series_cubit_test.mocks.dart';

@GenerateMocks([GetPopularTvSeries])
void main() {
  late PopularTvSeriesCubit cubit;
  late MockGetPopularTvSeries mockGetPopularTvSeries;

  setUp(() {
    mockGetPopularTvSeries = MockGetPopularTvSeries();
    cubit = PopularTvSeriesCubit(getPopularTvSeries: mockGetPopularTvSeries);
  });

  group('Popular Tv Series', () {
    test('should emit initial state', () {
      expect(cubit.state, PopularTvSeriesInitial());
    });
    blocTest<PopularTvSeriesCubit, PopularTvSeriesState>(
      'should execute popular list when function is called',
      build: () {
        when(mockGetPopularTvSeries.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));

        return cubit;
      },
      act: (cubit) => cubit.fetchPopularTvSeries(),
      verify: (cubit) => mockGetPopularTvSeries.execute(),
    );
    blocTest<PopularTvSeriesCubit, PopularTvSeriesState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetPopularTvSeries.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));

        return cubit;
      },
      act: (cubit) => cubit.fetchPopularTvSeries(),
      expect: () =>
          [PopularTvSeriesLoading(), PopularTvSeriesLoaded(testTvSeriesList)],
      verify: (cubit) => mockGetPopularTvSeries.execute(),
    );
    blocTest<PopularTvSeriesCubit, PopularTvSeriesState>(
      'should emit [Loading, Error] when data is gotten successfully',
      build: () {
        when(mockGetPopularTvSeries.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));

        return cubit;
      },
      act: (cubit) => cubit.fetchPopularTvSeries(),
      expect: () => [
        PopularTvSeriesLoading(),
        const PopularTvSeriesError('Server Failure'),
      ],
      verify: (cubit) => mockGetPopularTvSeries.execute(),
    );
  });
}
