// Mocks generated by Mockito 5.4.4 from annotations
// in tv_series/test/presentation/pages/popular_tv_series_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_bloc/flutter_bloc.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tv_series/tv_series.dart' as _i2;

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

class _FakeGetPopularTvSeries_0 extends _i1.SmartFake
    implements _i2.GetPopularTvSeries {
  _FakeGetPopularTvSeries_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePopularTvSeriesState_1 extends _i1.SmartFake
    implements _i2.PopularTvSeriesState {
  _FakePopularTvSeriesState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PopularTvSeriesCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockPopularTvSeriesCubit extends _i1.Mock
    implements _i2.PopularTvSeriesCubit {
  MockPopularTvSeriesCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetPopularTvSeries get getPopularTvSeries => (super.noSuchMethod(
        Invocation.getter(#getPopularTvSeries),
        returnValue: _FakeGetPopularTvSeries_0(
          this,
          Invocation.getter(#getPopularTvSeries),
        ),
      ) as _i2.GetPopularTvSeries);

  @override
  _i2.PopularTvSeriesState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakePopularTvSeriesState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.PopularTvSeriesState);

  @override
  _i3.Stream<_i2.PopularTvSeriesState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i3.Stream<_i2.PopularTvSeriesState>.empty(),
      ) as _i3.Stream<_i2.PopularTvSeriesState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void fetchPopularTvSeries() => super.noSuchMethod(
        Invocation.method(
          #fetchPopularTvSeries,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i2.PopularTvSeriesState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i4.Change<_i2.PopularTvSeriesState>? change) =>
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
  _i3.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}