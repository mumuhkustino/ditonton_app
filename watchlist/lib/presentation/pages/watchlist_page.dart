import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watchlist/watchlist.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage>
    with SingleTickerProviderStateMixin {
  final List<String> type = ['Movie', 'Tv Series'];
  late TabController tabController =
      TabController(length: type.length, vsync: this);

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<WatchlistMovieCubit>().fetchWatchlistMovies();
      context.read<WatchlistTvSeriesCubit>().fetchWatchlistTvSeries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Movies'),
              onTap: () {
                Navigator.pushNamed(context, homeMovieRoute);
              },
            ),
            ListTile(
              leading: const Icon(Icons.tv_rounded),
              title: const Text('Tv Series'),
              onTap: () {
                Navigator.pushNamed(context, homeTvSeriesRoute);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist'),
              onTap: () {
                Navigator.popAndPushNamed(context, watchlistRoute);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, aboutRoute);
              },
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.center,
            controller: tabController,
            isScrollable: true,
            indicatorColor: kMikadoYellow,
            labelPadding: const EdgeInsets.all(4),
            padding: const EdgeInsets.all(4),
            tabs: type.map((item) => Text(item)).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [WatchlistMoviePage(), WatchlistTvSeriesPage()],
            ),
          )
        ],
      ),
    );
  }
}
