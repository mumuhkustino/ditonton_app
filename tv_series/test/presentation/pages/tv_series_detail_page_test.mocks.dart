// Mocks generated by Mockito 5.4.4 from annotations
// in tv_series/test/presentation/pages/tv_series_detail_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_bloc/flutter_bloc.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tv_series/tv_series.dart' as _i2;
import 'package:watchlist/watchlist.dart' as _i3;

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

class _FakeGetTvSeriesDetail_0 extends _i1.SmartFake
    implements _i2.GetTvSeriesDetail {
  _FakeGetTvSeriesDetail_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetTvSeriesRecommendations_1 extends _i1.SmartFake
    implements _i2.GetTvSeriesRecommendations {
  _FakeGetTvSeriesRecommendations_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvSeriesDetailState_2 extends _i1.SmartFake
    implements _i2.TvSeriesDetailState {
  _FakeTvSeriesDetailState_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetWatchlistTvSeries_3 extends _i1.SmartFake
    implements _i3.GetWatchlistTvSeries {
  _FakeGetWatchlistTvSeries_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetWatchlistTvSeriesStatus_4 extends _i1.SmartFake
    implements _i3.GetWatchlistTvSeriesStatus {
  _FakeGetWatchlistTvSeriesStatus_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSaveWatchlistTvSeries_5 extends _i1.SmartFake
    implements _i3.SaveWatchlistTvSeries {
  _FakeSaveWatchlistTvSeries_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRemoveWatchlistTvSeries_6 extends _i1.SmartFake
    implements _i3.RemoveWatchlistTvSeries {
  _FakeRemoveWatchlistTvSeries_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWatchlistTvSeriesState_7 extends _i1.SmartFake
    implements _i3.WatchlistTvSeriesState {
  _FakeWatchlistTvSeriesState_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetTvSeriesEpisode_8 extends _i1.SmartFake
    implements _i2.GetTvSeriesEpisode {
  _FakeGetTvSeriesEpisode_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvSeriesEpisodeState_9 extends _i1.SmartFake
    implements _i2.TvSeriesEpisodeState {
  _FakeTvSeriesEpisodeState_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TvSeriesDetailCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesDetailCubit extends _i1.Mock
    implements _i2.TvSeriesDetailCubit {
  MockTvSeriesDetailCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetTvSeriesDetail get getTvSeriesDetail => (super.noSuchMethod(
        Invocation.getter(#getTvSeriesDetail),
        returnValue: _FakeGetTvSeriesDetail_0(
          this,
          Invocation.getter(#getTvSeriesDetail),
        ),
      ) as _i2.GetTvSeriesDetail);

  @override
  _i2.GetTvSeriesRecommendations get getTvSeriesRecommendations =>
      (super.noSuchMethod(
        Invocation.getter(#getTvSeriesRecommendations),
        returnValue: _FakeGetTvSeriesRecommendations_1(
          this,
          Invocation.getter(#getTvSeriesRecommendations),
        ),
      ) as _i2.GetTvSeriesRecommendations);

  @override
  _i2.TvSeriesDetailState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeTvSeriesDetailState_2(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.TvSeriesDetailState);

  @override
  _i4.Stream<_i2.TvSeriesDetailState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i4.Stream<_i2.TvSeriesDetailState>.empty(),
      ) as _i4.Stream<_i2.TvSeriesDetailState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void fetchTvSeriesDetail(int? id) => super.noSuchMethod(
        Invocation.method(
          #fetchTvSeriesDetail,
          [id],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i2.TvSeriesDetailState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i5.Change<_i2.TvSeriesDetailState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [WatchlistTvSeriesCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockWatchlistTvSeriesCubit extends _i1.Mock
    implements _i3.WatchlistTvSeriesCubit {
  MockWatchlistTvSeriesCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.GetWatchlistTvSeries get getWatchlistTvSeries => (super.noSuchMethod(
        Invocation.getter(#getWatchlistTvSeries),
        returnValue: _FakeGetWatchlistTvSeries_3(
          this,
          Invocation.getter(#getWatchlistTvSeries),
        ),
      ) as _i3.GetWatchlistTvSeries);

  @override
  _i3.GetWatchlistTvSeriesStatus get getWatchlistTvSeriesStatus =>
      (super.noSuchMethod(
        Invocation.getter(#getWatchlistTvSeriesStatus),
        returnValue: _FakeGetWatchlistTvSeriesStatus_4(
          this,
          Invocation.getter(#getWatchlistTvSeriesStatus),
        ),
      ) as _i3.GetWatchlistTvSeriesStatus);

  @override
  _i3.SaveWatchlistTvSeries get saveWatchlistTvSeries => (super.noSuchMethod(
        Invocation.getter(#saveWatchlistTvSeries),
        returnValue: _FakeSaveWatchlistTvSeries_5(
          this,
          Invocation.getter(#saveWatchlistTvSeries),
        ),
      ) as _i3.SaveWatchlistTvSeries);

  @override
  _i3.RemoveWatchlistTvSeries get removeWatchlistTvSeries =>
      (super.noSuchMethod(
        Invocation.getter(#removeWatchlistTvSeries),
        returnValue: _FakeRemoveWatchlistTvSeries_6(
          this,
          Invocation.getter(#removeWatchlistTvSeries),
        ),
      ) as _i3.RemoveWatchlistTvSeries);

  @override
  _i3.WatchlistTvSeriesState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeWatchlistTvSeriesState_7(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.WatchlistTvSeriesState);

  @override
  _i4.Stream<_i3.WatchlistTvSeriesState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i4.Stream<_i3.WatchlistTvSeriesState>.empty(),
      ) as _i4.Stream<_i3.WatchlistTvSeriesState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void loadWatchlistTvSeriesStatus(int? id) => super.noSuchMethod(
        Invocation.method(
          #loadWatchlistTvSeriesStatus,
          [id],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void fetchWatchlistTvSeries() => super.noSuchMethod(
        Invocation.method(
          #fetchWatchlistTvSeries,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addWatchlistTvSeries(_i2.TvSeriesDetail? tvSeries) => super.noSuchMethod(
        Invocation.method(
          #addWatchlistTvSeries,
          [tvSeries],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void deleteWatchlistTvSeries(int? id) => super.noSuchMethod(
        Invocation.method(
          #deleteWatchlistTvSeries,
          [id],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i3.WatchlistTvSeriesState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i5.Change<_i3.WatchlistTvSeriesState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [TvSeriesEpisodeCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesEpisodeCubit extends _i1.Mock
    implements _i2.TvSeriesEpisodeCubit {
  MockTvSeriesEpisodeCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetTvSeriesEpisode get tvSeriesEpisode => (super.noSuchMethod(
        Invocation.getter(#tvSeriesEpisode),
        returnValue: _FakeGetTvSeriesEpisode_8(
          this,
          Invocation.getter(#tvSeriesEpisode),
        ),
      ) as _i2.GetTvSeriesEpisode);

  @override
  _i2.TvSeriesEpisodeState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeTvSeriesEpisodeState_9(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.TvSeriesEpisodeState);

  @override
  _i4.Stream<_i2.TvSeriesEpisodeState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i4.Stream<_i2.TvSeriesEpisodeState>.empty(),
      ) as _i4.Stream<_i2.TvSeriesEpisodeState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void fetchEpisodeTv(
    int? id,
    int? season,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #fetchEpisodeTv,
          [
            id,
            season,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i2.TvSeriesEpisodeState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i5.Change<_i2.TvSeriesEpisodeState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
