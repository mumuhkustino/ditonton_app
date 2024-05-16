import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  const tTvSeriesDetailModel = TvSeriesDetailModel(
    adult: false,
    backdropPath: "backdropPath",
    episodeRunTime: [120],
    firstAirDate: "firstAirDate",
    genres: [
      GenreModel(id: 1, name: "name"),
    ],
    homepage: "homepage",
    id: 1,
    inProduction: false,
    languages: ["en"],
    lastAirDate: "lastAirDate",
    lastEpisodeToAir: EpisodeModel(
      airDate: "airDate",
      episodeNumber: 1,
      id: 1,
      name: "name",
      overview: "overview",
      seasonNumber: 1,
      stillPath: "stillPath",
      voteAverage: 1.0,
      voteCount: 1,
    ),
    name: "name",
    numberOfEpisodes: 1,
    numberOfSeasons: 1,
    originCountry: ["en"],
    originalLanguage: "originalLanguage",
    originalName: "originalName",
    overview: "overview",
    popularity: 1.0,
    posterPath: "posterPath",
    seasons: [
      SeasonModel(
        id: 1,
        airDate: "airDate",
        voteAverage: 1.0,
        seasonNumber: 1,
        overview: "overview",
        posterPath: "posterPath",
        episodeCount: 1,
        name: "name",
      ),
    ],
    status: "status",
    tagline: "tagline",
    type: "type",
    voteAverage: 1.0,
    voteCount: 1,
  );

  const tTvSeriesDetail = {
    "adult": false,
    "backdrop_path": "backdropPath",
    "episode_run_time": [120],
    "first_air_date": "firstAirDate",
    "genres": [GenreModel(id: 1, name: "name")],
    "homepage": "homepage",
    "id": 1,
    "in_production": false,
    "languages": ["en"],
    "last_air_date": "lastAirDate",
    "last_episode_to_air": {
      "air_date": "airDate",
      "episode_number": 1,
      "id": 1,
      "name": "name",
      "overview": "overview",
      "season_number": 1,
      "still_path": "stillPath",
      "vote_average": 1.0,
      "vote_count": 1,
    },
    "name": "name",
    "number_of_episodes": 1,
    "number_of_seasons": 1,
    "origin_country": ["en"],
    "original_language": "originalLanguage",
    "original_name": "originalName",
    "overview": "overview",
    "popularity": 1.0,
    "poster_path": "posterPath",
    "seasons": [
      SeasonModel(
        id: 1,
        airDate: "airDate",
        voteAverage: 1.0,
        seasonNumber: 1,
        overview: "overview",
        posterPath: "posterPath",
        episodeCount: 1,
        name: "name",
      ),
    ],
    "status": "status",
    "tagline": "tagline",
    "type": "type",
    "vote_average": 1.0,
    "vote_count": 1,
  };

  group('toJson', () {
    test('should return a JSON map containing proper domain', () async {
      // arrange

      // act
      final result = tTvSeriesDetailModel.toJson();
      // assert
      expect(result, tTvSeriesDetail);
    });
  });
}
