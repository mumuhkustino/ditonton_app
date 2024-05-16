import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

import '../../json_reader.dart';

void main() {
  const tEpisodeModel = EpisodeModel(
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
  );

  const tEpisodeResponseModel =
      EpisodeResponse(episodeList: <EpisodeModel>[tEpisodeModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/tv_series_episode.json'));
      // act
      final result = EpisodeResponse.fromJson(jsonMap);
      // assert
      expect(result, tEpisodeResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper domain', () async {
      // arrange

      // act
      final result = tEpisodeResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "episodes": [
          {
            'air_date': '2021-05-04',
            'episode_number': 1,
            'id': 2584131,
            'name': 'Aftermath',
            'overview':
                'The clones of The Bad Batch find themselves in a changing galaxy after The Clone Wars.',
            'season_number': 1,
            'still_path': '/n4D7u3GEd7CwrTcdfovlddLhLjC.jpg',
            'vote_average': 8.0,
            'vote_count': 35
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
