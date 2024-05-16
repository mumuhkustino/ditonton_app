import 'dart:convert';

import 'package:core/utils/constants.dart';
import 'package:core/utils/exception.dart';
import 'package:http/io_client.dart';
import '../models/episode_model.dart';
import '../models/episode_response.dart';
import '../models/tv_series_detail_model.dart';
import '../models/tv_series_model.dart';
import '../models/tv_series_response.dart';

abstract class TvSeriesRemoteDataSource {
  Future<List<TvSeriesModel>> getPopularTvSeries();
  Future<List<TvSeriesModel>> getOnTheAirTvSeries();
  Future<TvSeriesDetailModel> getDetailTvSeries(int id);
  Future<List<TvSeriesModel>> getTopRatedTvSeries();
  Future<List<TvSeriesModel>> getRecommendationTvSeries(int id);
  Future<List<EpisodeModel>> getTvSeriesEpisode(int id, int seasonId);
  Future<List<TvSeriesModel>> searchTvSeries(String query);
}

class TvSeriesRemoteDataSourceImpl implements TvSeriesRemoteDataSource {
  final IOClient client;

  TvSeriesRemoteDataSourceImpl({required this.client});

  @override
  Future<TvSeriesDetailModel> getDetailTvSeries(int id) async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/$id?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return TvSeriesDetailModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> getOnTheAirTvSeries() async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/on_the_air?api_key=$apiKey'));
    if (response.statusCode == 200) {
      return TvSeriesResponse.fromJson(jsonDecode(response.body)).tvSeriesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> getPopularTvSeries() async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/popular?api_key=$apiKey'));
    if (response.statusCode == 200) {
      return TvSeriesResponse.fromJson(jsonDecode(response.body)).tvSeriesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> getRecommendationTvSeries(int id) async {
    final response = await client
        .get(Uri.parse('$baseUrl/tv/$id/recommendations?api_key=$apiKey'));
    if (response.statusCode == 200) {
      return TvSeriesResponse.fromJson(jsonDecode(response.body)).tvSeriesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> getTopRatedTvSeries() async {
    final response =
        await client.get(Uri.parse('$baseUrl/tv/top_rated?api_key=$apiKey'));
    if (response.statusCode == 200) {
      return TvSeriesResponse.fromJson(jsonDecode(response.body)).tvSeriesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<EpisodeModel>> getTvSeriesEpisode(int id, int seasonId) async {
    final response = await client
        .get(Uri.parse('$baseUrl/tv/$id/season/$seasonId?api_key=$apiKey'));
    if (response.statusCode == 200) {
      return EpisodeResponse.fromJson(jsonDecode(response.body)).episodeList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TvSeriesModel>> searchTvSeries(String query) async {
    final response = await client
        .get(Uri.parse('$baseUrl/search/tv?api_key=$apiKey&query=$query'));
    if (response.statusCode == 200) {
      return TvSeriesResponse.fromJson(jsonDecode(response.body)).tvSeriesList;
    } else {
      throw ServerException();
    }
  }
}
