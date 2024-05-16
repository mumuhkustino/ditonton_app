import 'dart:ui';

import 'package:about/about.dart';
import 'package:core/core.dart';
import 'package:ditonton/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movie.dart';
import 'package:provider/provider.dart';
import 'package:tv_series/tv_series.dart';
import 'package:search/search.dart';
import 'package:watchlist/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:ditonton/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  di.init(await getHttpClient());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<MovieDetailCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<MoviesSearchBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<NowPlayingMoviesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedMoviesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMoviesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistMovieCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSeriesEpisodeCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSeriesDetailCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TvSeriesSearchBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<OnTheAirTvSeriesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedTvSeriesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularTvSeriesCubit>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistTvSeriesCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: kMikadoYellow,
            foregroundColor: kRichBlack,
          )),
        ),
        home: const HomeMoviesPage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case homeMovieRoute:
              return MaterialPageRoute(builder: (_) => const HomeMoviesPage());
            case homeTvSeriesRoute:
              return MaterialPageRoute(
                  builder: (_) => const HomeTvSeriesPage());
            case nowPlayingMoviesRoute:
              return CupertinoPageRoute(
                  builder: (_) => const NowPlayingMoviesPage());
            case popularMoviesRoute:
              return CupertinoPageRoute(
                  builder: (_) => const PopularMoviesPage());
            case topRatedMoviesRoute:
              return CupertinoPageRoute(
                  builder: (_) => const TopRatedMoviesPage());
            case movieDetailRoute:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case searchMoviesRoute:
              return CupertinoPageRoute(
                  builder: (_) => const SearchMoviesPage());
            case watchlistMoviesRoute:
              return MaterialPageRoute(
                  builder: (_) => const WatchlistMoviePage());
            case onTheAirTvSeriesRoute:
              return CupertinoPageRoute(
                  builder: (_) => const OnTheAirTvSeriesPage());
            case popularTvSeriesRoute:
              return CupertinoPageRoute(
                  builder: (_) => const PopularTvSeriesPage());
            case topRatedTvSeriesRoute:
              return CupertinoPageRoute(
                  builder: (_) => const TopRatedTvSeriesPage());
            case tvSeriesDetailRoute:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvSeriesDetailPage(id: id),
                settings: settings,
              );
            case searchTvSeriesRoute:
              return CupertinoPageRoute(
                  builder: (_) => const SearchTvSeriesPage());
            case watchlistTvSeriesRoute:
              return MaterialPageRoute(
                  builder: (_) => const WatchlistTvSeriesPage());
            case aboutRoute:
              return MaterialPageRoute(builder: (_) => const AboutPage());
            case watchlistRoute:
              return MaterialPageRoute(builder: (_) => const WatchlistPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
