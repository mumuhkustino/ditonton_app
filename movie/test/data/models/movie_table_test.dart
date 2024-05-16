import 'package:flutter_test/flutter_test.dart';
import 'package:movie/movie.dart';

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
    test('should return a JSON map containing proper domain', () async {
      // arrange

      // act
      final result = tMovieTable.toJson();
      // assert
      expect(result, tMovie);
    });
  });
}
