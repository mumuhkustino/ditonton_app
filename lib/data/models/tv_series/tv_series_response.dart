import 'package:ditonton/data/models/tv_series/tv_series_model.dart';
import 'package:equatable/equatable.dart';

class TvSeriesResponse extends Equatable {
  final List<TvSeriesModel> tvSeriesList;

  const TvSeriesResponse({required this.tvSeriesList});

  factory TvSeriesResponse.fromJson(Map<String, dynamic> json) =>
      TvSeriesResponse(
        tvSeriesList: List<TvSeriesModel>.from((json["results"] as List)
            .map((item) => TvSeriesModel.fromJson(item))
            .where((element) => element.posterPath != null)),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(tvSeriesList.map(
          (item) => item.toJson(),
        ))
      };

  @override
  List<Object?> get props => [tvSeriesList];
}
