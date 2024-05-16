import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects_tv_series.dart';
import 'top_rated_tv_series_cubit_test.mocks.dart';

@GenerateMocks([GetTopRatedTvSeries])
void main() {
  late TopRatedTvSeriesCubit cubit;
  late MockGetTopRatedTvSeries mockGetTopRatedTvSeries;

  setUp(() {
    mockGetTopRatedTvSeries = MockGetTopRatedTvSeries();
    cubit = TopRatedTvSeriesCubit(getTopRatedTvSeries: mockGetTopRatedTvSeries);
  });

  group('Top Rated Tv Series', () {
    test('should emit initial state', () {
      expect(cubit.state, TopRatedTvSeriesInitial());
    });
    blocTest<TopRatedTvSeriesCubit, TopRatedTvSeriesState>(
      'should execute top rated list when function is called',
      build: () {
        when(mockGetTopRatedTvSeries.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));

        return cubit;
      },
      act: (cubit) => cubit.fetchTopRatedTvSeries(),
      verify: (cubit) => mockGetTopRatedTvSeries.execute(),
    );
    blocTest<TopRatedTvSeriesCubit, TopRatedTvSeriesState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedTvSeries.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));

        return cubit;
      },
      act: (cubit) => cubit.fetchTopRatedTvSeries(),
      expect: () => [
        TopRatedTvSeriesLoading(),
        TopRatedTvSeriesLoaded(testTvSeriesList),
      ],
      verify: (cubit) => mockGetTopRatedTvSeries.execute(),
    );
    blocTest<TopRatedTvSeriesCubit, TopRatedTvSeriesState>(
      'should emit [Loading, Error] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedTvSeries.execute()).thenAnswer(
                (_) async => const Left(ServerFailure('Server Failure')));

        return cubit;
      },
      act: (cubit) => cubit.fetchTopRatedTvSeries(),
      expect: () => [
        TopRatedTvSeriesLoading(),
        const TopRatedTvSeriesError('Server Failure'),
      ],
      verify: (cubit) => mockGetTopRatedTvSeries.execute(),
    );
  });
}