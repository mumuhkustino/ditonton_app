import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  const tEpisodeModel = EpisodeModel(
    airDate: "airDate",
    episodeNumber: 1,
    id: 1,
    name: "name",
    overview: "overview",
    seasonNumber: 1,
    stillPath: "stillPath",
    voteAverage: 1.0,
    voteCount: 1,
  );

  const tEpisode = Episode(
    airDate: "airDate",
    episodeNumber: 1,
    id: 1,
    name: "name",
    overview: "overview",
    seasonNumber: 1,
    stillPath: "stillPath",
    voteAverage: 1.0,
    voteCount: 1,
  );

  const tEpisodeMap = {
    'air_date': 'airDate',
    'episode_number': 1,
    'id': 1,
    'name': 'name',
    'overview': 'overview',
    'season_number': 1,
    'still_path': 'stillPath',
    'vote_average': 1.0,
    'vote_count': 1
  };

  group('toJson', () {
    test('should return a JSON map containing proper domain', () async {
      // arrange

      // act
      final result = tEpisodeModel.toJson();
      // assert
      expect(result, tEpisodeMap);
    });
  });

  group('toEntity', () {
    test('should be a subclass of Movie entity', () async {
      final result = tEpisodeModel.toEntity();
      expect(result, tEpisode);
    });
  });
}
