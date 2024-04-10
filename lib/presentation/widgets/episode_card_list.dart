import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_series/tv_series_episode_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EpisodeCardList extends StatefulWidget {
  final int id;
  final int seasonId;

  const EpisodeCardList({
    super.key,
    required this.id,
    required this.seasonId,
  });

  @override
  State<EpisodeCardList> createState() => _EpisodeCardListState();
}

class _EpisodeCardListState extends State<EpisodeCardList>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<TvSeriesEpisodeNotifier>(context, listen: false)
          .fetchTvSeriesEpisode(widget.id, widget.seasonId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TvSeriesEpisodeNotifier>(
      builder: (context, data, child) {
        if (data.tvSeriesState == RequestState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (data.tvSeriesState == RequestState.error) {
          return Text(key: const Key("error_episode"), data.message);
        } else if (data.tvSeriesState == RequestState.loaded) {
          return ListView.builder(
            itemCount: data.tvSeriesEpisode.length,
            itemBuilder: (context, index) {
              final episode = data.tvSeriesEpisode[index];
              return Container(
                width: 350,
                margin: const EdgeInsets.only(left: 8, bottom: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: kGrey),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: episode.stillPath.isEmpty
                          ? const SizedBox(
                              width: 100,
                              height: 100,
                              child: Icon(Icons.error),
                            )
                          : CachedNetworkImage(
                              imageUrl: '$baseImageUrl${episode.stillPath}',
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Episode ${episode.episodeNumber}',
                            style: kHeading6,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            episode.name,
                            style: kBodyText.copyWith(color: kMikadoYellow),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            episode.overview,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
