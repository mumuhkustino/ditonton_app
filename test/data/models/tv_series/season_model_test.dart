import 'package:ditonton/data/models/tv_series/season_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tSeasonModel = SeasonModel(
    name: "name",
    episodeCount: 1,
    posterPath: "posterPath",
    overview: "overview",
    seasonNumber: 1,
    voteAverage: 1.0,
    airDate: "airDate",
    id: 1,
  );

  const tSeason = {
    'air_date': 'airDate',
    'episode_count': 1,
    'id': 1,
    'name': 'name',
    'overview': 'overview',
    'poster_path': 'posterPath',
    'season_number': 1,
    'vote_average': 1.0
  };

  test('should return a JSON map containing proper data', () async {
    // arrange

    // act
    final result = tSeasonModel.toJson();
    // assert
    expect(result, tSeason);
  });
}
