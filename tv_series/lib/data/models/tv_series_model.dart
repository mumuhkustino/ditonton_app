import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv_series.dart';

class TvSeriesModel extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? firstAirDate;
  final String? name;
  final double? voteAverage;
  final int? voteCount;

  const TvSeriesModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvSeriesModel.fromJson(Map<String, dynamic> map) => TvSeriesModel(
        adult: map['adult'],
        backdropPath: map['backdrop_path'],
        genreIds: List<int>.from(map['genre_ids'].map((x) => x)).toList(),
        id: map['id'],
        originCountry:
            List<String>.from(map['origin_country'].map((x) => x)).toList(),
        originalLanguage: map['original_language'],
        originalName: map['original_name'],
        overview: map['overview'],
        popularity: map['popularity'].toDouble(),
        posterPath: map['poster_path'],
        firstAirDate: map['first_air_date'],
        name: map['name'],
        voteAverage: map['vote_average'].toDouble(),
        voteCount: map['vote_count'],
      );

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': List<int>.from(genreIds!.map((x) => x)).toList(),
        'id': id,
        'origin_country':
            List<String>.from(originCountry!.map((x) => x)).toList(),
        'original_language': originalLanguage,
        'original_name': originalName,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'first_air_date': firstAirDate,
        'name': name,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };

  TvSeries toEntity() => TvSeries(
        adult: adult,
        backdropPath: backdropPath,
        genreIds: genreIds,
        id: id,
        originCountry: originCountry,
        originalLanguage: originalLanguage,
        originalName: originalName,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        firstAirDate: firstAirDate,
        name: name,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        firstAirDate,
        name,
        voteAverage,
        voteCount,
      ];
}
