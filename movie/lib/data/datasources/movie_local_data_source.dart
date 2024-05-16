import 'package:core/utils/exception.dart';
import 'package:movie/data/models/movie_table.dart';
import 'package:watchlist/data/datasources/database_helper.dart';

abstract class MovieLocalDataSource {
  Future<String> insertWatchlistMovie(MovieTable movie);
  Future<String> removeWatchlistMovie(int id);
  Future<MovieTable?> getMovieById(int id);
  Future<List<MovieTable>> getWatchlistMovie();
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  final DatabaseHelper databaseHelper;

  MovieLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchlistMovie(MovieTable movie) async {
    try {
      await databaseHelper.insertWatchlistMovie(movie);
      return 'Added to Watchlist Movie';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlistMovie(int id) async {
    try {
      await databaseHelper.removeWatchlistMovie(id);
      return 'Removed from Watchlist Movie';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<MovieTable?> getMovieById(int id) async {
    final result = await databaseHelper.getMovieById(id);
    if (result != null) {
      return MovieTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<MovieTable>> getWatchlistMovie() async {
    final result = await databaseHelper.getWatchlistMovie();
    return result.map((data) => MovieTable.fromMap(data)).toList();
  }
}
