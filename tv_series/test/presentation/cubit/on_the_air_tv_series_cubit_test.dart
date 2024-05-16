import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects_tv_series.dart';
import 'on_the_air_tv_series_cubit_test.mocks.dart';

@GenerateMocks([GetOnTheAirTvSeries])
void main() {
  late OnTheAirTvSeriesCubit cubit;
  late MockGetOnTheAirTvSeries mockGetOnTheAirTvSeries;

  setUp(() {
    mockGetOnTheAirTvSeries = MockGetOnTheAirTvSeries();
    cubit = OnTheAirTvSeriesCubit(getOnTheAirTvSeries: mockGetOnTheAirTvSeries);
  });

  group('On The Air Tv Series', () {
    test('should emit initial state', () {
      expect(cubit.state, OnTheAirTvSeriesInitial());
    });
    blocTest<OnTheAirTvSeriesCubit, OnTheAirTvSeriesState>(
      'should execute now playing list when function is called',
      build: () {
        when(mockGetOnTheAirTvSeries.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));

        return cubit;
      },
      act: (cubit) => cubit.fetchOnTheAirTvSeries(),
      verify: (cubit) => mockGetOnTheAirTvSeries.execute(),
    );
    blocTest<OnTheAirTvSeriesCubit, OnTheAirTvSeriesState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetOnTheAirTvSeries.execute())
            .thenAnswer((_) async => Right(testTvSeriesList));

        return cubit;
      },
      act: (cubit) => cubit.fetchOnTheAirTvSeries(),
      expect: () => [
        OnTheAirTvSeriesLoading(),
        OnTheAirTvSeriesLoaded(testTvSeriesList),
      ],
      verify: (cubit) => mockGetOnTheAirTvSeries.execute(),
    );
    blocTest<OnTheAirTvSeriesCubit, OnTheAirTvSeriesState>(
      'should emit [Loading, Error] when data is gotten successfully',
      build: () {
        when(mockGetOnTheAirTvSeries.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));

        return cubit;
      },
      act: (cubit) => cubit.fetchOnTheAirTvSeries(),
      expect: () => [
        OnTheAirTvSeriesLoading(),
        const OnTheAirTvSeriesError('Server Failure'),
      ],
      verify: (cubit) => mockGetOnTheAirTvSeries.execute(),
    );
  });
}
