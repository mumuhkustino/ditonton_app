import 'package:ditonton/data/models/movie/movie_table.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tMovieTable = MovieTable(
    id: 1,
    title: "title",
    posterPath: "posterPath",
    overview: "overview",
  );

  const tMovie = {
    "id": 1,
    "title": "title",
    "posterPath": "posterPath",
    "overview": "overview"
  };

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tMovieTable.toJson();
      // assert
      expect(result, tMovie);
    });
  });
}
