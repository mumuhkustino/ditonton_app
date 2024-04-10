import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/tv_series/tv_series_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_series/dummy_objects_tv_series.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late TvSeriesLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource =
        TvSeriesLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('save watchlist tv series', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlistTvSeries(testTvSeriesTable))
          .thenAnswer((_) async => 1);
      // act
      final result =
          await dataSource.insertWatchlistTvSeries(testTvSeriesTable);
      // assert
      expect(result, 'Added to Watchlist Tv Series');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlistTvSeries(testTvSeriesTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.insertWatchlistTvSeries(testTvSeriesTable);
      // assert
      expect(call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist tv series', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlistTvSeries(testTvSeriesTable.id))
          .thenAnswer((_) async => 1);
      // act
      final result =
          await dataSource.removeWatchlistTvSeries(testTvSeriesTable.id!);
      // assert
      expect(result, 'Removed from Watchlist Tv Series');
    });

    test('should throw DatabaseException when remove to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlistTvSeries(testTvSeriesTable.id))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchlistTvSeries(testTvSeriesTable.id!);
      // assert
      expect(call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Tv Series Detail By Id', () {
    const tId = 1;

    test('should return Tv Series Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getTvSeriesById(tId))
          .thenAnswer((_) async => testTvSeriesMap);
      // act
      final result = await dataSource.getTvSeriesById(tId);
      // assert
      expect(result, testTvSeriesTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getTvSeriesById(tId))
          .thenAnswer((_) async => null);
      // act
      final result = await dataSource.getTvSeriesById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist tv series', () {
    test('should return list of TvSeriesTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistTvSeries())
          .thenAnswer((_) async => [testTvSeriesMap]);
      // act
      final result = await dataSource.getWatchlistTvSeries();
      // assert
      expect(result, [testTvSeriesTable]);
    });
  });
}
