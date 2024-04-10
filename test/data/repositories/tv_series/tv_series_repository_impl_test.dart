import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/tv_series/episode_model.dart';
import 'package:ditonton/data/models/tv_series/season_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_detail_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_model.dart';
import 'package:ditonton/data/repositories/tv_series/tv_series_repository_impl.dart';
import 'package:ditonton/domain/entities/tv_series/episode.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/tv_series/dummy_objects_tv_series.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late TvSeriesRepositoryImpl repository;
  late MockTvSeriesRemoteDataSource mockTvSeriesRemoteDataSource;
  late MockTvSeriesLocalDataSource mockTvSeriesLocalDataSource;

  setUp(() {
    mockTvSeriesRemoteDataSource = MockTvSeriesRemoteDataSource();
    mockTvSeriesLocalDataSource = MockTvSeriesLocalDataSource();
    repository = TvSeriesRepositoryImpl(
      tvSeriesLocalDataSource: mockTvSeriesLocalDataSource,
      tvSeriesRemoteDataSource: mockTvSeriesRemoteDataSource,
    );
  });

  const tTvSeriesModel = TvSeriesModel(
    adult: false,
    backdropPath: '/xs2v0K7iKAuR4YtKOw7TEcDIX63.jpg',
    genreIds: [16, 10759, 10765],
    id: 105971,
    originCountry: ["US"],
    originalLanguage: "en",
    originalName: "Star Wars: The Bad Batch",
    overview:
        "The 'Bad Batch' of elite and experimental clones make their way through an ever-changing galaxy in the immediate aftermath of the Clone Wars.",
    popularity: 531.528,
    posterPath: "/5mHus672nuinyaE0FtqvD0AddcY.jpg",
    firstAirDate: "2021-05-04",
    name: "Star Wars: The Bad Batch",
    voteAverage: 8.247,
    voteCount: 881,
  );

  const tTvSeries = TvSeries(
    adult: false,
    backdropPath: '/xs2v0K7iKAuR4YtKOw7TEcDIX63.jpg',
    genreIds: [16, 10759, 10765],
    id: 105971,
    originCountry: ["US"],
    originalLanguage: "en",
    originalName: "Star Wars: The Bad Batch",
    overview:
        "The 'Bad Batch' of elite and experimental clones make their way through an ever-changing galaxy in the immediate aftermath of the Clone Wars.",
    popularity: 531.528,
    posterPath: "/5mHus672nuinyaE0FtqvD0AddcY.jpg",
    firstAirDate: "2021-05-04",
    name: "Star Wars: The Bad Batch",
    voteAverage: 8.247,
    voteCount: 881,
  );

  final tTvSeriesModelList = <TvSeriesModel>[tTvSeriesModel];
  final tTvSeriesList = <TvSeries>[tTvSeries];

  group('Now Playing Tv Series', () {
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getOnTheAirTvSeries())
          .thenAnswer((_) async => tTvSeriesModelList);
      // act
      final result = await repository.getOnTheAirTvSeries();
      // assert
      verify(mockTvSeriesRemoteDataSource.getOnTheAirTvSeries());
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSeriesList);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getOnTheAirTvSeries())
          .thenThrow(ServerException());
      // act
      final result = await repository.getOnTheAirTvSeries();
      // assert
      verify(mockTvSeriesRemoteDataSource.getOnTheAirTvSeries());
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getOnTheAirTvSeries())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getOnTheAirTvSeries();
      // assert
      verify(mockTvSeriesRemoteDataSource.getOnTheAirTvSeries());
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Popular Tv Series', () {
    test('should return tv series list when call to data source is success',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getPopularTvSeries())
          .thenAnswer((_) async => tTvSeriesModelList);
      // act
      final result = await repository.getPopularTvSeries();
      // assert
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSeriesList);
    });

    test(
        'should return server failure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getPopularTvSeries())
          .thenThrow(ServerException());
      // act
      final result = await repository.getPopularTvSeries();
      // assert
      expect(result, const Left(ServerFailure('')));
    });

    test(
        'should return connection failure when device is not connected to the internet',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getPopularTvSeries())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getPopularTvSeries();
      // assert
      expect(result,
          const Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Top Rated Tv Series', () {
    test('should return tv series list when call to data source is successful',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getTopRatedTvSeries())
          .thenAnswer((_) async => tTvSeriesModelList);
      // act
      final result = await repository.getTopRatedTvSeries();
      // assert
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSeriesList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getTopRatedTvSeries())
          .thenThrow(ServerException());
      // act
      final result = await repository.getTopRatedTvSeries();
      // assert
      expect(result, const Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getTopRatedTvSeries())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTopRatedTvSeries();
      // assert
      expect(result,
          const Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('Get Tv Series Detail', () {
    const tId = 1;
    const tTvSeriesResponse = TvSeriesDetailModel(
      adult: false,
      backdropPath: 'backdropPath',
      episodeRunTime: [120],
      firstAirDate: 'firstAirDate',
      genres: [GenreModel(id: 1, name: 'Animation')],
      homepage: "https://google.com",
      id: 1,
      inProduction: false,
      languages: ['en'],
      lastAirDate: 'lastAirDate',
      lastEpisodeToAir: EpisodeModel(
        airDate: 'airDate',
        episodeNumber: 1,
        id: 1,
        name: 'name',
        overview: 'overview',
        seasonNumber: 1,
        stillPath: 'stillPath',
        voteAverage: 1.0,
        voteCount: 1,
      ),
      name: 'name',
      numberOfEpisodes: 1,
      numberOfSeasons: 1,
      originCountry: ['US'],
      originalLanguage: 'en',
      originalName: 'originalName',
      overview: 'overview',
      popularity: 1,
      posterPath: 'posterPath',
      seasons: [
        SeasonModel(
          airDate: 'airDate',
          episodeCount: 1,
          id: 1,
          name: 'name',
          overview: 'overview',
          posterPath: 'posterPath',
          seasonNumber: 1,
          voteAverage: 1.0,
        )
      ],
      status: 'status',
      tagline: 'tagline',
      type: 'type',
      voteAverage: 1.0,
      voteCount: 1,
    );

    test(
        'should return Tv Series data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getDetailTvSeries(tId))
          .thenAnswer((_) async => tTvSeriesResponse);
      // act
      final result = await repository.getDetailTvSeries(tId);
      // assert
      verify(mockTvSeriesRemoteDataSource.getDetailTvSeries(tId));
      expect(result, equals(const Right(testTvSeriesDetail)));
    });

    test(
        'should return Server Failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getDetailTvSeries(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getDetailTvSeries(tId);
      // assert
      verify(mockTvSeriesRemoteDataSource.getDetailTvSeries(tId));
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getDetailTvSeries(tId))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getDetailTvSeries(tId);
      // assert
      verify(mockTvSeriesRemoteDataSource.getDetailTvSeries(tId));
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Get Tv Series Episode', () {
    const tId = 105971;
    const tSeasonId = 1;
    const tTvSeriesEpisodeModelList = <EpisodeModel>[
      EpisodeModel(
        airDate: "2021-05-04",
        episodeNumber: 1,
        id: 2584131,
        name: "Aftermath",
        overview:
            "The clones of The Bad Batch find themselves in a changing galaxy after The Clone Wars.",
        seasonNumber: 1,
        stillPath: "/n4D7u3GEd7CwrTcdfovlddLhLjC.jpg",
        voteAverage: 8.0,
        voteCount: 35,
      )
    ];
    const tTvSeriesEpisodeList = <Episode>[
      Episode(
        airDate: "2021-05-04",
        episodeNumber: 1,
        id: 2584131,
        name: "Aftermath",
        overview:
            "The clones of The Bad Batch find themselves in a changing galaxy after The Clone Wars.",
        seasonNumber: 1,
        stillPath: "/n4D7u3GEd7CwrTcdfovlddLhLjC.jpg",
        voteAverage: 8.0,
        voteCount: 35,
      )
    ];

    test(
        'should return Tv Series Episode data when the call to remote data source is successful',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getTvSeriesEpisode(tId, tSeasonId))
          .thenAnswer((_) async => tTvSeriesEpisodeModelList);
      // act
      final result = await repository.getTvSeriesEpisode(tId, tSeasonId);
      // assert
      verify(mockTvSeriesRemoteDataSource.getTvSeriesEpisode(tId, tSeasonId));
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSeriesEpisodeList);
    });

    test(
        'should return Server Failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getTvSeriesEpisode(tId, tSeasonId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getTvSeriesEpisode(tId, tSeasonId);
      // assert
      verify(mockTvSeriesRemoteDataSource.getTvSeriesEpisode(tId, tSeasonId));
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getTvSeriesEpisode(tId, tSeasonId))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getTvSeriesEpisode(tId, tSeasonId);
      // assert
      verify(mockTvSeriesRemoteDataSource.getTvSeriesEpisode(tId, tSeasonId));
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Get Tv Series Recommendations', () {
    final tTvSeriesList = <TvSeriesModel>[];
    const tId = 1;

    test('should return data (tv series list) when the call is successful',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getRecommendationTvSeries(tId))
          .thenAnswer((_) async => tTvSeriesList);
      // act
      final result = await repository.getRecommendedTvSeries(tId);
      // assert
      verify(mockTvSeriesRemoteDataSource.getRecommendationTvSeries(tId));
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, equals(tTvSeriesList));
    });

    test(
        'should return server failure when call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getRecommendationTvSeries(tId))
          .thenThrow(ServerException());
      // act
      final result = await repository.getRecommendedTvSeries(tId);
      // assert build runner
      verify(mockTvSeriesRemoteDataSource.getRecommendationTvSeries(tId));
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to the internet',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.getRecommendationTvSeries(tId))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getRecommendedTvSeries(tId);
      // assert
      verify(mockTvSeriesRemoteDataSource.getRecommendationTvSeries(tId));
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('Search Tv Series', () {
    const tQuery = 'star wars';

    test('should return tv series list when call to data source is successful',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.searchTvSeries(tQuery))
          .thenAnswer((_) async => tTvSeriesModelList);
      // act
      final result = await repository.searchTvSeries(tQuery);
      // assert
      /* workaround to test List in Right. Issue: https://github.com/spebbe/dartz/issues/80 */
      final resultList = result.getOrElse(() => []);
      expect(resultList, tTvSeriesList);
    });

    test('should return ServerFailure when call to data source is unsuccessful',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.searchTvSeries(tQuery))
          .thenThrow(ServerException());
      // act
      final result = await repository.searchTvSeries(tQuery);
      // assert
      expect(result, const Left(ServerFailure('')));
    });

    test(
        'should return ConnectionFailure when device is not connected to the internet',
        () async {
      // arrange
      when(mockTvSeriesRemoteDataSource.searchTvSeries(tQuery))
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.searchTvSeries(tQuery);
      // assert
      expect(result,
          const Left(ConnectionFailure('Failed to connect to the network')));
    });
  });

  group('save watchlist tv series', () {
    test('should return success message when saving successful', () async {
      // arrange
      when(mockTvSeriesLocalDataSource
              .insertWatchlistTvSeries(testTvSeriesTable))
          .thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result = await repository.saveWatchlist(testTvSeriesDetail);
      // assert
      expect(result, const Right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockTvSeriesLocalDataSource
              .insertWatchlistTvSeries(testTvSeriesTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.saveWatchlist(testTvSeriesDetail);
      // assert
      expect(result, const Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove watchlist tv series', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(mockTvSeriesLocalDataSource
              .removeWatchlistTvSeries(testTvSeriesTable.id))
          .thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result = await repository.removeWatchlist(testTvSeriesDetail.id);
      // assert
      expect(result, const Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockTvSeriesLocalDataSource
              .removeWatchlistTvSeries(testTvSeriesTable.id))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result = await repository.removeWatchlist(testTvSeriesDetail.id);
      // assert
      expect(result, const Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      const tId = 1;
      when(mockTvSeriesLocalDataSource.getTvSeriesById(tId))
          .thenAnswer((_) async => null);
      // act
      final result = await repository.isAddedToWatchlist(tId);
      // assert
      expect(result, false);
    });
  });

  group('get watchlist tv series', () {
    test('should return list of Tv Series', () async {
      // arrange
      when(mockTvSeriesLocalDataSource.getWatchlistTvSeries())
          .thenAnswer((_) async => [testTvSeriesTable]);
      // act
      final result = await repository.getWatchlistTvSeries();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [testWatchlistTvSeries]);
    });
  });
}
