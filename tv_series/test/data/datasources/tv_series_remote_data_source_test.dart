import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late TvSeriesRemoteDataSourceImpl dataSource;
  late MockIOClient mockIOClient;

  setUp(() {
    mockIOClient = MockIOClient();
    dataSource = TvSeriesRemoteDataSourceImpl(client: mockIOClient);
  });

  group('Get Now Playing Tv Series', () {
    final tTvSeriesList = TvSeriesResponse.fromJson(
            json.decode(readJson('dummy_data/on_the_air.json')))
        .tvSeriesList;

    test('should return list of Tv Series Model when the response code is 200',
        () async {
      // arrange
      when(mockIOClient
              .get(Uri.parse('$baseUrl/tv/on_the_air?api_key=$apiKey')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/on_the_air.json'), 200));
      // act
      final result = await dataSource.getOnTheAirTvSeries();
      // assert
      expect(result, equals(tTvSeriesList));
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockIOClient
              .get(Uri.parse('$baseUrl/tv/on_the_air?api_key=$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getOnTheAirTvSeries();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('Get Popular Tv Series', () {
    final tTvSeriesList = TvSeriesResponse.fromJson(
            json.decode(readJson('dummy_data/popular.json')))
        .tvSeriesList;

    test('should return list of Tv Series when response is success (200)',
        () async {
      // arrange
      when(mockIOClient.get(Uri.parse('$baseUrl/tv/popular?api_key=$apiKey')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/popular.json'), 200));
      // act
      final result = await dataSource.getPopularTvSeries();
      // assert
      expect(result, tTvSeriesList);
    });

    test(
        'should throw a ServerException when the response code is 404 or other',
        () async {
      // arrange
      when(mockIOClient.get(Uri.parse('$baseUrl/tv/popular?api_key=$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getPopularTvSeries();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('Get Top Rated Tv Series', () {
    final tTvSeriesList = TvSeriesResponse.fromJson(
            json.decode(readJson('dummy_data/top_rated.json')))
        .tvSeriesList;

    test('should return list of Tv Series when response code is 200 ',
        () async {
      // arrange
      when(mockIOClient.get(Uri.parse('$baseUrl/tv/top_rated?api_key=$apiKey')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/top_rated.json'), 200));
      // act
      final result = await dataSource.getTopRatedTvSeries();
      // assert
      expect(result, tTvSeriesList);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(mockIOClient.get(Uri.parse('$baseUrl/tv/top_rated?api_key=$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getTopRatedTvSeries();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('Get tv series detail', () {
    const tId = 1;
    final tTvSeriesDetail = TvSeriesDetailModel.fromJson(
        json.decode(readJson('dummy_data/tv_series_detail.json')));

    test('should return Tv Series detail when the response code is 200',
        () async {
      // arrange
      when(mockIOClient.get(Uri.parse('$baseUrl/tv/$tId?api_key=$apiKey')))
          .thenAnswer((_) async =>
              http.Response(readJson('dummy_data/tv_series_detail.json'), 200));
      // act
      final result = await dataSource.getDetailTvSeries(tId);
      // assert
      expect(result, equals(tTvSeriesDetail));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockIOClient.get(Uri.parse('$baseUrl/tv/$tId?api_key=$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getDetailTvSeries(tId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('Get Tv Series Episode', () {
    const tId = 105971;
    final tEpisodeList = EpisodeResponse.fromJson(
            json.decode(readJson('dummy_data/tv_series_episode.json')))
        .episodeList;
    const tSeason = 1;
    test('should return Search Tv Series List when response code is 200',
        () async {
      //arrange
      when(mockIOClient.get(
              Uri.parse('$baseUrl/tv/$tId/season/$tSeason?api_key=$apiKey')))
          .thenAnswer(
        (_) async =>
            http.Response(readJson('dummy_data/tv_series_episode.json'), 200),
      );
      //act
      final result = await dataSource.getTvSeriesEpisode(tId, tSeason);
      //assert
      expect(result, tEpisodeList);
    });
    test('should throw a Server Exception when response code is 404 or other',
        () async {
      //arrange
      when(mockIOClient.get(
              Uri.parse('$baseUrl/tv/$tId/season/$tSeason?api_key=$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      //act
      final call = dataSource.getTvSeriesEpisode(tId, tSeason);
      //assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('Get Tv Series recommendations', () {
    final tTvSeriesList = TvSeriesResponse.fromJson(
            json.decode(readJson('dummy_data/tv_series_recommendations.json')))
        .tvSeriesList;
    const tId = 1;

    test('should return list of Tv Series Model when the response code is 200',
        () async {
      // arrange
      when(mockIOClient.get(
              Uri.parse('$baseUrl/tv/$tId/recommendations?api_key=$apiKey')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/tv_series_recommendations.json'), 200));
      // act
      final result = await dataSource.getRecommendationTvSeries(tId);
      // assert
      expect(result, equals(tTvSeriesList));
    });

    test('should throw Server Exception when the response code is 404 or other',
        () async {
      // arrange
      when(mockIOClient.get(
              Uri.parse('$baseUrl/tv/$tId/recommendations?api_key=$apiKey')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.getRecommendationTvSeries(tId);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('Search Tv Series', () {
    final tSearchResult = TvSeriesResponse.fromJson(
            json.decode(readJson('dummy_data/search_star_wars_tv_series.json')))
        .tvSeriesList;
    const tQuery = 'Star Wars';

    test('should return list of Tv Series when response code is 200', () async {
      // arrange
      when(mockIOClient.get(
              Uri.parse('$baseUrl/search/tv?api_key=$apiKey&query=$tQuery')))
          .thenAnswer((_) async => http.Response(
              readJson('dummy_data/search_star_wars_tv_series.json'), 200));
      // act
      final result = await dataSource.searchTvSeries(tQuery);
      // assert
      expect(result, tSearchResult);
    });

    test('should throw ServerException when response code is other than 200',
        () async {
      // arrange
      when(mockIOClient.get(
              Uri.parse('$baseUrl/search/tv?api_key=$apiKey&query=$tQuery')))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      // act
      final call = dataSource.searchTvSeries(tQuery);
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
