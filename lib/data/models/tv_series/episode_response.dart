import 'package:ditonton/data/models/tv_series/episode_model.dart';
import 'package:equatable/equatable.dart';

class EpisodeResponse extends Equatable {
  final List<EpisodeModel> episodeList;

  const EpisodeResponse({required this.episodeList});

  factory EpisodeResponse.fromJson(Map<String, dynamic> json) =>
      EpisodeResponse(
          episodeList: List<EpisodeModel>.from((json['episodes'] as List)
              .map((item) => EpisodeModel.fromJson(item))));

  Map<String, dynamic> toJson() => {
        "episodes": List<dynamic>.from(episodeList.map((item) => item.toJson()))
      };

  @override
  List<Object?> get props => [episodeList];
}
