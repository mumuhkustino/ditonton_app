import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/season.dart';

class SeasonModel extends Equatable {
  final String? airDate;
  final int? episodeCount;
  final int? id;
  final String? name;
  final String? overview;
  final String? posterPath;
  final int? seasonNumber;
  final double? voteAverage;

  const SeasonModel({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> map) => SeasonModel(
        airDate: map['air_date'] ?? '',
        episodeCount: map['episode_count'],
        id: map['id'],
        name: map['name'],
        overview: map['overview'],
        posterPath: map['poster_path'],
        seasonNumber: map['season_number'],
        voteAverage: map['vote_average'],
      );

  Map<String, dynamic> toJson() => {
        'air_date': airDate,
        'episode_count': episodeCount,
        'id': id,
        'name': name,
        'overview': overview,
        'poster_path': posterPath,
        'season_number': seasonNumber,
        'vote_average': voteAverage,
      };

  Season toEntity() => Season(
        airDate: airDate ?? '',
        episodeCount: episodeCount,
        id: id,
        name: name,
        overview: overview,
        posterPath: posterPath,
        seasonNumber: seasonNumber,
        voteAverage: voteAverage,
      );

  @override
  List<Object?> get props => [
        airDate,
        episodeCount,
        id,
        name,
        overview,
        posterPath,
        seasonNumber,
        voteAverage,
      ];
}
