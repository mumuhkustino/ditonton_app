import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/watchlist/remove_watchlist_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/movie/dummy_objects_movie.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveWatchlistMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = RemoveWatchlistMovies(mockMovieRepository);
  });

  test('should remove watchlist movie from repository', () async {
    // arrange
    when(mockMovieRepository.removeWatchlist(testMovieDetail.id))
        .thenAnswer((_) async => const Right('Removed from watchlist'));
    // act
    final result = await usecase.execute(testMovieDetail.id);
    // assert
    verify(mockMovieRepository.removeWatchlist(testMovieDetail.id));
    expect(result, const Right('Removed from watchlist'));
  });
}
