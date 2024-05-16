import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:tv_series/domain/entities/episode.dart';
import 'package:tv_series/domain/repositories/tv_series_repository.dart';

class GetTvSeriesEpisode {
  final TvSeriesRepository repository;

  GetTvSeriesEpisode(this.repository);

  Future<Either<Failure, List<Episode>>> execute(int id, int seasonId) {
    return repository.getTvSeriesEpisode(id, seasonId);
  }
}
