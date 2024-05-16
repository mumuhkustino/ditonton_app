import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tGenreModel = GenreModel(id: 1, name: "name");

  const tGenreEntity = Genre(id: 1, name: "name");

  const tGenre = '''{
  "id": 1,
  "name": "name"
}''';

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(tGenre);
      // act
      final result = GenreModel.fromJson(jsonMap);
      // assert
      expect(result, tGenreModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper domain', () async {
      // arrange

      // act
      final result = tGenreModel.toJson();
      // assert
      final expectedJsonMap = {"id": 1, "name": "name"};
      expect(result, expectedJsonMap);
    });
  });

  group('toEntity', () {
    test('should return a JSON map containing proper domain', () async {
      // arrange

      // act
      final result = tGenreModel.toEntity();
      // assert
      expect(result, tGenreEntity);
    });
  });
}
