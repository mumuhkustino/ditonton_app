import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tv_series/tv_series.dart';
import 'package:watchlist/watchlist.dart';

class TvSeriesDetailPage extends StatefulWidget {
  final int id;
  const TvSeriesDetailPage({super.key, required this.id});

  @override
  State<TvSeriesDetailPage> createState() => _TvSeriesDetailPageState();
}

class _TvSeriesDetailPageState extends State<TvSeriesDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<TvSeriesDetailCubit>().fetchTvSeriesDetail(widget.id);
      context
          .read<WatchlistTvSeriesCubit>()
          .loadWatchlistTvSeriesStatus(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WatchlistTvSeriesCubit, WatchlistTvSeriesState>(
      listenWhen: (context, state) =>
          state is WatchlistTvSeriesMessage || state is WatchlistTvSeriesError,
      listener: (context, state) {
        if (state is WatchlistTvSeriesMessage) {
          if (state.message == WatchlistTvSeriesCubit.addWatchlistMessage ||
              state.message == WatchlistTvSeriesCubit.removeWatchlistMessage) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text(state.message),
                duration: const Duration(seconds: 3),
                margin: const EdgeInsets.symmetric(horizontal: 8),
              ),
            );
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(state.message),
                  );
                });
          }
        } else if (state is WatchlistTvSeriesError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(state.error),
                );
              });
        }
      },
      child: Scaffold(
        body: BlocBuilder<TvSeriesDetailCubit, TvSeriesDetailState>(
          builder: (context, state) {
            return BlocBuilder<WatchlistTvSeriesCubit, WatchlistTvSeriesState>(
              builder: (context, stateWatchlist) {
                if (state is TvSeriesDetailLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TvSeriesDetailLoaded &&
                    stateWatchlist is WatchlistTvSeriesStatus) {
                  final tvSeries = state.tvSeriesDetail;
                  return SafeArea(
                    child: DetailContent(
                      tvSeries,
                      state.recommendationTvSeries,
                      stateWatchlist.isAddedToWatchlist,
                    ),
                  );
                } else if (state is TvSeriesRecommendationError && stateWatchlist is WatchlistTvSeriesStatus) {
                  final tvSeries = state.tvSeriesDetail;
                  return SafeArea(
                    child: DetailContent(
                      tvSeries,
                      state.recommendationTvSeries,
                      stateWatchlist.isAddedToWatchlist,
                    ),
                  );
                } else if (state is TvSeriesDetailError) {
                  return Text(state.message);
                } else {
                  return const SizedBox.shrink();
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class DetailContent extends StatefulWidget {
  final TvSeriesDetail tvSeries;
  final List<TvSeries> recommendations;
  final bool isAddedWatchlist;

  const DetailContent(
      this.tvSeries, this.recommendations, this.isAddedWatchlist,
      {super.key});

  @override
  State<DetailContent> createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: widget.tvSeries.seasons?.length ?? 0,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '$baseImageUrl${widget.tvSeries.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.tvSeries.name ?? '-',
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                TvSeriesDetail data = widget.tvSeries;
                                if (!widget.isAddedWatchlist) {
                                  context.read<WatchlistTvSeriesCubit>()
                                    ..addWatchlistTvSeries(data)
                                    ..fetchWatchlistTvSeries();
                                } else {
                                  context.read<WatchlistTvSeriesCubit>()
                                    ..deleteWatchlistTvSeries(data.id)
                                    ..fetchWatchlistTvSeries();
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  widget.isAddedWatchlist
                                      ? const Icon(Icons.check)
                                      : const Icon(Icons.add),
                                  const Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(
                              widget.tvSeries.genres != null
                                  ? _showGenres(widget.tvSeries.genres!)
                                  : '-',
                            ),
                            Text(
                              widget.tvSeries.episodeRunTime != null &&
                                      widget.tvSeries.episodeRunTime!
                                          .isNotEmpty &&
                                      widget.tvSeries.episodeRunTime!.first !=
                                          null
                                  ? _showDuration(
                                      widget.tvSeries.episodeRunTime!.first!)
                                  : '-',
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: widget.tvSeries.voteAverage ?? 0 / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${widget.tvSeries.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            TabBar(
                                controller: tabController,
                                isScrollable: true,
                                indicatorColor: kMikadoYellow,
                                labelPadding: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                tabs: widget.tvSeries.seasons != null
                                    ? widget.tvSeries.seasons!
                                        .map((season) =>
                                            Text(season?.name ?? '-'))
                                        .toList()
                                    : []),
                            SizedBox(
                              height: 250,
                              child: TabBarView(
                                controller: tabController,
                                children: widget.tvSeries.seasons != null
                                    ? widget.tvSeries.seasons!
                                        .map((season) => season != null &&
                                                season.seasonNumber != null
                                            ? EpisodeCardList(
                                                id: widget.tvSeries.id,
                                                seasonId: season.seasonNumber!,
                                              )
                                            : const SizedBox())
                                        .toList()
                                    : [],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              widget.tvSeries.overview ?? '-',
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            BlocBuilder<TvSeriesDetailCubit,
                                TvSeriesDetailState>(
                              builder: (context, state) {
                                if (state is TvSeriesRecommendationLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state
                                    is TvSeriesRecommendationError) {
                                  return Text(
                                      key: const Key("error_message"),
                                      state.message);
                                } else if (state is TvSeriesDetailLoaded) {
                                  if (widget.recommendations.isNotEmpty) {
                                    return SizedBox(
                                      height: 150,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          final tvSeries =
                                              widget.recommendations[index];
                                          return Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pushReplacementNamed(
                                                  context,
                                                  tvSeriesDetailRoute,
                                                  arguments: tvSeries.id,
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      '$baseImageUrl${tvSeries.posterPath}',
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        itemCount:
                                            widget.recommendations.length,
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                      child: Text(
                                          "No recommendations for this tv series"),
                                    );
                                  }
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            minChildSize: 0.25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<Genre?> genres) {
    String result = '';
    for (var genre in genres) {
      if (genre != null) {
        result += '${genre.name}, ';
      }
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
