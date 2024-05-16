import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv_series.dart';
import 'package:tv_series/domain/entities/tv_series_detail.dart';

class TvSeriesTable extends Equatable {
  final int? id;
  final String? name;
  final String? overview;
  final String? posterPath;

  const TvSeriesTable({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
  });

  factory TvSeriesTable.fromMap(Map<String, dynamic> map) => TvSeriesTable(
        id: map['id'],
        name: map['name'],
        overview: map['overview'],
        posterPath: map['posterPath'],
      );

  factory TvSeriesTable.fromEntity(TvSeriesDetail tvSeriesDetail) =>
      TvSeriesTable(
        id: tvSeriesDetail.id,
        name: tvSeriesDetail.name,
        overview: tvSeriesDetail.overview,
        posterPath: tvSeriesDetail.posterPath,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'overview': overview,
        'posterPath': posterPath,
      };

  TvSeries toEntity() => TvSeries.watchlist(
        id: id!,
        name: name,
        overview: overview,
        posterPath: posterPath,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        overview,
        posterPath,
      ];
}
