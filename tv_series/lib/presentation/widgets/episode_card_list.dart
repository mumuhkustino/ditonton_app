import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/styles/colors.dart';
import 'package:core/styles/text_styles.dart';
import 'package:core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/tv_series.dart';

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
      context
          .read<TvSeriesEpisodeCubit>()
          .fetchEpisodeTv(widget.id, widget.seasonId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvSeriesEpisodeCubit, TvSeriesEpisodeState>(
      builder: (context, state) {
        if (state is TvSeriesEpisodeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TvSeriesEpisodeError) {
          return Text(key: const Key("error_episode"), state.message);
        } else if (state is TvSeriesEpisodeLoaded) {
          return ListView.builder(
            key: const Key("episode_list"),
            itemCount: state.episode.length,
            itemBuilder: (context, index) {
              final episode = state.episode[index];
              [index];
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
        } else if (state is TvSeriesEpisodeInitial) {
          return const Center(
            key: Key('empty_message'),
            child: Text('Episode not found'),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
