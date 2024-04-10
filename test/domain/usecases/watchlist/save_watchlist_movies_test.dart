import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/watchlist/save_watchlist_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/movie/dummy_objects_movie.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late SaveWatchlistMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = SaveWatchlistMovies(mockMovieRepository);
  });

  test('should save movie to the repository', () async {
    // arrange
    when(mockMovieRepository.saveWatchlist(testMovieDetail))
        .thenAnswer((_) async => const Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(testMovieDetail);
    // assert
    verify(mockMovieRepository.saveWatchlist(testMovieDetail));
    expect(result, const Right('Added to Watchlist'));
  });
}