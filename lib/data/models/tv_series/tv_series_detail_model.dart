import 'package:ditonton/data/models/tv_series/episode_model.dart';
import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/tv_series/season_model.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series_detail.dart';
import 'package:equatable/equatable.dart';

class TvSeriesDetailModel extends Equatable {
  final bool adult;
  final String? backdropPath;
  final List<int>? episodeRunTime;
  final String? firstAirDate;
  final List<GenreModel?>? genres;
  final String? homepage;
  final int id;
  final bool inProduction;
  final List<String>? languages;
  final String? lastAirDate;
  final EpisodeModel? lastEpisodeToAir;
  final String? name;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<SeasonModel?>? seasons;
  final String? status;
  final String? tagline;
  final String type;
  final double? voteAverage;
  final int? voteCount;

  const TvSeriesDetailModel({
    required this.adult,
    required this.backdropPath,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.seasons,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvSeriesDetailModel.fromJson(Map<String, dynamic> map) =>
      TvSeriesDetailModel(
        adult: map['adult'],
        backdropPath: map['backdrop_path'],
        episodeRunTime:
            List<int>.from(map['episode_run_time'].map((item) => item)),
        firstAirDate: map['first_air_date'],
        genres: List<GenreModel?>.from(
            map['genres'].map((item) => GenreModel.fromJson(item)).toList()),
        homepage: map['homepage'],
        id: map['id'],
        inProduction: map['in_production'],
        languages: List<String>.from(map['languages'].map((item) => item)),
        lastAirDate: map['last_air_date'],
        lastEpisodeToAir: EpisodeModel.fromJson(map['last_episode_to_air']),
        name: map['name'],
        numberOfEpisodes: map['number_of_episodes'],
        numberOfSeasons: map['number_of_seasons'],
        originCountry:
            List<String>.from(map['origin_country'].map((item) => item)),
        originalLanguage: map['original_language'],
        originalName: map['original_name'],
        overview: map['overview'],
        popularity: map['popularity'],
        posterPath: map['poster_path'],
        seasons: List<SeasonModel?>.from(
            map['seasons'].map((item) => SeasonModel.fromJson(item)).toList()),
        status: map['status'],
        tagline: map['tagline'],
        type: map['type'],
        voteAverage: map['vote_average'],
        voteCount: map['vote_count'],
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'episode_run_time': episodeRunTime != null
            ? List<int?>.from(episodeRunTime!.map((item) => item)).toList()
            : null,
        'first_air_date': firstAirDate,
        'genres': genres != null
            ? List<GenreModel?>.from(genres!.map((item) => item)).toList()
            : null,
        'homepage': homepage,
        'id': id,
        'in_production': inProduction,
        'languages': languages != null
            ? List<String?>.from(languages!.map((item) => item)).toList()
            : null,
        'last_air_date': lastAirDate,
        'last_episode_to_air': lastEpisodeToAir?.toJson(),
        'name': name,
        'number_of_episodes': numberOfEpisodes,
        'number_of_seasons': numberOfSeasons,
        'origin_country': originCountry != null
            ? List<String?>.from(originCountry!.map((item) => item)).toList()
            : null,
        'original_language': originalLanguage,
        'original_name': originalName,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'seasons': seasons != null
            ? List<SeasonModel?>.from(seasons!.map((item) => item)).toList()
            : null,
        'status': status,
        'tagline': tagline,
        'type': type,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };

  TvSeriesDetail toEntity() => TvSeriesDetail(
        adult: adult,
        backdropPath: backdropPath,
        episodeRunTime: episodeRunTime?.map((item) => item).toList(),
        firstAirDate: firstAirDate,
        genres: genres?.map((item) => item?.toEntity()).toList(),
        id: id,
        inProduction: inProduction,
        languages: languages?.map((item) => item).toList(),
        lastAirDate: lastAirDate,
        name: name,
        numberOfEpisodes: numberOfEpisodes,
        numberOfSeasons: numberOfSeasons,
        originCountry: originCountry?.map((item) => item).toList(),
        originalLanguage: originalLanguage,
        originalName: originalName,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        seasons: seasons?.map((item) => item?.toEntity()).toList(),
        status: status,
        tagline: tagline,
        type: type,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        episodeRunTime,
        firstAirDate,
        genres,
        homepage,
        id,
        inProduction,
        languages,
        lastAirDate,
        lastEpisodeToAir,
        name,
        numberOfEpisodes,
        numberOfSeasons,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        seasons,
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
      ];
}
