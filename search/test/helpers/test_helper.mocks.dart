// Mocks generated by Mockito 5.4.4 from annotations
// in search/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:convert' as _i14;
import 'dart:typed_data' as _i16;

import 'package:core/core.dart' as _i6;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/http.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i15;
import 'package:movie/movie.dart' as _i4;
import 'package:sqflite/sqflite.dart' as _i12;
import 'package:tv_series/data/models/tv_series_table.dart' as _i13;
import 'package:tv_series/domain/entities/episode.dart' as _i10;
import 'package:tv_series/domain/entities/tv_series.dart' as _i8;
import 'package:tv_series/domain/entities/tv_series_detail.dart' as _i9;
import 'package:tv_series/domain/repositories/tv_series_repository.dart' as _i7;
import 'package:watchlist/data/datasources/database_helper.dart' as _i11;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_1 extends _i1.SmartFake implements _i3.Response {
  _FakeResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_2 extends _i1.SmartFake
    implements _i3.StreamedResponse {
  _FakeStreamedResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i4.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>> getNowPlayingMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>>.value(
            _FakeEither_0<_i6.Failure, List<_i4.Movie>>(
          this,
          Invocation.method(
            #getNowPlayingMovies,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>> getPopularMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>>.value(
            _FakeEither_0<_i6.Failure, List<_i4.Movie>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>> getTopRatedMovies() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>>.value(
            _FakeEither_0<_i6.Failure, List<_i4.Movie>>(
          this,
          Invocation.method(
            #getTopRatedMovies,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i4.MovieDetail>> getMovieDetail(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetail,
          [id],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i4.MovieDetail>>.value(
            _FakeEither_0<_i6.Failure, _i4.MovieDetail>(
          this,
          Invocation.method(
            #getMovieDetail,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i4.MovieDetail>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>> getMovieRecommendations(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieRecommendations,
          [id],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>>.value(
            _FakeEither_0<_i6.Failure, List<_i4.Movie>>(
          this,
          Invocation.method(
            #getMovieRecommendations,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>> searchMovies(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>>.value(
            _FakeEither_0<_i6.Failure, List<_i4.Movie>>(
          this,
          Invocation.method(
            #searchMovies,
            [query],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> saveWatchlist(
          _i4.MovieDetail? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlist,
          [movie],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, String>>.value(
            _FakeEither_0<_i6.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlist,
            [movie],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, String>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> removeWatchlist(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [id],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, String>>.value(
            _FakeEither_0<_i6.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, String>>);

  @override
  _i5.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>> getWatchlistMovie() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>>.value(
            _FakeEither_0<_i6.Failure, List<_i4.Movie>>(
          this,
          Invocation.method(
            #getWatchlistMovies,
            [],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i4.Movie>>>);
}

/// A class which mocks [TvSeriesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRepository extends _i1.Mock
    implements _i7.TvSeriesRepository {
  MockTvSeriesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>
      getOnTheAirTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getOnTheAirTvSeries,
              [],
            ),
            returnValue:
                _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>.value(
                    _FakeEither_0<_i6.Failure, List<_i8.TvSeries>>(
              this,
              Invocation.method(
                #getOnTheAirTvSeries,
                [],
              ),
            )),
          ) as _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>
      getPopularTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getPopularTvSeries,
              [],
            ),
            returnValue:
                _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>.value(
                    _FakeEither_0<_i6.Failure, List<_i8.TvSeries>>(
              this,
              Invocation.method(
                #getPopularTvSeries,
                [],
              ),
            )),
          ) as _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>
      getTopRatedTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getTopRatedTvSeries,
              [],
            ),
            returnValue:
                _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>.value(
                    _FakeEither_0<_i6.Failure, List<_i8.TvSeries>>(
              this,
              Invocation.method(
                #getTopRatedTvSeries,
                [],
              ),
            )),
          ) as _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i9.TvSeriesDetail>> getDetailTvSeries(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getDetailTvSeries,
          [id],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, _i9.TvSeriesDetail>>.value(
                _FakeEither_0<_i6.Failure, _i9.TvSeriesDetail>(
          this,
          Invocation.method(
            #getDetailTvSeries,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i9.TvSeriesDetail>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>
      getRecommendedTvSeries(int? id) => (super.noSuchMethod(
            Invocation.method(
              #getRecommendedTvSeries,
              [id],
            ),
            returnValue:
                _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>.value(
                    _FakeEither_0<_i6.Failure, List<_i8.TvSeries>>(
              this,
              Invocation.method(
                #getRecommendedTvSeries,
                [id],
              ),
            )),
          ) as _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i10.Episode>>> getTvSeriesEpisode(
    int? id,
    int? seasonId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesEpisode,
          [
            id,
            seasonId,
          ],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, List<_i10.Episode>>>.value(
                _FakeEither_0<_i6.Failure, List<_i10.Episode>>(
          this,
          Invocation.method(
            #getTvSeriesEpisode,
            [
              id,
              seasonId,
            ],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i10.Episode>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>> searchTvSeries(
          String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchTvSeries,
          [query],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>.value(
                _FakeEither_0<_i6.Failure, List<_i8.TvSeries>>(
          this,
          Invocation.method(
            #searchTvSeries,
            [query],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> saveWatchlist(
          _i9.TvSeriesDetail? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveWatchlist,
          [tvSeries],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, String>>.value(
            _FakeEither_0<_i6.Failure, String>(
          this,
          Invocation.method(
            #saveWatchlist,
            [tvSeries],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, String>>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> removeWatchlist(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeWatchlist,
          [id],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, String>>.value(
            _FakeEither_0<_i6.Failure, String>(
          this,
          Invocation.method(
            #removeWatchlist,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, String>>);

  @override
  _i5.Future<bool> isAddedToWatchlist(int? id) => (super.noSuchMethod(
        Invocation.method(
          #isAddedToWatchlist,
          [id],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>
      getWatchlistTvSeries() => (super.noSuchMethod(
            Invocation.method(
              #getWatchlistTvSeries,
              [],
            ),
            returnValue:
                _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>.value(
                    _FakeEither_0<_i6.Failure, List<_i8.TvSeries>>(
              this,
              Invocation.method(
                #getWatchlistTvSeries,
                [],
              ),
            )),
          ) as _i5.Future<_i2.Either<_i6.Failure, List<_i8.TvSeries>>>);
}

/// A class which mocks [DatabaseHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelper extends _i1.Mock implements _i11.DatabaseHelper {
  MockDatabaseHelper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i12.Database?> get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _i5.Future<_i12.Database?>.value(),
      ) as _i5.Future<_i12.Database?>);

  @override
  _i5.Future<int> insertWatchlistMovie(_i4.MovieTable? movie) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistMovies,
          [movie],
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);

  @override
  _i5.Future<int> insertWatchlistTvSeries(_i13.TvSeriesTable? tvSeries) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertWatchlistTvSeries,
          [tvSeries],
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);

  @override
  _i5.Future<int> removeWatchlistMovie(int? id) => (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistMovies,
          [id],
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);

  @override
  _i5.Future<int> removeWatchlistTvSeries(int? id) => (super.noSuchMethod(
        Invocation.method(
          #removeWatchlistTvSeries,
          [id],
        ),
        returnValue: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);

  @override
  _i5.Future<Map<String, dynamic>?> getMovieById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieById,
          [id],
        ),
        returnValue: _i5.Future<Map<String, dynamic>?>.value(),
      ) as _i5.Future<Map<String, dynamic>?>);

  @override
  _i5.Future<Map<String, dynamic>?> getTvSeriesById(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTvSeriesById,
          [id],
        ),
        returnValue: _i5.Future<Map<String, dynamic>?>.value(),
      ) as _i5.Future<Map<String, dynamic>?>);

  @override
  _i5.Future<List<Map<String, dynamic>>> getWatchlistMovie() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistMovies,
          [],
        ),
        returnValue: _i5.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i5.Future<List<Map<String, dynamic>>>);

  @override
  _i5.Future<List<Map<String, dynamic>>> getWatchlistTvSeries() =>
      (super.noSuchMethod(
        Invocation.method(
          #getWatchlistTvSeries,
          [],
        ),
        returnValue: _i5.Future<List<Map<String, dynamic>>>.value(
            <Map<String, dynamic>>[]),
      ) as _i5.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i3.Client {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i14.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i5.Future<String>.value(_i15.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i5.Future<String>);

  @override
  _i5.Future<_i16.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i5.Future<_i16.Uint8List>.value(_i16.Uint8List(0)),
      ) as _i5.Future<_i16.Uint8List>);

  @override
  _i5.Future<_i3.StreamedResponse> send(_i3.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i5.Future<_i3.StreamedResponse>.value(_FakeStreamedResponse_2(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i5.Future<_i3.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}