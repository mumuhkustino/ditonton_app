import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:movie/domain/entities/movie.dart';
import 'package:movie/domain/repositories/movie_repository.dart';

class GetWatchlistMovie {
  final MovieRepository _repository;

  GetWatchlistMovie(this._repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return _repository.getWatchlistMovie();
  }
}
