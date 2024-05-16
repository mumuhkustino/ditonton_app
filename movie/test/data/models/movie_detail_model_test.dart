import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie/movie.dart';

void main() {
  const tMovieDetailModel = MovieDetailModel(
    adult: false,
    backdropPath: "backdropPath",
    budget: 100,
    genres: [
      GenreModel(id: 1, name: "name"),
    ],
    homepage: "homepage",
    id: 1,
    imdbId: "imdbId",
    originalLanguage: "originalLanguage",
    originalTitle: "originalTitle",
    overview: "overview",
    popularity: 1.0,
    posterPath: "posterPath",
    releaseDate: "releaseDate",
    revenue: 12000,
    runtime: 120,
    status: "status",
    tagline: "tagline",
    title: "title",
    video: false,
    voteAverage: 1.0,
    voteCount: 1,
  );

  const tMovieDetail = {
    "adult": false,
    "backdrop_path": "backdropPath",
    "budget": 100,
    "genres": [
      {"id": 1, "name": "name"}
    ],
    "homepage": "homepage",
    "id": 1,
    "imdb_id": "imdbId",
    "original_language": "originalLanguage",
    "original_title": "originalTitle",
    "overview": "overview",
    "popularity": 1.0,
    "poster_path": "posterPath",
    "release_date": "releaseDate",
    "revenue": 12000,
    "runtime": 120,
    "status": "status",
    "tagline": "tagline",
    "title": "title",
    "video": false,
    "vote_average": 1.0,
    "vote_count": 1
  };

  group('toJson', () {
    test('should return a JSON map containing proper domain', () async {
      // arrange

      // act
      final result = tMovieDetailModel.toJson();
      // assert
      expect(result, tMovieDetail);
    });
  });
}
