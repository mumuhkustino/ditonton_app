import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects_tv_series.dart';
import 'tv_series_detail_cubit_test.mocks.dart';

@GenerateMocks([
  GetTvSeriesDetail,
  GetTvSeriesRecommendations,
])
void main() {
  late TvSeriesDetailCubit cubit;
  late MockGetTvSeriesDetail mockGetDetailTvSeries;
  late MockGetTvSeriesRecommendations mockGetRecommendationTvSeries;

  setUp(() {
    mockGetRecommendationTvSeries = MockGetTvSeriesRecommendations();
    mockGetDetailTvSeries = MockGetTvSeriesDetail();
    cubit = TvSeriesDetailCubit(
      getTvSeriesDetail: mockGetDetailTvSeries,
      getTvSeriesRecommendations: mockGetRecommendationTvSeries,
    );
  });

  group('Get Tv Series Detail and Recommendation Tv Series', () {
    test('initial state should be empty', () {
      expect(cubit.state, TvSeriesDetailInitial());
    });

    blocTest<TvSeriesDetailCubit, TvSeriesDetailState>(
      'should execute tv detail when function called',
      build: () {
        when(mockGetDetailTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => const Right(testTvSeriesDetail));
        when(mockGetRecommendationTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => Right(testTvSeriesList));

        return cubit;
      },
      act: (cubit) => cubit.fetchTvSeriesDetail(testTvSeriesDetail.id),
      verify: (cubit) => mockGetDetailTvSeries.execute(testTvSeriesDetail.id),
    );

    blocTest<TvSeriesDetailCubit, TvSeriesDetailState>(
      'should execute series recommendation when function called',
      build: () {
        when(mockGetDetailTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => const Right(testTvSeriesDetail));
        when(mockGetRecommendationTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => Right(testTvSeriesList));

        return cubit;
      },
      act: (cubit) => cubit.fetchTvSeriesDetail(testTvSeriesDetail.id),
      verify: (cubit) => mockGetDetailTvSeries.execute(testTvSeriesDetail.id),
    );

    blocTest<TvSeriesDetailCubit, TvSeriesDetailState>(
      'should emit [Loading, Loaded] when data is gotten successfully',
      build: () {
        when(mockGetDetailTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => const Right(testTvSeriesDetail));
        when(mockGetRecommendationTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => Right(testTvSeriesList));

        return cubit;
      },
      act: (cubit) => cubit.fetchTvSeriesDetail(testTvSeriesDetail.id),
      expect: () => [
        TvSeriesDetailLoading(),
        TvSeriesRecommendationLoading(),
        TvSeriesDetailLoaded(
          testTvSeriesDetail,
          testTvSeriesList,
        ),
      ],
      verify: (cubit) {
        mockGetDetailTvSeries.execute(testTvSeriesDetail.id);
        mockGetRecommendationTvSeries.execute(testTvSeriesDetail.id);
      },
    );
    blocTest<TvSeriesDetailCubit, TvSeriesDetailState>(
      'should emit [Loading, Error] when data is gotten successfully',
      build: () {
        when(mockGetDetailTvSeries.execute(testTvSeriesDetail.id)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        when(mockGetRecommendationTvSeries.execute(testTvSeriesDetail.id)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));

        return cubit;
      },
      act: (cubit) => cubit.fetchTvSeriesDetail(testTvSeriesDetail.id),
      expect: () => [
        TvSeriesDetailLoading(),
        const TvSeriesDetailError('Server Failure'),
      ],
      verify: (cubit) {
        mockGetDetailTvSeries.execute(testTvSeriesDetail.id);
        mockGetRecommendationTvSeries.execute(testTvSeriesDetail.id);
      },
    );
    blocTest<TvSeriesDetailCubit, TvSeriesDetailState>(
      'should emit [Loading, Error] when recommendation is gotten successfully',
      build: () {
        when(mockGetDetailTvSeries.execute(testTvSeriesDetail.id))
            .thenAnswer((_) async => const Right(testTvSeriesDetail));
        when(mockGetRecommendationTvSeries.execute(testTvSeriesDetail.id)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));

        return cubit;
      },
      act: (cubit) => cubit.fetchTvSeriesDetail(testTvSeriesDetail.id),
      expect: () => [
        TvSeriesDetailLoading(),
        TvSeriesRecommendationLoading(),
        const TvSeriesRecommendationError(testTvSeriesDetail, [], 'Server Failure'),
      ],
      verify: (cubit) {
        mockGetDetailTvSeries.execute(testTvSeriesDetail.id);
        mockGetRecommendationTvSeries.execute(testTvSeriesDetail.id);
      },
    );
  });
}
