import 'package:core/core.dart';
import 'package:tv_series/tv_series.dart';

const testTvSeries = TvSeries(
  adult: false,
  backdropPath: "/xs2v0K7iKAuR4YtKOw7TEcDIX63.jpg",
  genreIds: [16, 10759, 10765],
  id: 105971,
  originCountry: ["US"],
  originalLanguage: "en",
  originalName: "Star Wars: The Bad Batch",
  overview:
      "The 'Bad Batch' of elite and experimental clones make their way through an ever-changing galaxy in the immediate aftermath of the Clone Wars.",
  popularity: 531.528,
  posterPath: "/5mHus672nuinyaE0FtqvD0AddcY.jpg",
  firstAirDate: "2021-05-04",
  name: "Star Wars: The Bad Batch",
  voteAverage: 8.247,
  voteCount: 881,
);

final testTvSeriesList = [testTvSeries];

const testTvSeriesDetail = TvSeriesDetail(
  adult: false,
  backdropPath: 'backdropPath',
  episodeRunTime: [120],
  firstAirDate: 'firstAirDate',
  genres: [Genre(id: 1, name: "Animation")],
  id: 1,
  inProduction: false,
  languages: ['en'],
  lastAirDate: 'lastAirDate',
  name: 'name',
  numberOfEpisodes: 1,
  numberOfSeasons: 1,
  originCountry: ['US'],
  originalLanguage: 'en',
  originalName: 'originalName',
  overview: 'overview',
  popularity: 1,
  posterPath: 'posterPath',
  seasons: [
    Season(
      airDate: 'airDate',
      episodeCount: 1,
      id: 1,
      name: 'name',
      overview: 'overview',
      posterPath: 'posterPath',
      seasonNumber: 1,
      voteAverage: 1.0,
    ),
  ],
  status: 'status',
  tagline: 'tagline',
  type: 'type',
  voteAverage: 1.0,
  voteCount: 1,
);

const testTvSeriesDetailShort = TvSeriesDetail(
  adult: false,
  backdropPath: 'backdropPath',
  episodeRunTime: [50],
  firstAirDate: 'firstAirDate',
  genres: [Genre(id: 1, name: "Animation")],
  id: 1,
  inProduction: false,
  languages: ['en'],
  lastAirDate: 'lastAirDate',
  name: 'name',
  numberOfEpisodes: 1,
  numberOfSeasons: 1,
  originCountry: ['US'],
  originalLanguage: 'en',
  originalName: 'originalName',
  overview: 'overview',
  popularity: 1,
  posterPath: 'posterPath',
  seasons: [
    Season(
      airDate: 'airDate',
      episodeCount: 1,
      id: 1,
      name: 'name',
      overview: 'overview',
      posterPath: 'posterPath',
      seasonNumber: 1,
      voteAverage: 1.0,
    ),
  ],
  status: 'status',
  tagline: 'tagline',
  type: 'type',
  voteAverage: 1.0,
  voteCount: 1,
);

const testTvSeriesDetailNoSeason = TvSeriesDetail(
  adult: false,
  backdropPath: 'backdropPath',
  episodeRunTime: [120],
  firstAirDate: 'firstAirDate',
  genres: [Genre(id: 1, name: "Animation")],
  id: 1,
  inProduction: false,
  languages: ['en'],
  lastAirDate: 'lastAirDate',
  name: 'name',
  numberOfEpisodes: 1,
  numberOfSeasons: 1,
  originCountry: ['US'],
  originalLanguage: 'en',
  originalName: 'originalName',
  overview: 'overview',
  popularity: 1,
  posterPath: 'posterPath',
  seasons: null,
  status: 'status',
  tagline: 'tagline',
  type: 'type',
  voteAverage: 1.0,
  voteCount: 1,
);

const testTvSeriesEpisode = Episode(
  airDate: "airDate",
  episodeNumber: 1,
  id: 1,
  name: "name",
  overview: "overview",
  seasonNumber: 1,
  stillPath: "stillPath",
  voteAverage: 1.0,
  voteCount: 1,
);

const testWatchlistTvSeries = TvSeries.watchlist(
  id: 1,
  name: 'name',
  overview: 'overview',
  posterPath: 'posterPath',
);

const testTvSeriesTable = TvSeriesTable(
  id: 1,
  name: 'name',
  overview: 'overview',
  posterPath: 'posterPath',
);

final testTvSeriesMap = {
  'id': 1,
  'name': 'name',
  'overview': 'overview',
  'posterPath': 'posterPath',
};
