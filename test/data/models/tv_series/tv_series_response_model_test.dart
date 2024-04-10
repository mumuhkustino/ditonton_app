import 'dart:convert';

import 'package:ditonton/data/models/tv_series/tv_series_model.dart';
import 'package:ditonton/data/models/tv_series/tv_series_response.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json_reader.dart';

void main() {
  const tTvSeriesModel = TvSeriesModel(
    adult: false,
    backdropPath: "/gMMnf8VRg3Z98WaFmOLr9Jk8pIs.jpg",
    genreIds: [35, 10767],
    id: 63770,
    originCountry: ['US'],
    originalLanguage: "en",
    originalName: "The Late Show with Stephen Colbert",
    overview:
        "Stephen Colbert brings his signature satire and comedy to The Late Show with Stephen Colbert, the #1 show in late night, where he talks with an eclectic mix of guests about what is new and relevant in the worlds of politics, entertainment, business, music, technology, and more. Featuring bandleader Jon Batiste with his band Stay Human, the Emmy Award-nominated show is broadcast from the historic Ed Sullivan Theater. Stephen Colbert, Chris Licht, Tom Purcell, and Jon Stewart are executive producers. Barry Julien and Denise Rehrig serve as co-executive producers.",
    popularity: 3663.055,
    posterPath: "/9jkThAGYj2yp8jsS6Nriy5mzKFT.jpg",
    firstAirDate: "2015-09-08",
    name: "The Late Show with Stephen Colbert",
    voteAverage: 6.5,
    voteCount: 250,
  );
  const tTvSeriesResponseModel =
      TvSeriesResponse(tvSeriesList: <TvSeriesModel>[tTvSeriesModel]);
  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/tv_series/on_the_air.json'));
      // act
      final result = TvSeriesResponse.fromJson(jsonMap);
      // assert
      expect(result, tTvSeriesResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTvSeriesResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "adult": false,
            "backdrop_path": "/gMMnf8VRg3Z98WaFmOLr9Jk8pIs.jpg",
            "genre_ids": [35, 10767],
            "id": 63770,
            "origin_country": ["US"],
            "original_language": "en",
            "original_name": "The Late Show with Stephen Colbert",
            "overview":
                "Stephen Colbert brings his signature satire and comedy to The Late Show with Stephen Colbert, the #1 show in late night, where he talks with an eclectic mix of guests about what is new and relevant in the worlds of politics, entertainment, business, music, technology, and more. Featuring bandleader Jon Batiste with his band Stay Human, the Emmy Award-nominated show is broadcast from the historic Ed Sullivan Theater. Stephen Colbert, Chris Licht, Tom Purcell, and Jon Stewart are executive producers. Barry Julien and Denise Rehrig serve as co-executive producers.",
            "popularity": 3663.055,
            "poster_path": "/9jkThAGYj2yp8jsS6Nriy5mzKFT.jpg",
            "first_air_date": "2015-09-08",
            "name": "The Late Show with Stephen Colbert",
            "vote_average": 6.5,
            "vote_count": 250
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
