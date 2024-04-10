import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series/episode.dart';
import 'package:ditonton/domain/repositories/tv_series/tv_series_repository.dart';

class GetTvSeriesEpisode {
  final TvSeriesRepository repository;

  GetTvSeriesEpisode(this.repository);

  Future<Either<Failure, List<Episode>>> execute(int id, int seasonId) {
    return repository.getTvSeriesEpisode(id, seasonId);
  }
}
