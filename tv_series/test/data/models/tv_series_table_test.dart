import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  const tTvSeriesTable = TvSeriesTable(
    id: 1,
    name: "name",
    overview: "overview",
    posterPath: "posterPath",
  );

  const tTvSeries = {
    "id": 1,
    "name": "name",
    "overview": "overview",
    "posterPath": "posterPath"
  };

  group('toJson', () {
    test('should return a JSON map containing proper domain', () async {
      // arrange

      // act
      final result = tTvSeriesTable.toJson();
      // assert
      expect(result, tTvSeries);
    });
  });
}
