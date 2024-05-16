import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';
import 'package:movie/movie.dart';
import 'package:tv_series/tv_series.dart';
import 'package:search/search.dart';
import 'package:watchlist/watchlist.dart';

final locator = GetIt.instance;

void init(HttpClient httpClient) {
  // provider
  // locator.registerFactory(
  //   () => MovieListNotifier(
  //     getNowPlayingMovies: locator(),
  //     getPopularMovies: locator(),
  //     getTopRatedMovies: locator(),
  //   ),
  // );
  locator.registerFactory(
    () => MovieDetailCubit(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
    ),
  );
  locator.registerFactory(
    // () => MovieSearchNotifier(
    //   searchMovies: locator(),
    // ),
    () => MoviesSearchBloc(locator()),
  );
  locator.registerFactory(
    () => PopularMoviesCubit(
      getPopularMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesCubit(getTopRatedMovies: locator()),
  );
  locator.registerFactory(
    () => NowPlayingMoviesCubit(
      getNowPlayingMovies: locator()
    ),
  );
  locator.registerFactory(
    // () => WatchlistMovieNotifier(
    //   getWatchlistMovies: locator(),
    // ),
    () => WatchlistMovieCubit(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerFactory(
    () => TvSeriesEpisodeCubit(
      tvSeriesEpisode: locator(),
    ),
  );
  // locator.registerFactory(
  //   () => TvSeriesListNotifier(
  //     getOnTheAirTvSeries: locator(),
  //     getPopularTvSeries: locator(),
  //     getTopRatedTvSeries: locator(),
  //   ),
  // );
  locator.registerFactory(
    () => TvSeriesDetailCubit(
      getTvSeriesDetail: locator(),
      getTvSeriesRecommendations: locator(),
      // getWatchlistTvSeriesStatus: locator(),
      // saveWatchlistTvSeries: locator(),
      // removeWatchlistTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    // () => TvSeriesSearchNotifier(
    //   searchTvSeries: locator(),
    // ),
    () => TvSeriesSearchBloc(locator()),
  );
  locator.registerFactory(
    () => PopularTvSeriesCubit(
      getPopularTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedTvSeriesCubit(
      getTopRatedTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    () => OnTheAirTvSeriesCubit(
      getOnTheAirTvSeries: locator(),
    ),
  );
  locator.registerFactory(
    // () => WatchlistTvSeriesNotifier(
    //   getWatchlistTvSeries: locator(),
    // ),
    () => WatchlistTvSeriesCubit(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovieStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovie(locator()));

  locator.registerLazySingleton(() => GetTvSeriesEpisode(locator()));
  locator.registerLazySingleton(() => GetOnTheAirTvSeries(locator()));
  locator.registerLazySingleton(() => GetPopularTvSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvSeries(locator()));
  locator.registerLazySingleton(() => GetTvSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetTvSeriesRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvSeriesStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvSeries(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TvSeriesRepository>(
    () => TvSeriesRepositoryImpl(
      tvSeriesLocalDataSource: locator(),
      tvSeriesRemoteDataSource: locator(),
    ),
  );

  // domain sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TvSeriesRemoteDataSource>(
      () => TvSeriesRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvSeriesLocalDataSource>(
      () => TvSeriesLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // external
  locator.registerLazySingleton(() => IOClient(httpClient));
}
